$(() => {
  const backURL = 'http://localhost:8888/commu';
  const commuID = sessionStorage.getItem('commuID');
	
  /* 상단 탭 */
  {
    function switchTab(tabName) {  
      const tabContents = document.querySelectorAll('.commu_box');
      tabContents.forEach((content) => {
        content.style.display = 'none';
      });

      // 모든 탭에서 활성화 클래스를 제거합니다.
      const tabs = document.querySelectorAll('.tab');
      tabs.forEach((tab) => {
        tab.classList.remove('active');
      });

      // 선택한 탭 컨텐츠를 보이도록 설정합니다.
      var selectedTabContent = document.querySelector(`.${tabName}`);
      selectedTabContent.style.display = 'block';
      
      // 선택한 탭에 활성화 클래스를 추가합니다.
      const selectedTab = document.querySelector(`[data-tab=${tabName}]`);      

      selectedTab.classList.add('active');
    }

    // 탭에 클릭 이벤트 리스너를 추가합니다.
    const tabs = document.querySelectorAll('.tab');
    tabs.forEach((tab) => {
      tab.addEventListener('click', () => {
        const tabName = tab.getAttribute('data-tab');
        switchTab(tabName);
      });
    });

    // 페이지 로드 시 기본 탭을 설정합니다.
    switchTab('intro');
  }


  /* 커뮤 소개 로드*/
  $.ajax({
    url: `${backURL}/getcommuinfo`,
    method: 'POST',
    data: { commuID: commuID },
    success: (c) => {
      $('.introTitle').text(c.commuName);
      $('.mainImage').attr('src', `/resources/items/commu/commu_page/${c.commuID}.jpg`);
      
      if (c.commuCategory=='카테고리 소분류') 
      	c.commuCategory = '뭐든지';
      $('.introCategory').text('⚡' + c.commuCategory);
            
      if (c.commuLocation == null)
      	c.commuLocation = '지구';
      $('.introLocation').text('🌎' + c.commuLocation);  
      
      if(c.commuIntro == null)
        c.commuIntro = '';
      $('.introText').html('커뮤니티 소개: ' + c.commuIntro);         
    },
    error: (jqXhr, status) => {
      alert(`실패: ${status}\n오류명:${jqXhr.status}`);
    },
  });
  
   /* 커뮤 제약조건 로드*/
  $.ajax({
    url: `${backURL}/const`,
    method: 'POST',
    data: { commuID: commuID },
    success: (c) => {
 	  $('.commu_const').append(`<p>커뮤니티 안내사항: </p>`);
 	  $('.commu_const').append(`<p>😀커뮤니티 정원 ${c.memberCnt}/${c.capacity}</p>`);
 	  
 	  let gender; 
	    if (c.gender == 0 || c.gender == '') 
	    	gender = '👧남녀모두🧑';
		else if (c.gender == '1') 
			gender = '🧑남자만';
	  	else if (c.gender == '2') 
	  		gender = '👧여자만';
	  		  	  
	  $('.commu_const').append(`<p>${gender}</p>`);
 	  
	  let min;
	  let max;
	  let age_val;
	  min = (c.ageLimitMin <= 0) ? '' : c.ageLimitMin;
	  max = (0 == c.ageLimitMax) ? '' : c.ageLimitMax;
 	  if (min == '' && max == '')
		age_val = '나이제한없음';
	  else if (min == '' && max != '')
	  	age_val = `${min}세부터`;
  	  else if (min != '' && max == '')
	  	age_val = `${max}세까지`;
	  else
	  	age_val = `${min}세부터 ${max}세까지`;
 	  $('.commu_const').append(`<p>${age_val}</p>`);
    },
    error: (jqXhr, status) => {
      alert(`실패: ${status}\n오류명:${jqXhr.status}`);
    },
  });

  /*커뮤 게시글 로드*/
  $.ajax({
    url: `${backURL}/getpost`,
    method: 'POST',
    data: { commuID: commuID },
    success: (response) => {
      response.forEach((p) => {
        const clone = $('.boardBox_clone').clone().addClass('boardBox').removeClass('boardBox_clone');

        if (p.posttype == '1') 
    	  clone.find('.board_posttype').text('📖게시글');
        else if (p.posttype == '2')
          clone.find('.board_posttype').text('📖공지사항');
        else 
          alert('posttype 오류~');

        //쓰니
        clone.find('.board_writer').text('✍🏻' + p.writer);

        //작성시간
        {
          const dateTime = new Date(p.posttime);

          const year = dateTime.getFullYear();
          const month = ('0' + (dateTime.getMonth() + 1)).slice(-2);
          const day = ('0' + dateTime.getDate()).slice(-2);

          let period = '오전';
          let hours = dateTime.getHours();
          
          if (hours >= 12) {
            period = '오후';
            if (hours > 12) 
              hours -= 12;            
          }
          if (hours === 0) {
            hours = 12;
          }
          const minutes = ('0' + dateTime.getMinutes()).slice(-2);

          const resultTime = `${year}/${month}/${day} ${period}${hours}시${minutes}분`;

          clone.find('.board_posttime').text('⏰' + resultTime);
        }

        //제목
        clone.find('.boardTitleIntro').text(p.title);

        //사진
        clone.find('.boardimg').attr('src',`/resources/items/commu/commu_board/${p.commuid}-${p.commupostid}-1.jpg`);

        //텍스트
        clone.find('.boardText').html(p.text);

        $('.board_container').append(clone);
      });
    },
    error: (jqXhr, status) => {
      alert(`실패: ${status}\n오류명:${jqXhr.status}`);
    },
  });

  /* 히스토리 로드 */  
  var cnt = 0;
  {    
    while (cnt++ <= 30) {   
      const clone = $('.historyBox:first-child').clone();
      clone.find('.history_box_img').attr('src', `/resources/items/commu/commu_history/${commuID}-${cnt}.jpg`).css('display','none');                   	      
      $('.history_container').append(clone);          
    }
    $('.historyBox:first-child').css('display', 'none');
  }
          
  /* 이미지 로드 된 것만 block 처리*/
  $('.history_box_img').on('load', function(e) {
    $(e.target).css('display', 'block');
  });
	
  /* 커뮤니티 글쓰기 모달 버튼 동작 */
  $('.bmake_closebtn').click(()=> {    	
      $('.bmake_content').css('display', 'none');
  })


  /* 플러팅 버튼 */
  {
  	$('.float-box').html('');
	$('.float-box').append('<span class="float-item float-item1"><img src="/resources/items/floatitem/write.png" alt=""></span>');
	$('.float-box').append('<span class="float-item float-item1"><img src="/resources/items/floatitem/write.png" alt=""></span>');  
  }
});

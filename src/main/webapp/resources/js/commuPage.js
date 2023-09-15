$(() => {
  const backURL = 'http://localhost:8888/hf';

  const queryString = window.location.search;
  const urlParams = new URLSearchParams(queryString);
  const commuID = urlParams.get('commuID');

  /* 상단 탭 */
  {
    function switchTab(tabName) {
      // 모든 탭 컨텐츠를 숨깁니다.

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
      const selectedTabContent = document.querySelector(`.${tabName}`);
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

  /* 모임 생성 모달 */
  {
    $('.lmakebtn').on('click', () => {
      $('.lmake_content').css('display', 'block');
    });
    $('.lmake_closebtn').on('click', () => {
      $('.lmake_content').css('display', 'none');
    });
  }

  /* 모임 참가 모달 */
  {
    $('.ljoinbtn').on('click', () => {
      $('.ljoin_content').css('display', 'block');
    });
    $('.ljoin_closebtn').on('click', () => {
      $('.ljoin_content').css('display', 'none');
    });
  }

  /* 커뮤 소개 로드*/
  $.ajax({
    url: `${backURL}/getcommuinfo`,
    method: 'POST',
    data: { commuID: 4 },
    success: (c) => {
      $('.introTitle').text(c.commuName);
      $('.introText').html(c.commuIntro);
      $('.mainImage').attr('src', `../img/commu/commu_page/${c.commuID}.jpg`);
      $('.introCategory').text('⚡' + c.commuCategory);
      $('.introLocation').text('🌎' + c.commuLocation);
    },
    error: (jqXhr, status) => {
      alert(`실패: ${status}\n오류명:${jqXhr.status}`);
    },
  });

  /*커뮤 게시글 로드*/
  $.ajax({
    url: `${backURL}/getpost`,
    method: 'POST',
    data: { commuID: 4 },
    success: (response) => {
      response.forEach((p) => {
        /* 클론 후 append */
        const clone = $('.boardBox_clone')
          .clone()
          .addClass('boardBox')
          .removeClass('boardBox_clone');

        //posttype
        if (p.posttype == '1') clone.find('.board_posttype').text('📖게시글');
        else if (p.posttype == '2')
          clone.find('.board_posttype').text('📖공지사항');
        else alert('posttype 오류~');

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
            if (hours > 12) {
              hours -= 12;
            }
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
        clone
          .find('.boardimg')
          .attr(
            'src',
            `../img/commu/commu_board/${p.commuid}-${p.commupostid}-1.jpg`
          );

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
  var cnt = 1;
  {    
    while (cnt++ <= 87) {   
      const clone = $('.historyBox:first-child').clone();
      clone.find('.history_box_img').attr('src', `../img/moment/${cnt}.jpg`);
      $('.history_container').append(clone);
    }
  }
});

$(() => {
    const formObj = $('form.login_form');  
    $(formObj).submit(() => {
      $.ajax({
        url: 'http://localhost:8888/hf/login', 
        method: 'POST',
        data: formObj.serialize(), //form내에 input태그들의 name과 value를 매핑
  
         //response: back -> front로 넘겨준 데이터(작명을 임의로 response라고 함)
         //맵으로 넘겨줬을시 response.id, response.state등으로 key값으로 value를 찾으면 됨.
        success: (response) => {  
          //alert(response.loginID);
          if (response.state == '1') {
            alert(response.loginID+'님 환영합니다');            
            location.href = './navbar.html';
          }
          else if (response.state == '0') {
            alert('아이디 또는 비번이 틀렸습니다!');
          } else if (response.state == '2') {
            alert('차단 당한 계정입니다.');
          }
        },
        error: (jqXhr, status) => {
          alert(`실패: ${status}\n오류명:${jqXhr.statusCode}`);
        },
      });
      //ajax는 비동기 방식이라 데이터가 백으로 갔다가 올 때 까지 다른 작업을 진행하는데
      //데이터를 받기전에 form이 다른페이지로 넘어가면 오류가 발생함.
      //그래서 return false로 막아두고 location.href로 페이지 이동.
      return false;
    });
  });

  $(() => {
    const modal = document.getElementById('modalWrap');
    const closeBtn = document.getElementById('closeBtn');

    // 탭 전환 기능 설정
    function switchTab(tabName) {
        $('.list').hide();
        $('.tab').removeClass('active');
        $(`.${tabName}`).show();
        $(`[data-tab=${tabName}]`).addClass('active');
    }

    $('.tab').click(function() {
        const tabName = $(this).attr('data-tab');
        switchTab(tabName);
    });

    // 페이지 로드 시 기본 탭 설정
    switchTab('community');

    // 커뮤니티 데이터를 가져와서 박스 생성
    $.ajax({
        url: '/commulist', // 실제 API 엔드포인트 입력
        method: 'GET',
        dataType: 'json',
        success: function(data) {
            data.forEach(function(community) {
                const communityBox = $('<div class="commuBox"></div>');
                const communityName = $(`<p class="commuName">${community.commuName}</p>`);
                const communityImage = $(`<img src="${community.imagePath}" alt="${community.commuName}" class="img">`);
                const communityIntro = $('<div class="introduce"></div>');
                communityIntro.append(`<p class="commuintro">${community.commuIntro}</p>`);
                // 여기에 더 많은 데이터를 추가로 생성하고 채우는 로직 추가 가능

                communityBox.append(communityName, communityImage, communityIntro);
                $('.list.community').append(communityBox);

                // 커뮤니티 박스 클릭 시 모달 열기
                communityBox.click(function() {
                    modal.style.display = 'block';
                    // 모달에 데이터 채우는 로직 추가
                });
            });
        },
        error: function(xhr, status, error) {
            console.error('AJAX error:', error);
        }
    });

    // 모달 닫기 버튼 처리
    $('.modalclose').click(function() {
        modal.style.display = 'none';
    });
});
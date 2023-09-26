$(() => {
    const modal = document.getElementById('modalWrap');
    const closeBtn = document.getElementById('closeBtn');
    const commubox = $('.commuBox');
    const feedContent = $('.commuevery');
    var commuID;
    
    //AJAX로 서버에서 데이터 가져오기
    $.ajax({
        url: '/community/getlist', // API 엔드포인트
        method: 'GET',
        dataType: 'json',
        success: (response) => {
            // 서버에서 받은 데이터(response) 활용하여 동적으로 커뮤니티 박스 생성 및 추가
            response.forEach((community) => {
            
                commuID = community.commuID;
                const communityBox = $('.commuBox_clone').clone().addClass('commuBox').removeClass('commuBox_clone');
                
                communityBox.find('.commuName').html(community.commuName); // 커뮤니티 이름 설정
                communityBox.find('.img').attr('src', `/resources/items/commu/commu_page/${commuID}.jpg`); // 이미지 설정
                communityBox.find('.commuintro').html(community.commuIntro); // 커뮤니티 소개 설정
                communityBox.append(`<p style="display:none" class="commuID">${commuID}</p>`)
                
                // 커뮤니티 박스 클릭 시 모달 열기
                communityBox.click(function(e) {                
                	commuID = $(this).find('.commuID').text();
                
                    modal.style.display = 'block';
                    // 모달 내용 채우기
                    $('.modaltitle').html(community.commuName);
                    if (community.commuLocation === null) {
                        $('.modalaround').html(`#${community.commuCategory}`);
                    } else {
                        $('.modalaround').html(`#${community.commuCategory} | ${community.commuLocation}`);
                    }
                    $('.modalimg').attr('src', `/resources/items/commu/commu_page/${commuID}.jpg`);
                    $('.modalintro2').html(community.commuIntro);
                    $('.commumember').html(`정원 ${community.memberCount}/${community.maxMember}`);
                });
                
                $('.commuevery .list.community').append(communityBox);
                $('#community').append(communityBox);
            });
        },
        error:(xhr, status, error) => {
            console.error('AJAX error:', error);
        }
    });
    
    $('#commuSignup').click(function(e) {
    	sessionStorage.setItem('commuID', commuID);
    
        $.ajax({
            url: 'http://localhost:8888/commupage', // 불러올 페이지의 경로
            method: 'get', // GET 요청
            data: { commuID: commuID },            
            success: (response) => {                 	
                modal.style.display = 'none';
                feedContent.html(response); // 페이지 내용을 .feed_content에 삽입
            },
            error: (jqXhr, status) => {
                alert(`실패: ${status}\n오류명: ${jqXhr.statusCode}`);
            },
        });
    });
    
    // 모달 닫기 버튼 처리
    $('.modalclose').click(() => {
        modal.style.display = 'none';
    });
    
    // 탭 기능 추가
    function switchTab(tabName) {
        // 모든 탭 컨텐츠를 숨깁니다.
        $('.list').hide();
        
        // 모든 탭에서 활성화 클래스를 제거합니다.
        $('.tab').removeClass('active');
        
        // 선택한 탭 컨텐츠를 보이도록 설정합니다.
        $(`.${tabName}`).show();
        
        // 선택한 탭에 활성화 클래스를 추가합니다.
        $(`[data-tab=${tabName}]`).addClass('active');
    }
    
    // 탭에 클릭 이벤트 리스너를 추가합니다.
    $('.tab').click(function () {
        const tabName = $(this).attr('data-tab');
        switchTab(tabName);
    });
    
    // 페이지 로드 시 기본 탭을 설정합니다.
    switchTab('community');
});

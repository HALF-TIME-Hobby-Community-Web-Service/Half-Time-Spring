$(() => {
    const modal = document.getElementById('modalWrap');
    const closeBtn = document.getElementById('closeBtn');
    const commubox = $('.commuBox');
    const feedContent = $('.commuevery');
    var commuID;    
    let session = '';
    
    
    $.ajax({
        url: 'http://localhost:8888/getSession',       
        dataType: 'text',   
        success: (response) => { 
        	if (response != '')
        		session = response;
    	},
        error: (jqXhr, status) => {
            swal('오류', '세션 에러', 'error');
        }
    });    
    
    
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
                	commuID = community.commuID;
                	$.ajax({
				        url: 'http://localhost:8888/community/check_joined',
				        data: {commuID: commuID},       
				        dataType: 'text',   
				        success: (response) => { 
				        	if (response == 'JOINED') {
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
				        	}
				    	},
				        error: (jqXhr, status) => {
				            swal('오류', '멤버 체크 에러', 'error');
				        }
			   		 });
                                             
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
    	if (session != '') {
    		sessionStorage.setItem('commuID', commuID);
    		$('.cjoin_content').css('display','block');
    		const title = $('.modaltitle').text();
    		$('.commutitle').text(title);
    	}
    	else
    	    swal('오류', '로그인을 해주세요~', 'warning');
    });
    
    // 모달 닫기 버튼 처리
    $('.modalclose').click(() => {
        modal.style.display = 'none';
    });
   
   
   $('.clist-float').on('click', function() {
   		$('.cmake_content').css('display', 'block');
   });

});

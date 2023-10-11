$(() => {
    const momentWriteBtn = $('.float-item1');
    const momentWriteCloseBtn = $('.closeBtn');
    const momentWrite = $('.modalWrap');
    const memberListClick = $('.memberList');
    let momentmodal;
    let momentmodalAll;
    const container = $('.feed_container_append');
    var state = true;
    

    
     $('body').append(
                        '<div class="feed_modal_content" id = "momentmodal">' +
                        '<div class="feed_modal_img_box">'+
                        '<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">' +
                        '<div class="carousel-indicators">' +
                        '<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"' +
                        'aria-current="true" aria-label="Slide 1"></button>' +
                        '<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"' +
                        'aria-label="Slide 2"></button>' +
                        '<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"' +
                        'aria-label="Slide 3"></button>' +
                        '<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3"' +
                        'aria-label="Slide 4"></button>' +
                        '<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4"' +
                        'aria-label="Slide 5"></button>' +
                        '</div>' +
                        '<div class="carousel-inner">' +
                        '<div class="carousel-item active">' +
                        '<img src="" class="d-block w-100" alt="...">' +
                        '</div>' +
                        '<div class="carousel-item">' +
                        '<img src="" class="d-block w-100" alt="...">' +
                        '</div>' +
                        '<div class="carousel-item">' +
                        '<img src="" class="d-block w-100" alt="...">' +
                        '</div>' +
                        '<div class="carousel-item">' +
                        '<img src="" class="d-block w-100" alt="...">' +
                        '</div>' +
                        '<div class="carousel-item">' +
                        '<img src="" class="d-block w-100" alt="...">' +
                        '</div>' +
                        '</div>' +
                        '<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"' +
                        'data-bs-slide="prev">' +
                        '<span class="carousel-control-prev-icon" aria-hidden="true"></span>' +
                        '<span class="visually-hidden">Previous</span>' +
                        '</button>' +
                        '<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"' +
                        'data-bs-slide="next">' +
                        '<span class="carousel-control-next-icon " aria-hidden="true"></span>' +
                        '<span class="visually-hidden">Next</span>' +
                        '</button>' +
                        '</div>' +
                        
                        '</div>'+
                        '<div class="feed_modal_container">' +
                        '<div class="feed_modal_box">' +
                        '<div class="feed_modal_title">' +
                        '<div class="feed_modal_title_name">✍</div>' +
                        '<div class="feed_modal_title_date"></div>' +
                        '<div class="feed_modal_title_time"></div>' +
                        '<div class="feed_modal_title_category"></div>' +
                        '<div class="feed_modal_title_location"></div>' +
                        '</div>' +
                        '<div class="feed_comment_box">' +
                        '<div class="feed_comment_top">' +
                        '<img class="feed_comment_top_heart" src="/resources/items/feed/comment/heart.svg" alt="좋아요버튼">' +
                        '<img class="feed_comment_top_comment" src="/resources/items/feed/comment/chat.svg" alt="댓글버튼">' +
                        '<img class="feed_comment_top_send" src="/resources/items/feed/comment/send.svg">' +
                        '<img class="feed_comment_top_add" src="/resources/items/comment/three-dots.svg" alt="더보기버튼">' +
                        '</div>' +
                        '</div>' +
                        '<div class="feed_modal_text_box">' +
                        '<div class="feed_modal_text">' +
                        '</div>' +
                        '</div>' +
                        '<div class="feed_comment_bottom">' +
                        '<div class="feed_comment_bottom_box">' +
                        '<div class="feed_comment_user">신유리</div> :&nbsp;' +
                        '<div class="feed_comment">아, 한자리 더 있습니다!</div>' +
                        '</div>' +
                        '<div class="feed_comment_bottom_box">' +
                        '<div class="feed_comment_user">이수완</div> :&nbsp;' +
                        '<div class="feed_comment">남자도 가능한가요?</div>' +
                        '</div>' +
                        '<div class="feed_comment_bottom_box">' +
                        '<div class="feed_comment_user">신유리</div> :&nbsp;' +
                        '<div class="feed_comment">여자만 가능해요</div>' +
                        '</div>' +
                        '</div>' +
                        '</div>' +
                        '</div>' +
                        '</div>'+
                        '<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>'
                    ); 
                    $('.feed_modal_content').remove();
	

	$(window).on("click", function(e) {
    	if ($(e.target).is($('.feed_modal_closebtn')) ) {
	    	momentmodal.remove();
	    	state=true;
	    }
	    else if ($(e.target).is($('.feed_modal_a_name')) ) {
	  		e.preventDefault();
	    	const idLink = $(e.target); 
		    const value = idLink.text();
		
		  $.ajax({
			url: "/user/userpage",
			type: "post",
			data: { value: value },
			success: function (response) {
			  $('.feed_content').append(response);
			},
			error: function (jqXhr, status) {
				alert('없는 유저 입니다!');
			}
		  });
	    }		       
    });

    $(document).on("click", ".feed_container_append", function (e) {
    
    	 if ($(e.target).is("a")) {
    	  // 클릭한 요소가 <a> 태그인 경우 아무 처리도 하지 않음
   		  return;
  		}
    
        console.log("feed_container_append Clicked");
        var clickedFeedContainer = e.currentTarget;
        var clickedTarget = e.target.className;
        var momentid = parseInt(clickedFeedContainer.id);
        console.log(momentid);
        if (clickedTarget === "carousel-control-prev" || clickedTarget === "carousel-control-next" || clickedTarget === "carousel-control-prev-icon" || clickedTarget === "carousel-control-next-icon"||clickedTarget === "feed_container_append") {
            return; // continue 대신에 return을 사용
        } else {
            $.ajax({
                url: 'http://localhost:8888/moment/modal',
                method: 'POST',
                data: { momentID: momentid },
                dataType: "json",
                success: function (data) {
                    if (!state) {
                        return;
                    }
                    var newItem = $('body');
                    newItem.append(
                    '<div class="feed_modal_content" id = "momentmodal">' +
                        '<div class="feed_modal_img_box">'+
                       	 	'<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">' +
                        		'<div class="carousel-indicators">' +
                       				'<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"' +
                        				'aria-current="true" aria-label="Slide 1"></button>' +
                        			'<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"' +
                        				'aria-label="Slide 2"></button>' +
                        			'<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"' +
				                        'aria-label="Slide 3"></button>' +
			                        '<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3"' +
				                        'aria-label="Slide 4"></button>' +
			                        '<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4"' +
				                        'aria-label="Slide 5"></button>' +
                       			'</div>' +
                        		'<div class="carousel-inner">' +
                        			'<div class="carousel-item active">' +
                        				'<img class="imgslide" src="' + data.contentPath1 + '" class="d-block w-100" alt="...">' +
                    				'</div>' +
                        			'<div class="carousel-item">' +
			                   		    '<img class="imgslide" src="' + data.contentPath2 + '" class="d-block w-100" alt="...">' +
			                        '</div>' +
			                        '<div class="carousel-item">' +
			                      		'<img class="imgslide" src="' + data.contentPath3 + '" class="d-block w-100" alt="...">' +
			                        '</div>' +
			                        '<div class="carousel-item">' +
			                        	'<img class="imgslide" src="' + data.contentPath4 + '" class="d-block w-100" alt="...">' +
			                        '</div>' +
			                        '<div class="carousel-item">' +
			                        	'<img class="imgslide" src="' + data.contentPath5 + '" class="d-block w-100" alt="...">' +
			                        '</div>' +
		                        '</div>' +
                       			'<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"' +
                        			'data-bs-slide="prev">' +
		                        	'<span class="carousel-control-prev-icon" aria-hidden="true"></span>' +
			                        '<span class="visually-hidden">Previous</span>' +
		                        '</button>' +
                        		'<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"' +
                        			'data-bs-slide="next">' +
			                        '<span class="carousel-control-next-icon " aria-hidden="true"></span>' +
			                        '<span class="visually-hidden">Next</span>' +
                        		'</button>' +
                        	'</div>' +
                        '</div>'+
                        '<div class="feed_modal_container">' +
  						 	'<div class="feed_modal_title">' +
	  							'<div>' +
	  								'👦🏻<a href="" class="feed_modal_a_name">'+data.writer+'</a>' +
	  								 '<button class="feed_modal_closebtn btn">X</button>' +
	  							'</div>' +
	  							'<hr>' +
	  							'<div style="font-size:15px;margin-top: 10px;">' +
		  							'<span class="feed_modal_category">😘자기과시</span>' +
		  							'<span class="feed_modal_location">🌎경기도 동탄시</span>' +
								'</div>' +
		        				'<div class="feed_modal_feedtext">'+data.text+'</div>' +        
		  						'</div>' +
	  						'<hr>' +
	  						'<div class="feed_modal_comment_container">' +
		  						'<div class="feed_modal_comment_box">' +
		  						'<div>' +
			  						'<span class="comment_writer"> <a href="" class="feed_a_name">moon_bomi</a> </span>'  +
			  						'<span class="comment_time">3시간</span>' +
	  							'</div>'  +
	  							'<span class="comment_text"></span>'  +
	  						'</div>'  +
	  						'<div class="feed_modal_comment_box">' +
	  							'<div>' +
	  								'<span class="comment_writer"> <a href="" class="feed_a_name">china_yerim</a> </span>' +
	  								'<span class="comment_time">5시간</span>' +
	  							'</div>' +
	  							'<span class="comment_text">Hen piaoliang~</span>' +
	  						'</div>' +
							'<div class="feed_modal_comment_box">' +
	  							'<div>' +
	  								'<span class="comment_writer"> <a href="" class="feed_a_name">안세준</a> </span>' +
	  								'<span class="comment_time">6시간</span>' +
	  							'</div>'  +
	  							'<span class="comment_text">집 가고 싶다</span>' +
	  						'</div>' +
	  						'<div class="feed_modal_comment_write">' +
	  							'<form class="comment_form" action="">' +
	  								'<input class="feed_modal_comment_write_input form-control" style="width:80%; display:inline;">' +
	  								'<button class="btn" style="width: 19.5%; color:blue; display: inline-block; float:right;">게시</button>' +
								'</form>' +
	  						'</div>' +
						'</div>' +
	  					'<hr>' +
						'<div class="feed_modal_items">' +
							'<button class="btn">' +
	    						'<img class="feed_comment_top_heart" src="/resources/items/feed/comment/heart.svg" alt="좋아요버튼">' +
	        				'</button>' +
	        				'<button class="btn">' +
	        					'<img class="feed_comment_top_comment" src="/resources/items/feed/comment/chat.svg" alt="댓글버튼">' +
	        				'</button>' +
	        				'<button class="btn">' +
	        					'<img class="feed_comment_top_send" src="/resources/items/feed/comment/send.svg">' +
	        				'</button>' +
	        				'<button class="btn">' +
	        					'<img class="feed_modal_etc" src="/resources/items/feed/comment/three-dots.svg" alt="더보기버튼">' +
	        				'</button>' +
						'</div>' +    	
  					'</div>' +
                    '<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>'
                    );
                    console.log(newItem);
                    state = false;
                    momentmodalAll = $('.feed_modal_content *');
                    momentmodal = $('.feed_modal_content');
                }
            });
            
            
            
        }
    });
    
    

    
});

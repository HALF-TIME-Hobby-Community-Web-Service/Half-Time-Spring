<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/resources/css/moment_write.css">
<link rel="stylesheet" href="/resources/css/modal.css">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="/resources/js/moment_write.js"></script>

  <div class="modal_content mmake_content">
    <div class="modal_title bmake_title"> 
	   	⏰모먼트 작성 
       	<span class="modal_closebtn mmake_closebtn">&times;</span>
	</div>
    
    <div class="modal_container b_container">
      <form class="modal_moment_upload" method="post" action="">   
      
      	<!-- 모먼트 내용 -->
        <div class="form-floating mb-3">
        	<textarea id="uploadText" class="form-control modal_textarea mmake_text" name="text"
          		placeholder="게시글 내용" style="width: 100%; height: 200px" required></textarea>
        </div>
        <div class="category">
        <!-- 카테고리 -->
        <div class="form-floating mb-3 largecategory">
	        <select name="" class="form-select selectLargeCategory">
		        <option value="category">대분류</option>
			</select>
		</div>
		<div class="form-floating mb-3 smallcategory">
	        <select name="category" class="form-select selectSmallCategory">
		        <option value="category">소분류</option>
			</select>
		</div>
		</div>
		<!-- 지역 -->
		<input class="form-control" name="location" placeholder="지역을 작성해주세요" required>		
		
		<!-- 이미지토글 -->
		<div class="mmake_img_container">
			<div class="mmake_img_box">			
				<img class="m_img" src="/resources/items/moment/moment_default.png"/>				
			</div>			
		<script>
		
      function setThumbnail(event) {
        for (var image of event.target.files) {
          var reader = new FileReader();

          reader.onload = function(event) {
            var img = document.createElement("img");
            
            img.setAttribute("src", event.target.result);
            img.setAttribute("class","m_img")
            document.querySelector("div#mmake_img_box").appendChild(img);
          };

          console.log(image);
          reader.readAsDataURL(image);
        }
      }
    </script>
			<input type="file" class="input_file" style="display: none" multiple accept="image/*" /> 
		</div>

        <div class="modal_button_container mmake_button_container" style="border-top: 1px solid;">
          <button class="btn btn-primary moment_write_btn" type="button">완료</button>
        </div>
                
      </form>
    </div>
  </div>
  
  <script>
	  //닫기 버튼
	  $('.mmake_closebtn').click(()=> {    	
	    $('.mmake_content').css('display', 'none');
	  })
  
  	  $(function(){
	  	$('.modal_content').draggable({'cancel':'.modal_container', containment:'parent', scroll:false});
	  });
  </script>
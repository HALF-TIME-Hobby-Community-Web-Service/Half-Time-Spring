<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>

<link rel="stylesheet" href="/resources/css/moment_write.css">
<link rel="stylesheet" href="/resources/css/modal.css">

<script src="/resources/js/moment_write.js"></script>

</head>

<body>
  <div class="modal_content mmake_content">
    <div class="modal_title bmake_title"> 
	   	⏰모먼트 작성 
       	<span class="modal_closebtn mmake_closebtn">&times;</span>
	</div>

    
    <div class="modal_container b_container">
      <form method="post" action="">   
        <div class="form-floating mb-3">
        	<textarea name="text" class="form-control modal_textarea mmake_text" 
          		placeholder="게시글 내용" style="width: 100%; height: 200px" cols="40" wrap="hard"></textarea>
        </div>
        
        <div class="form-floating mb-3">
	        <select name="" class="form-select">
		        <option value="category">카테고리</option>
			    <option value="info">스포츠</option>
			</select>
		</div>
		
		<div class="form-floating mb-3">
	        <select name="" class="form-select">
		        <option value="category">지역</option>
			    <option value="seoul">서울시</option>
			    <option value="gyoungi">경기도</option>
			</select>
		</div>
		
		<div class="mmake_img_container">
			<div class="mmake_img_box">			
				<img class="m_img" src="/resources/items/moment/moment_default.png"/>
				<img class="m_img" src="/resources/items/moment/moment_default.png"/>
				<img class="m_img" src="/resources/items/moment/moment_default.png"/>
				<img class="m_img" src="/resources/items/moment/moment_default.png"/>
				<img class="m_img" src="/resources/items/moment/moment_default.png"/>
			</div>			
			<input type="file" class="input_file" style="display: none" multiple /> 
		</div>

        <div class="modal_button_container mmake_button_container" style="border-top: 1px solid;">
          <button class="btn btn-primary">완료</button>
        </div>
                
      </form>
    </div>
  </div>
  
    <script>

    </script>	
</body>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!-- 게시물 추가 -->
  <div class="modal_content bmake_content">
    <div class="modal_title bmake_title"> 🎴게시글 작성<span class="modal_closebtn bmake_closebtn">&times;</span></div>
    
    <div class="modal_container b_container">
      <form method="post"  class="commu_upload_form" enctype="multipart/form-data">      
              
        <div class="form-floating mb-3">
	        <select name="" class="form-select commucategory">
		        <option value="0">카테고리</option>
			    <option value="1">공지사항</option>
			    <option value="2">게시글</option>
			    <option value="3">히스토리</option>
			</select>
		</div>
      
        <div class="form-floating mb-3">
          <fieldset>
            <input name="title" class="form-control bmake_name"  placeholder="제목(40자)"/>
          </fieldset>
        </div>

        <div class="form-floating mb-3">
          <textarea name="text" class="form-control modal_textarea bmake_text" placeholder="게시글 내용" style="width: 100%; height: 200px" cols="40" wrap="hard"></textarea>
        </div>
        
		<div class="form-floating " style="border-top: 1px solid;">          
        </div>        
        
     	<!-- 이미지토글 -->
		<div class="bmake_img_container">
			<div class="bmake_img_box" >			
				<img class="b_img" src="/resources/items/moment/moment_default.png" style="width: 200px; margin-left:35%;"/>
			</div>			
			<input type="file" class="input_file2" id="commu_board_file" style="display: none" multiple accept="image/*" /> 
		</div>
        
        <div class="modal_button_container bmake_button_container" style="border-top: 1px solid;">
          <button class="btn btn-primary commu_upload_btn" type="button">완료</button>
        </div>
                
      </form>
    </div>
  </div>
  
  <script>
/*   $(function(){
  	$('.bmake_content').draggable({'cancel':'.b_container', containment:'parent', scroll:false});
  }); */ 
  
  
  $('.bmake_closebtn').click(()=>{
	  $('.bmake_content').css('display','none');
  })			
  </script>
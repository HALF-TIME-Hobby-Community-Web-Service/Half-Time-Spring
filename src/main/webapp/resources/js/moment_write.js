$(() => {

	//닫기 버튼
	$('.mmake_closebtn').click(()=> {    	
        $('.mmake_content').css('display', 'none');
    })
    
    //input file
    const input = $('.input_file');
    let img_cnt = 0; 
    
    $('.m_img').click(()=> {
    	if (5 <= img_cnt) {
    		alert('올릴 수 있는 사진은 5개까지 입니다!');
    		return;
    	}
    	input.click(); 	
    })


	//TODO
 	input.change(function (e) {  	       
		$('.m_img').attr('src', '/resources/items/moment/1.jpg');	               	        
  
    	img_cnt++;	   
    });
    
    /*
	var reader = new FileReader();
    reader.onload = function (e) {
    	$('.m_img')[img_cnt].attr('src', e.target);
	}
        
    reader.readAsDataURL(input.files[0]);      
    */
	
})
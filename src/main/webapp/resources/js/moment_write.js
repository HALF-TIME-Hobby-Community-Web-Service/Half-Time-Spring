$(() => {


    
    //input file
    const input = $('.input_file');
    let img_cnt = 0; 
    
    $('.m_img').click(function() {       
    	if (5 <= img_cnt) {
    		alert('올릴 수 있는 사진은 5개까지 입니다!');
    		return;
    	}
    	input.click(); 	
    })

 	input.change(function (e) {   	
 	
 		const file = input.files[0];
 	 	
 		$(`.m_img:eq(${img_cnt})`).attr('src', `/resources/img/moment/61.jpg`);
 	
 		if (file && file.type.startsWith('image/')) {
 		
	 		const reader = new FileReader();
 		
		    alert('123');
		     reader.onload = function(e) {
		    	//$(`.m_img:eq(${img_cnt})`).attr('src', `/resources/img/moment/61.jpg`);
			}	 	       
    		reader.readAsDataURL(file); 		             
        }
             	          
    	img_cnt++;
    });
    

	
})
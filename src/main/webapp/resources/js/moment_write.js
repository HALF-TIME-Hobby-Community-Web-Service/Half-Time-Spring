$(() => {
    // input file
    const input = $('.input_file');
    let img_cnt = 0;

    $('.m_img').click(function() {
        if (5 <= img_cnt) {
            alert('올릴 수 있는 사진은 5개까지 입니다!');
            return;
        }
        input.click();
    });

    // TODO
    input.change(function (e) {

        const file = input[0].files[0];

        alert(file);

        if (file && file.type.startsWith('image/')) {

            const reader = new FileReader();

            alert('123');
            reader.onload = function(e) {
                //$(`.m_img:eq(${img_cnt})`).attr('src', `/resources/img/moment/61.jpg`);
            };

            reader.readAsDataURL(file);
        }

        img_cnt++;
    });

    const LargeCate = $('.selectLargeCategory');
   	const MiddleCate = $('.selectMiddleCategory');
   	const SmallCate = $('.selectSmallCategory'); 
   
   
    $('.float-item1').click(() => {
        $.ajax({
            url: 'http://localhost:8888/moment/modal_LargeCategory',
            method: 'POST',
            dataType: "json",
            success: function (data) {
                $.each(data, function (index, item) {
   					 LargeCate.append('<option value="'+ item +'">'+ item +'</option>');
				});
            },error: function(error) {
                        console.log("largeCategory error");
            console.error('데이터를 가져오는 중 오류가 발생했습니다:', error);
        }
        });
    });
    $('.middlecategory').click(() => {
        $.ajax({
            url: 'http://localhost:8888/moment/modal_MiddleCategory',
            method: 'POST',
            data:{largecate:LargeCate.val()},
            dataType: "json",
            success: function (data) {
           	 	MiddleCate.html('');
            	$.each(data, function (index, item) {	 
   					 MiddleCate.append('<option value="'+ item +'">'+ item +'</option>');
				});
            },error: function(error) {
                        console.log("middleCategory error");
            console.error('데이터를 가져오는 중 오류가 발생했습니다:', error);
        }
        });
    });
     $('.smallcategory').click(() => {
        $.ajax({
            url: 'http://localhost:8888/moment/modal_SmallCategory',
            method: 'POST',
            data:{middlecate:MiddleCate.val()},
            dataType: "json",
            success: function (data) {
           	 	SmallCate.html('');
            	$.each(data, function (index, item) {	 
   					 SmallCate.append('<option value="'+ item +'">'+ item +'</option>');
				});
            },error: function(error) {
            console.log("smallCategory error");
            console.error('데이터를 가져오는 중 오류가 발생했습니다:', error);
        }
        });
    });
    
    const upload = $('.moment_write_btn');
    const modal_form = $('.modal_moment_upload')
    const text = $('.mmake_text')
    
    upload.click((e)=>{
    
    e.preventDefault();
    $('.mmake_content').css('display', 'none');
    	$.ajax({
    		url: 'http://localhost:8888/moment/momentUpload',
    		method : 'POST',
    		data: { text : text.val(),
    				category : $('.smallcategory').val(),
    				
    				
    		}, 
    		success: function(data){
    			alert("업로드가 완료되었습니다.");
    			
    			
    		},error:function(error){
            console.error('데이터를 가져오는 중 오류가 발생했습니다:', error);    		
    		}
    	})
    
    })
});

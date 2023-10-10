$(() => {
	let writer;
    $.ajax({
        url: 'http://localhost:8888/getSession',
        method: 'GET',
        dataType: "text",
        success: function (data) {
            writer = data;
        },
        error: function (error) {
            console.log("get Session error");
            console.error('데이터를 가져오는 중 오류가 발생했습니다:', error);
        }
    });

    // input file
    const input = $('.input_file');
    let img_cnt = 0;

    $('.b_img').click(function () {
        if (5 <= img_cnt) {
            alert('올릴 수 있는 사진은 5개까지 입니다!');
            return;
        }
        input.click();
    });

    // TODO
    input.change(function (e) {
        const file = input[0].files[0];

        if (file && file.type.startsWith('image/')) {
            const reader = new FileReader();

            reader.onload = function (e) {
                //$(`.m_img:eq(${img_cnt})`).attr('src', `/resources/img/moment/61.jpg`);
            };

            reader.readAsDataURL(file);
        }

        img_cnt++;
    });

   
    const upload = $('.commu_upload_btn');
    const modal_form = $('.commu_upload_form');
    const thumbnail = $(".b_img");
	
	
    upload.on("click", function (e) {
     e.preventDefault();
    console.log("wadawdawdawd");
        const category = $('.commucategory').val();
        const text = $('.bmake_text').val();
		const commuid = sessionStorage.getItem('commuID');
		const title = $('.bmake_name').val();
        
       
        
        
        if(text==''){
        alert("내용을 작성해주세요");
        return;
        }else if(category==''){
        	alert("카테고리를 정해주세요");
        	return;
        }else if(writer==''){
        	alert("로그인 해주세요.");
        	return;
        }
        
        var formData = new FormData();
        var inputFiles = $('.input_file')[0].files; // 파일 input에서 선택한 파일들을 가져옴

        for (var i = 0; i < inputFiles.length; i++) {
            formData.append('files', inputFiles[i]); // 'files'라는 이름으로 파일 데이터를 추가
        }
		alert(category);
        formData.append("text", text);
        formData.append("writer", writer);
        formData.append("contenttype", category);
        formData.append("commuid", commuid);
        formData.append("title",title)
		
		console.log("contenttpye : "+title);
        $.ajax({
            url: 'http://localhost:8888/commu/commuUploads3',
            method: 'POST',
            data: formData,
            processData: false, // 데이터 처리 비활성화
            contentType: false, // 컨텐츠 유형 설정 비활성화
            success: function (data) {
                    $('.mmake_content').css('display', 'none');
                    alert("업로드가 완료되었습니다.");
                  location.href = "/hf";            
            },
            error: function (error) {
                
            }
        });

    });
	
})
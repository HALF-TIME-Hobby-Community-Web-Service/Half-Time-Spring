$(document).ready(function() {
    var userid;
    var nickname;
    var commuid = sessionStorage.getItem('commuID');
	var isloading= false;
	var posttype;
	var contenttype;
	
    function getSessionData() {
        return $.ajax({
            url: 'http://localhost:8888/getSession',
            method: 'GET',
            dataType: 'text'
        });
    }

    function getNickname(userid) {
        return $.ajax({
            url: 'http://localhost:8888/commu/communame',
            method: 'POST',
            data: {
                'userid': userid,
                'commuid': commuid
            },
            dataType: 'text'
        });
    }

     function handleUpload(nickname) {
        posttype = $('.commucategory').val();
        
        const text = $('.bmake_text').val();
        const title = $('.bmake_name').val();
        

        if (text === '') {
            alert('내용을 작성해주세요');
            return $.Deferred().reject('내용을 작성해주세요').promise();
        } else if (contenttype === '') {
            alert('카테고리를 정해주세요');
            return $.Deferred().reject('카테고리를 정해주세요').promise();
        } else if (writer === '') {
            alert('로그인 해주세요.');
            return $.Deferred().reject('로그인 해주세요').promise();
        }
	
		if(posttype=="1"){
			contenttype="3";
		}else if(posttype=="2"){
			contenttype="4";
		}else if(posttype=="3"){
			contenttype="5";
		}else{
		alert("카테고리를 선택해주세요.");
		return;
		}

        const formData = new FormData();
        const inputFiles = $('#commu_board_file')[0].files;

        for (let i = 0; i < inputFiles.length; i++) {
            formData.append('files', inputFiles[i]);
        }

        formData.append('text', text);
        formData.append('writer', nickname);
        formData.append('contenttype', contenttype);
        formData.append('commuid', commuid);
        formData.append('title', title);
		formData.append('posttype', posttype);
        return $.ajax({
            url: 'http://localhost:8888/commu/commuBoardUploads3',
            method: 'POST',
            data: formData,
            processData: false,
            contentType: false,
        });
    }
    
    $('.b_img').click(() => {
        $('.input_file2').click();
    });

    $('.commu_upload_btn').click(function(e) {
    	
        e.preventDefault();
        console.log("dawda");
        if(isloading != true){
        getSessionData()
            .then(function(data) {
                writer = data;
                return getNickname(writer);
            })
            .then(function(data) {
                nickname = data;
                return handleUpload(nickname);
            })
            .then(function() {
            alert(posttype);
                $('.mmake_content').remove();
                alert('업로드가 완료되었습니다.');
                
            })
            .fail(function(error) {
                console.error('An error occurred:', error);
            });
            isloading = true;
            };
    });
});

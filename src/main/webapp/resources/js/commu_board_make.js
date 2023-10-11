$(document).ready(function() {
    var userid;
    var nickname;
    var commuid = sessionStorage.getItem('commuID');

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
        const contenttype = $('.commucategory').val();
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
                $('.mmake_content').css('display', 'none');
                alert('업로드가 완료되었습니다.');
                location.href = '/hf';
            })
            .fail(function(error) {
                console.error('An error occurred:', error);
            });
    });
});

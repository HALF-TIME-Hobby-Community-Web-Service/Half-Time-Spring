<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>kakao login</title>
</head>
<body>
    <a href="javascript:kakaoLogin();">
    <img src="https://www.gb.go.kr/Main/Images/ko/member/certi_kakao_login.png" style="height: 60px;width:auto;">
    </a>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
        //9cde8b36ed8b7ae0a58142aed15d3972
        window.Kakao.init("9cde8b36ed8b7ae0a58142aed15d3972");
        function kakaoLogin(){
            window.Kakao.Auth.login({
                scope:'profile_nickname, account_email',
                success: function(authObj){
                    console.log(authObj);
                    window.Kakao.API.request({
                        url:'/v2/user/me',
                        success: res => {
                            const kakao_account = res.kakao_account;
                            console.log(kakao_account);

                        }
                        
                    });
                }
            });
        }
    </script>
  
</body>
</html>
$(() => {
    const checkObj = $('button.login_findPW_pnum_checkbtn');
    const findPWID = $('input.login_findPW_input');
    const findPWName = $('input.login_findPW_name_input');
    const findPWGender = $('select.login_findPW_gender_select');
    const findPWBirth = $('input.login_findPW_birth_input');
    const findPWPnum1 = $('select.login_findPW_pnum_select'); 
    const findPWPnum2 = $('input.login_findPW_pnum1_input'); 
    const findPWPnum3 = $('input.login_findPW_pnum2_input'); 
   


    $(checkObj).click(() => {
        // alert( findPWID.val()+ findPWName.val()+findPWGender.val()+findPWBirth.val()+ findPWPnum1.val()+findPWPnum2.val()+ findPWPnum3.val());
      $.ajax({
        url: 'http://localhost:8888/hf/findpw',
        method: 'POST',
        data: { 
            login_findPW_ID: findPWID.val(),
            login_findPW_name: findPWName.val(),
            login_findPW_gender: findPWGender.val(),
            login_findPW_birth: findPWBirth.val(),
            login_findPW_pnum: findPWPnum1.val(),
            login_findPW_pnum1: findPWPnum2.val(), 
            login_findPW_pnum2: findPWPnum3.val()
        }, 
        
        success: (response) => {  
            // alert(response);
          if (response != 'null') {
            alert('회원의 비밀번호는[ '+response+' ]입니다')
          }
          else {
            alert('가입된 이력이 없습니다');
          }
        },
        error: (jqXhr, status) => {
          alert(`실패: ${status}\n오류명:${jqXhr.statusCode}`);
        },
      });
    });
  });
  
  $(() => {
    const iddoublechk = $('button.login_findPW_ID_checkbtn');
    const findPWID = $('input.login_findPW_input');
    
    $(iddoublechk).click(() => {
        $.ajax({
            url: 'http://localhost:8888/hf/findpw',
            method: 'GET',
            data: { 
                login_findPW_ID: findPWID.val()
            }, 
            success: (response) => {
                if (response === '1') {
                    alert('아이디가 확인되었습니다');
                } else  {
                    alert('존재하지 않는 아이디입니다');
                } 
            }, 
            error: (jqXhr, status) => {
                alert(`실패: ${status}\n오류명:${jqXhr.statusCode}`);
            },
        });
    });
});
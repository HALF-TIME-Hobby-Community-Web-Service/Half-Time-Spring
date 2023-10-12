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
    $.ajax({
      url: 'http://localhost:8888/user/findpw',
      method: 'POST',
      dataType: 'text', // 비밀번호 찾기에는 텍스트 응답을 예상
      data: { 
        findPWID: findPWID.val(),
        findPWName: findPWName.val(),
        findPWGender: findPWGender.val(),
        findPWBirth: findPWBirth.val(),
        findPWPnum1: findPWPnum1.val(),
        findPWPnum2: findPWPnum2.val(), 
        findPWPnum3: findPWPnum3.val()
      }, 
        
      success: (response) => {  
        if (!response) {
         alert('가입된 이력이 없습니다');
        } else {
          
           alert('회원의 비밀번호는[ '+response+' ]입니다');
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
      url: '/user/findpwid',
      method: 'post',
      dataType: 'text', // 아이디 확인에는 JSON 응답을 예상
      data: {
        findPWID: findPWID.val()
      },
       
      success: (response) => {
        if (!response) {
          alert('존재하지 않는 아이디입니다!');
        } else {
          alert('존재하는 아이디 입니다!');
        } 
      }, 
      error: (jqXhr, status) => {
        alert(`실패: ${status}\n오류명:${jqXhr.statusCode}`);
      },
    });
  });
});
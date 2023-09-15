$(() => {
    const checkObj = $('button.login_findpnum_checkbtn');
    const findIDName = $('input.login_findID_input');
    const findIDPnum1 = $('select.login_findpnum_select');
    const findIDPnum2 = $('input.login_findpnum1_input');
    const findIDPnum3 = $('input.login_findpnum2_input');
  
    $(checkObj).click(() => {
        // alert(findIDPnum1.val()+findIDPnum2.val()+findIDPnum3.val())

      $.ajax({
        url: 'http://localhost:8888/hf/findid', 
        method: 'POST',
        data: {
           login_findID: findIDName.val(),
           login_pnum1: findIDPnum1.val(),
           login_pnum2: findIDPnum2.val(),
           login_pnum3: findIDPnum3.val()
        }, 

        success: (response) => {  
          if (response != 'null') {
            alert('회원의 아이디는[ '+response+' ]입니다')
            
          }
          else {
            alert('가입된 이력이 없습니다');
          }
        },
        error: (jqXhr, status) => {
          alert(`실패: ${status}\n오류명:${jqXhr.statusCode}`);
        },
      });
     // return false;
    });
  });
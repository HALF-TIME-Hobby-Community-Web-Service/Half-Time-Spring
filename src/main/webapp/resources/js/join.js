
// 회원가입 1페이지 > 2페이지 넘어가기

$(() => {
  const formObj = $('form.join_container');
  const id =$('input.join_ID_input');
  const email=$('select.join_ID_select');

  $(formObj).submit(() => {
      sessionStorage.setItem('userid', id.val()+email.val());
      $.ajax({
        url: 'http://localhost:8888/user/join1', 
        method: 'POST',
        data: formObj.serialize(), 
		dataType: "JSON" , 
		 
        success: (response) => {  
        // alert('다음페이지로 이동합니다');
        swal('1페이지 작성완료!',"다음페이지로 이동합니다",'success')
		.then(function(){
			  if (response == 1) {
            location.href = 'http://localhost:8888/user/join2';
          } else {
          swal('1페이지 작성실패!',"전부작성해주세요",'error');
          }
		})
        },
        error: (jqXhr, status) => {
        	alert(`실패: ${status}\n오류명:${jqXhr.statusCode}`);
        },
      });
      return false;
    });
  });

// 아이디 중복확인 
  $(() => {
    const checkObj = $('button.join_id_checkbtn');
    const id =$('input.join_ID_input');
    const email=$('select.join_ID_select');
   
    $(checkObj).click(() => { 
      //swal('중복확인',id.val()+email.val(),'info');
      //alert(id.val()+email.val());
      $.ajax({
        url: 'http://localhost:8888/user/idcheck', 
        method: 'POST',
        data:{
          ida: id.val(),
          idb: email.val()
        },
  		
        success: (response) => {  
            // alert(response);
          if (response == '0') {
           swal('중복확인',"사용할 수 있는 아이디입니다",'success');
          //alert('사용할 수 있는 아이디입니다')
          }
          else if (response == '1') {
           swal('중복확인',"이미 사용중인 아이디입니다",'error');
            //alert('이미 사용중인 아이디입니다');
          }else if(response == '2'){
            alert('오류가 발생했습니다')
          }
        },
        error: (jqXhr, status) => {
          alert(`실패: ${status}\n오류명:${jqXhr.statusCode}`);
        },
      });
    });
  });

  // 비밀번호 확인 
  $(() => {
    const pw = $('.join_PW_input');
    const pwcheck = $('.join_PW2_input');
  
      $('.join_PW_checkbtn').click(()=>{

        if (pw.val() == pwcheck.val()) { 
         swal('비밀번호 확인',"비밀번호가 같습니다",'success');
          //alert('비밀번호가 같습니다')
        }
        else {
        swal('비밀번호 확인',"비밀번호가 다릅니다",'error');
          //alert('비밀번호가 다릅니다')
        }
      })     
  });

      
 // 핸드폰 번호 인증 (코드구성 X ALERT창만O)
 $(() => {
  const pnumchk = $('.join_pnum_checkbtn');

    $(pnumchk).click(()=>{
       swal('핸드폰번호 확인',"핸드폰 번호가 인증되었습니다",'success');
      //alert('핸드폰 번호가 인증되었습니다')
    })     
});

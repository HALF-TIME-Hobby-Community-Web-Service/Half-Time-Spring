$(() => {
  
    $(formObj).submit(() => {
      $.ajax({
        url: 'http://localhost:8888/hf/login', 
        method: 'POST',
        data: formObj.serialize(), //form내에 input태그들의 name과 value를 매핑
  
         //response: back -> front로 넘겨준 데이터(작명을 임의로 response라고 함)
         //맵으로 넘겨줬을시 response.id, response.state등으로 key값으로 value를 찾으면 됨.
        success: (response) => {  
         // alert(response);
          if (response == '1') {
            location.href = './feed.html';
          }
          else if (response == '0') {
            alert('아이디 또는 비번이 틀렸습니다!');
          } else if (response == '2') {
            alert('차단 당한 계정입니다.');
          }
        },
        error: (jqXhr, status) => {
          alert(`실패: ${status}\n오류명:${jqXhr.statusCode}`);
        },
      });
      //ajax는 비동기 방식이라 데이터가 백으로 갔다가 올 때 까지 다른 작업을 진행하는데
      //데이터를 받기전에 form이 다른페이지로 넘어가면 오류가 발생함.
      //그래서 return false로 막아두고 location.href로 페이지 이동.
      return false;
    });
  });
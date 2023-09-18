$(() => {
  const commumemberList = $('div.memberList');
  const memberList = $('table');
  const memberCA = $('td.ca');
  const memberCN = $('td.cn');
  const memberCI = $('td.ci');
  const memberCS = $('td.cs');

  commumemberList.click(() => {
    $.ajax({
      url: 'http://localhost:8888/commu/getmember',
      method: 'POST',
      //data: commumemberList.serialize(), //form내에 input태그들의 name과 value를 매핑

      //response: back -> front로 넘겨준 데이터(작명을 임의로 response라고 함)
      //맵으로 넘겨줬을시 response.id, response.state등으로 key값으로 value를 찾으면 됨.
      success: (response) => {
        //alert(response[0].commuID)

        //memberList.html(JSON.stringify(response));
        response.forEach((data) => {
          const div = $('<div>').text(
            '\t' + data.cAutho + '\t' + data.gender + '\t' + data.birth
          ); //(JSON.stringify(response));

          if (data.gender == 1) {
            var gender = '남자';
          } else if (data.gender == 2) {
            var gender = '여자';
          }

          if (data.cAutho == 0) {
            var autho = '회원';
          } else if (data.cAutho == 1) {
            var autho = '관리자';
          }

          const birthDate = new Date(data.birth);
          const today = new Date();

          const age =
            today.getFullYear() -
            birthDate.getFullYear() -
            (today.getMonth() < birthDate.getMonth() || 
            (today.getMonth() === birthDate.getMonth() && today.getDate() < birthDate.getDate()) ? 1 : 0);
         

          const cca = $('<div>').text(age + 1 + '세'); // 나이로 변환하여 출력
          const ca = $('<div>').text(autho);
          const cn = $('<div>').text(data.cNickName);
          const ci = $('<div>').text(gender);
          const cs = $('<div>').text(data.birth);

          $(memberCA).append(ca);
          $(memberCN).append(cn);
          $(memberCI).append(ci);
          $(memberCS).append(cca);
        });
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

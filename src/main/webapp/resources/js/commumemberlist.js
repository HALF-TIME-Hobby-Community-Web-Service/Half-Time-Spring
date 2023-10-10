$(() => {
  const memberList = $('table');
  const memberCA = $('td.ca');
  const memberCN = $('td.cn');
  const memberCI = $('td.ci');
  const memberCS = $('td.cs');
     
  const commuID = sessionStorage.getItem('commuID');
  
  	memberCA.html('');
    memberCN.html('');
    memberCI.html('');
    memberCS.html('');
    
    memberCA.append('<span class="font30px">권한</span><hr>');
    memberCN.append('<span class="font30px">&nbsp;닉네임</span><hr>');
    memberCI.append('<span class="font30px">성별</span><hr>');
    memberCS.append('<span class="font30px">나이</span><hr>');
    
    $.ajax({
      url: 'http://localhost:8888/commu/getmember',
      method: 'POST',
      data: {commuID: commuID},
      dataType: 'JSON',
      success: (response) => {           
        response.forEach((data) => {        
          const div = $('<div>').text('\t' + data.cauth + '\t' + data.gender + '\t' + data.birth); 
                    
          if (data.gender == 1) 
            var gender = '남';
          else if (data.gender == 2 ) 
            var gender = '여';        
          else
            var gender = '?';             

          if (data.cauth == 2)           	
          	var autho = '👑매니저';                   
          else if (data.cauth == 1) 
            var autho = '📢부매니저';
          else  
            var autho = '회원';

          const birthDate = new Date(data.birth);
          const today = new Date();

          const age = today.getFullYear() - birthDate.getFullYear() - 
          	(today.getMonth() < birthDate.getMonth() || 
            (today.getMonth() === birthDate.getMonth() && today.getDate() < birthDate.getDate()) ? 1 : 0);
         
          const cca = $('<div>').text(age + 1 + '세'); // 나이로 변환하여 출력
          const ca  = $('<div>').text(autho);
          const cn  = $('<div>').html(`<a href="" class="feed_a_name2" style="	text-decoration: none;
	color: black;">` + data.cnickName + `</a>`);
          const ci  = $('<div>').text(gender);
          const cs  = $('<div>').text(data.birth);

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
    
});

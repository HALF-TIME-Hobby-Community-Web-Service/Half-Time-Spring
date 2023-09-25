$(()=>{

  const locationButton = $("#location_search");
  const searchObj = $("input[name='search_loation']");
  
  const communityList = $('div.community_List');
  const memberList = $('table');
  const memberCI = $('td.ci');
  const memberCN = $('td.cn');
  const memberCC = $('td.cc');
  const memberCL = $('td.cl');

  window.initMap = function () {
    const map = new google.maps.Map(document.getElementById("map"), {
      center: { lat: 37.5400456, lng: 126.9921017 },
      zoom: 10,
    });
  };




  
  locationButton.on("click", (e) => {
  	$(memberCN).html('');
    $(memberCI).html('');
    $(memberCC).html('');
    $(memberCL).html('');
    
    $(memberCN).append('<span class="font30px">커뮤니티 이름</span><hr>');
    $(memberCI).append('<span class="font30px">커뮤니티 소개</span><hr>');
    $(memberCC).append('<span class="font30px">카테고리</span><hr>');
    $(memberCL).append('<span class="font30px">지역</span><hr>');
    
   e.preventDefault();
    $.ajax({
      url:"/commu/location",
      method: "post",
      dataType:"json",
      data:{ search_loation: searchObj.val()},
      success:(response)=>{
        alert("성공이요~"+response);
         response.forEach((data) => {        
          const div = $('<div>').text('\t' + data.commuName + '\t' + data.commuIntro + '\t' + data.commuLocation + '\t' + data.commuCategory)
          
          const cn  = $('<div>').text("커뮤니티 이름:"+data.commuName);
          const ci  = $('<div>').text("커뮤니티 소개:"+"[" + data.commuIntro + "]");
          const cc  = $('<div>').text("카테고리:"+data.commuCategory);
          const cl  = $('<div>').text("지역:"+data.commuLocation);
          
          
          $(memberCN).append(cn);
          $(memberCI).append(ci);
          $(memberCC).append(cc);
          $(memberCL).append(cl);
          })
          
      },
      error:()=>{
        alert("실패!");
      }

    })
  
  });
})
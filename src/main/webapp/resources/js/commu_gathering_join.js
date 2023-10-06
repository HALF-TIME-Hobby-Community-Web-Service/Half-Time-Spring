$(() => {
  const url = 'http://localhost:8888/commu';

  const commuID = sessionStorage.getItem('commuID');   
  
  $.ajax({
    url: `${url}/lget`,
    method: 'POST',
    data: {commuID : commuID},
    success: (data) => {
      data.forEach((element) => {
        appendGathering(element);
      });
    },
    error: (jqXhr, status) => {
      alert(`실패: ${status}\n오류명:${jqXhr.status}`);
    },
  });
});

function appendGathering(data) {
  //클론
  const newItem = $('.ljoin_box_clone')
    .clone()
    .addClass('ljoin_box')
    .removeClass('ljoin_box_clone');

  //날짜 표시
  {
    const temp1 = data.startTime.substring(5, 10); // "08-12" 형태의 문자열 추출
    const ldate = temp1.replace('-', '/');

    const dateString = data.startTime; // 주어진 날짜 정보
    const date = new Date(dateString); // 날짜 문자열을 Date 객체로 파싱

    const daysOfWeek = ['일', '월', '화', '수', '목', '금', '토'];
    const dayIndex = date.getDay(); // 0 (일요일)부터 6 (토요일)까지의 값

    const lday = daysOfWeek[dayIndex]; // 해당 요일의 한국어 표현

    newItem.find('.ljoin_box_date1').text(ldate + ' (' + lday + ') ');
  }
  //D-day
  {
    const dateString = data.startTime; // 주어진 날짜 정보
    const targetDate = new Date(dateString); // 날짜 문자열을 Date 객체로 파싱
    const today = new Date(); // 오늘 날짜 정보 가져오기
    
    // targetDate와 today 간의 차이 계산 (시간을 무시)
    const timeDiff = new Date(targetDate.toDateString()).getTime() - new Date(today.toDateString()).getTime();
    const daysDiff = Math.ceil(timeDiff / (1000 * 3600 * 24));    
    
    newItem.find('.ljoin_box_dday').text('D-' + daysDiff);
    
  }

  {
    const dateTime = new Date(data.startTime);

    const year = dateTime.getFullYear();
    const month = ('0' + (dateTime.getMonth() + 1)).slice(-2);
    const day = ('0' + dateTime.getDate()).slice(-2);

    let period = '오전 ';
    let hours = dateTime.getHours();
    if (hours >= 12) {
      period = '오후 ';
      if (hours > 12) {
        hours -= 12;
      }
    }
    if (hours === 0) {
      hours = 12;
    }
    const minutes = ('0' + dateTime.getMinutes()).slice(-2);

    const resultTime = `${year}/${month}/${day} ${period}${hours}시${minutes}분`;
    newItem.find('.ljoin_box_date2').text(resultTime);
  }

  //모임 기본정보들
  {
    newItem.find('.ljoin_box_container > p').text(data.title);
    newItem.find('.ljoin_box_location').text(data.location);
    newItem.find('.ljoin_box_text').text(data.text);
    newItem.find('.ljoin_box_price').text(data.price + '원');	ㅂ
    newItem.find('.ljoin_box_count').text(data.count);
    newItem.find('.ljoin_box_capacity').text(data.capacity + '명');
  }

  $('.ljoin_container').append(newItem);
}

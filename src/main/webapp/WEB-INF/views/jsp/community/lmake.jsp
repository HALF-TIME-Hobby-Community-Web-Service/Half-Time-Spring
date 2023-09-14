<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

  <link rel="stylesheet" href="../css/lmake.css">
  <script src="../js/lmake.js"></script>
</head>

<body>
  <div class="lmake_content">
    <div class="lmake_title"> ⚡번개신청 </div>
    <div class="lmake_container">
      <div class="form-floating mb-3">
        <fieldset>
          <span>이름:</span>
          <input name="id" class="form-control lmake_name" placeholder="2030 롯데리아좋아하는사람들 정기모임~~!~!!@@" />
        </fieldset>
      </div>

      <div class="form-floating mb-3 lmake_schedule">
        <span>일정:</span>
        <input type="date" name="date" class="form-control" value="2023-08-02" />
        <input type="time" name="startTime" class="form-control" value="12:30" />
        <input type="time" name="finishTime" class="form-control" value="14:00" />
        <fieldset class="lmake_checkbox">
          <input id="finishTime" type="checkbox" checked>
          <label for="finishTime">끝나는 시간</label>
        </fieldset>
      </div>

      <div class="form-floating mb-3">
        <span>위치:</span>
        <input class="form-control location" name="location_intro" value="맥도날드 뱅뱅사거리점" />
        <input class="form-control location" name="location_map" value="서울시-강남구-도곡동" />
      </div>

      <div class="form-floating mb-3">
        <span>내용:</span>
        <textarea class="lmake_text" placeholder="롯데리아 종이배 모자쓰고 맥도날드앞에서 시위해요~~~ ^>^"></textarea>
      </div>

      <div class="form-floating mb-3 lmake_detailbox">
        <div>
          <span>정원:</span>
          <span class="lmake_calcbox">
            <button type="button" class="lmake_btn lmake_cap_minus">-</button>
            <input name="capacity" class="form-control" value="00명" />
            <button type="button" class="lmake_btn lmake_cap_plus">+</button>
          </span>
        </div>
        <div>
          <span>금액:</span>
          <span class="lmake_calcbox">
            <button type="button" class="lmake_btn lmake_price_minus">-</button>
            <input name="price" class="form-control" value="10000원" />
            <button type="button" class="lmake_btn lmake_price_plus">+</button>
          </span>
        </div>
      </div>

      <div class="lmake_button_container">
        <button class="btn btn-primary">모임 개설</button>
        <button class="btn btn-danger">모임 개설 요청</button>
      </div>
    </div>
  </div>
</body>

</html>
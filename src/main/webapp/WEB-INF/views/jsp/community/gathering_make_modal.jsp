<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

  <!-- 번개 생성 -->
  <div class="lmake_content">
    <div class="lmake_title">⚡모임생성</div>
    <div class="lmake_container">
      <form method="post" action="">
        <div class="form-floating mb-3">
          <fieldset>
            <span>이름:</span>
            <input name="title" wrap="hard" cols="40" class="form-control lmake_name" required/>
          </fieldset>
        </div>

        <div class="form-floating mb-3 lmake_schedule">
          <span>일정 시작&nbsp;:&nbsp;&nbsp;&nbsp;</span>
          <input name="startTime" class="startTime form-control" type="datetime-local" max="2023-12-240T21:00" min="" value="" style="width: 300px;">
          <br>
          <span>일정 마무리:</span>
          <input name="endTime" class="endTime form-control" type="datetime-local" max="2023-12-24T21:00" min="" value="" style="width: 300px;">          
          <fieldset class="lmake_checkbox">
            <input name="check" id="endTime" type="checkbox" checked>
            <label for="endTime">끝나는 시간</label>
          </fieldset>
        </div>

        <div class="form-floating mb-3">
          <span>위치:</span>
          <input class="form-control location" name="location" required/>
          <!-- <input class="form-control location" name="location_map" value="서울시-강남구-도곡동" /> -->
        </div>

        <div class="form-floating mb-3">
          <span>내용:</span>
          <textarea name="text" class="lmake_text" required></textarea>
        </div>

        <div class="form-floating mb-3 lmake_detailbox">
          <div>
            <span>정원:</span>
            <span class="lmake_calcbox">
              <button type="button" class="btn btn-light lmake_btn lmake_cap_minus">-</button>
              <input name="capacity" class="form-control cap" value="10" style="margin-right: 0px; width:20%; text-align: right;" required/>명&nbsp;&nbsp;
              <button type="button" class="btn btn-light lmake_btn lmake_cap_plus">+</button>
            </span>
          </div>
          <div>
            <span>금액:</span>
            <span class="lmake_calcbox">
              <button type="button" class="btn btn-light lmake_btn2 lmake_btn lmake_price_minus">-</button>
              <input name="price" class="form-control" value="0" style="margin-right: 0px; width:20%; text-align: right;" required/>원&nbsp;&nbsp;
              <button type="button" class="btn btn-light lmake_btn2 lmake_price_plus">+</button>
            </span>
          </div>
        </div>
        <div class="lmake_button_container">
          <button class="btn btn-primary">모임 생성</button>
        </div>
      </form>
    </div>
  </div>  
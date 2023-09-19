$(function () {
  const maxInputBoxes = 6;

  const userid = sessionStorage.getItem('userid');
  const formObj = $('form.join_container');
  const location = $('.join_userlocation_input');
  const category = $('.join_category_input');

  function addInputBox($container) {
    if ($container.children().length < maxInputBoxes) {
      const placeholder = $container.hasClass('join_userlocation_box')
        ? '관심지역(집/회사)'
        : '관심취미';

      const newInputBox = `<div class="input-group">
                                  <input class="${
                                    $container.attr('class').split(' ')[0]
                                  }_input"
                                      type="text"
                                      name="${
                                        $container.attr('class').split(' ')[0]
                                      }"
                                      maxlength="15"
                                      placeholder="${placeholder}"
                                      required>
                                  <button class="remove-btn">삭제</button>
                              </div>`;

      $container.append(newInputBox);
    }
  }

  function removeInputBox($inputBox) {
    $inputBox.remove();
  }

  let cnt = 1;
  $('.join_userlocation_addbtn').click(function (event) {
    event.preventDefault(); // 폼 전송 방지
    addInputBox($(`.join_userlocation_box`));
    cnt++;
  });

  $('.join_category_addbtn').click(function (event) {
    event.preventDefault(); // 폼 전송 방지
    addInputBox($('.join_category_box'));
  });

  $(document).on('click', '.remove-btn', function () {
    var $inputBox = $(this).parent();
    removeInputBox($inputBox);
  });

  $(formObj).submit(function (event) {
    event.preventDefault(); // 폼 전송 방지
    $.ajax({
      url: 'http://localhost:8888/user/join2',
      method: 'POST',
      dataType: "JSON",
      data: {
        userid: userid,
        location: location.val(),
        category: category.val(),
      },

      //여기부터 다시하기
      success: function (response) {      
        alert('회원가입 완료');
        alert(response);
        if (response == 2) {
          window.location.href = 'http://localhost:8888/user/login'; //임시로해놓음 (회원가입 완료 후 피드페이지 이동)
        } else {
          alert('다시작성해주세요');
        }
      },
      error: function (jqXhr, status) {
        alert(`실패: ${status}\n오류명:${jqXhr.status}`);
      },
    });
    return false;
  });
});

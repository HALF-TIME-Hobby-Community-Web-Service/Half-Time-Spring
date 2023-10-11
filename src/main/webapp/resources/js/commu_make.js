$(() => {
  $('.cmake_closebtn').click(() => {
    $('.cmake_content').css('display', 'none');
    $('.cmake_form')[0].reset();
    $('.commu_img').attr('src', '/resources/items/moment/moment_default.png');
    $('textarea[name="commuintro"]').css('height', '200px');
    $('.age_box').css('display', 'none');
    $('.gender_box').css('display', 'none');
    x = 0;
    $('.cmake_form').css('transform', 'translateX(0%)');
  });

  let id;
  $.ajax({
    url: 'http://localhost:8888/getSession',
    method: 'GET',
    success: function (data) {
      id = data;

      let x = 0;

      $('.next').click(() => {
        var form = $('.cmake_form');
        x -= 25;
        form.css('transform', 'translateX(' + x + '%)');
      });

      $('.back').click(() => {
        var form = $('.cmake_form');
        x += 25;
        form.css('transform', 'translateX(' + x + '%)');
      });

      $('.commu_img').click(() => {
        $('.commu_file').click();
      });

      $('.gender_check').change(() => {
        if ($('.gender_check').is(':checked')) {
          $('.genderbox').css('display', 'block');
        } else {
          $('.genderbox').css('display', 'none');
          $('.genderbox > select').val('all');
        }
      });

      $('.age_check').change(() => {
        if ($('.age_check').is(':checked')) {
          $('.age_box').css('display', 'block');
        } else {
          $('.age_box').css('display', 'none');
          $('.age').val('');
        }
      });

      $(".commu_file").on("change", function () {
        var input = this;
        var img = $(this).siblings(".commu_img");

        if (input.files && input.files[0]) {
          var reader = new FileReader();

          reader.onload = function (e) {
            img.attr("src", e.target.result);
          };

          reader.readAsDataURL(input.files[0]);
        }
      });

      const LargeCate = $('.lcate');
      const SmallCate = $('.scate');

      $.ajax({
        url: 'http://localhost:8888/moment/modal_LargeCategory',
        method: 'POST',
        dataType: "json",
        success: function (data) {
          $.each(data, function (index, item) {
            LargeCate.append('<option value="' + item + '">' + item + '</option>');
          });
        },
        error: function (error) {
          console.log("largeCategory error");
          console.error('데이터를 가져오는 중 오류가 발생했습니다:', error);
        }
      });

      $('.lcate').change(() => {
        SmallCate.html('');
        $.ajax({
          url: 'http://localhost:8888/moment/modal_SmallCategory',
          method: 'POST',
          data: { largecate: LargeCate.val() },
          dataType: "json",
          success: function (data) {
            SmallCate.append('<option value="소분류">카테고리 없음</option>');
            $.each(data, function (index, item) {
              SmallCate.append('<option value="' + item + '">' + item + '</option>');
            });
          },
          error: function (error) {
            console.log("smallCategory error");
            console.error('데이터를 가져오는 중 오류가 발생했습니다:', error);
          }
        });
      });

      /* 커뮤니티 생성 */
      const form = $('.cmake_form');
      const commuName = $('input[name="communame"]');

      form.submit((e) => {
        e.preventDefault();
        if (id == '') {
          swal("로그인하세요", "어딜 날로먹으려고", "warning");
        }
        // 1. 커뮤 이름 공백 검사	    	    
        if (commuName.val() == '') {
          run_swal('커뮤니티 이름을 입력해주세요');
          $('.cmake_form').css('transform', 'translateX(0%)');
          x = 0;
          commuName.focus();
          return;
        } else {
          // 2. 커뮤 이름 중복 검사	
          $.ajax({
            url: 'http://localhost:8888/commu/checkcommuname',
            method: 'POST',
            data: { commuName: commuName.val() },
            dataType: 'text',
            success: function (data) {
              if (data == 'fail') {
                swal('커뮤니티 생성 실패!', '이미 존재하는 커뮤니티 이름입니다', 'error');
                $('.cmake_form').css('transform', 'translateX(0%)');
                x = 0;
                commuName.focus();
              } else {
                $.ajax({
                  url: 'http://localhost:8888/commu/cmake',
                  method: 'POST',
                  data: $('.cmake_form').serialize(),
                  dataType: 'text',
                  success: function (data) {
                    if (data == 'success') {
                      console.log($('.cmake_form').serialize());
                      var formData = new FormData();
                      var inputFiles = $('.commu_file')[0].files;
                      formData.append("file", inputFiles[0]);
						for (var pair of formData.entries()) {
 						console.log('폼데이터'+pair[0] + ': ' + pair[1]);
							}
                      $.ajax({
                        url: 'http://localhost:8888/commu/commuUploads3',
                        method: 'POST',
                        data: formData,
                        processData: false, // 데이터 처리 비활성화
                        contentType: false,
                        datatype: "text",
                        success: function (data) {
                          if (data == 'success')
                            swal('s3 생성 성공!', '환영합니다!', 'success');
                          else
                            swal('s3 실패!', '서버 오류에용', 'warning');
                        },
                        error: function (error) {
                         
                        }
                      });
                      swal('cmake 성공!', '환영합니다!', 'success');
                    } else {
                      swal('cmake 실패!', '서버 오류에용', 'warning');
                    }
                  },
                  error: function (error) {
                    swal('cmake 생성 실패!', '안세준 일해라', 'error');
                  }
                });
              }
            },
            error: function (error) {
              alert('데이터를 가져오는 중 오류가 발생했습니다');
            }
          });
        }

        //ajax끝

        // 3. 커뮤니티 생성
      });

      function run_swal(errorMSG) {
        swal('커뮤니티 생성 실패!', errorMSG, 'warning');
      }
    },
    error: function (error) {
      swal('세션 받아오기 실패');
    }
  });
});








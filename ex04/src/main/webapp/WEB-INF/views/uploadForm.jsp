<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드 요청 페이지</title>
</head>
<body>

   <input type='file' name='uploadFile' multiple></input>
   <button id="uploadBtn">전송</button>
   <script
      src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
   <script type="text/javascript">
      $(document).ready(function() {

         var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)");
         var maxSize = 5 * 1024 * 1024;

         function checkFile(filename, filesize) {
            if (filesize > maxSize) {
               alert("파일크기가 5M를 초과합니다");
               return false;
            }

            if (regex.test(filename)) {
               alert("허용하지 않는 파일입니다.");
               return false;
            }
            return true;
         }

         $("#uploadBtn").on("click", function(e) {
            var formData = new FormData();

            var inputFile = $("input[name='uploadFile']");
            var files = inputFile[0].files;

            var test = $('#test');
            for (var i = 0; i < files.length; i++) {
               if (!checkFile(files[i].name, files[i].size)) {
                  return false;
               }
               formData.append("uploadFile", files[i]);
            }
            alert(formData);

            $.ajax({
               type : 'POST',
               url : "/uploadFormAction",
               processData : false,
               contentType : false,
               data : formData,
               success : function(result) {
                  console.log(result);                  
               }
            });
         });
      });
   </script>
</body>
</html>
$(() => {
<<<<<<< HEAD

})
=======
   
    mypagebtn.on("click", function() {
        $.ajax({
            url: "/user/mypage",
            type: "get",
            success: function() {
            location.href="/user/mypage"
            },
            error: function(jqXhr, status) { 
             location.href="/user/login"
            }            
        }); 
      });
      
       logoutbtn.on("click", function() {
       alert("로그아웃 -> 로그인페이지로 이동합니다");
       	  $.ajax({
       	  url:"/user/logout",
       	  type:"get",
       	  success:function(){
       	  location.href="/user/login"
       	  },
       	  error: function(jqXhr, status) {    
            }            
       });
    })
  })

>>>>>>> 1d8595138f46a33d45d9aa622cb4b33c9c1cf2db

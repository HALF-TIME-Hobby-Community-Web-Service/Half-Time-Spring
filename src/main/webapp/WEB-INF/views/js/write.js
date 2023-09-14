function setThumbnail(event) {
    for (var image of event.target.files) {
      var reader = new FileReader();

      reader.onload = function(event) {
        var img = document.createElement("img");
        img.setAttribute("src", event.target.result);
        img.setAttribute("style","width:100%")
        img.setAttribute("margin-right","")
        document.querySelector("div#image_container").appendChild(img).style.marginLeft="5%";
      };

      console.log(image);
      reader.readAsDataURL(image);
    }
  }

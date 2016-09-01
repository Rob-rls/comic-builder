$(document).ready(function() {
  $('.color').colorPicker();

  $('#change-border').click(function() {
    var images = document.querySelectorAll(".float-image");
    images.forEach(function(image){
      image.style.borderColor='red';
    });
  });

  $('.comic-strip').append(function() {
    var input = document.querySelector("#stripbackground");
    var color = document.querySelector(".comic-strip");
    input.value = color.style.backgroundColor;
  });

});

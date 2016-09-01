$(document).ready(function() {
  $('.color').colorPicker();

  $('#change-border').click(function() {
    var images = document.querySelectorAll(".float-image");
    images.forEach(function(image){
      image.style.borderColor='red';
    });
  });

});

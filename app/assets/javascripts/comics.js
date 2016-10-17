document.addEventListener("turbolinks:load", function() {

  $(document).ready(function() {

    $('.color').colorPicker({opacity: false});

    $('form').submit(function(){
      var style = document.querySelector(".comic-strip").style;
      var inputbackground = document.querySelector("#comic_stripbackground");
      var inputcolor = document.querySelector("#comic_stripcolor");
      $('#comic_stripcolor').append(function() {
        inputbackground.value = style.backgroundColor;
        inputcolor.value = style.color;
      });
    });

  });

});

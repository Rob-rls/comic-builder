$(document).ready(function() {

  $('.color').colorPicker({opacity: false});

  // $('#updatecolour').click(function(){
  //   // event.preventDefault();
  //   var style = document.querySelector(".comic-strip").style;
  //   var inputbackground = document.querySelector("#stripbackground");
  //   var inputcolor = document.querySelector("#stripcolor");
  //   $('#stripcolor').append(function() {
  //     inputbackground.value = style.backgroundColor;
  //     inputcolor.value = style.color;
  //   });
  // });

  $('form').submit(function(){
    var style = document.querySelector(".comic-strip").style;
    var inputbackground = document.querySelector("#stripbackground");
    var inputcolor = document.querySelector("#stripcolor");
    $('#stripcolor').append(function() {
      inputbackground.value = style.backgroundColor;
      inputcolor.value = style.color;
    });
  });

// Code below watches for change in style attr and logs the changes
// We should be able to use this somehow
  // document.documentElement.addEventListener('DOMAttrModified', function(e){
  //   if (e.attrName === 'style') {
  //     console.log('prevValue: ' + e.prevValue, 'newValue: ' + e.newValue);
  //   }
  // }, false);
  //
  // document.documentElement.style.display = 'block';

});

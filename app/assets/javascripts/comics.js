$(document).ready(function() {
  $('.color').colorPicker();

  var changeBackground = function() {
    var x = document.getElementByClassName("grid");
    x.style.backgroundColor='red';
  };
});

var mobNav = function () {
  var nav = $('.mobile-nav');

  nav.find('select').bind('change', function (event) {
    if (event.target.value) {
      window.location.href = event.target.value;
    }
  });
};

$('document').ready(function () {
  mobNav();
});

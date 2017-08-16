!(function() {
  var library = location.search.match(/[?&]lib=(.*?)(?=&|$)/);
  if (library) {
    document.write('<script src="../libs/' + library[1] + '"></script>');
  } else {
    document.write('<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>');
  }
}());

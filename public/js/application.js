$(document).ready(function() {

  function createCORSRequest(method, url) {
  var xhr = new XMLHttpRequest();
  if ("withCredentials" in xhr) {
    xhr.open(method, url, true);
  }
    return xhr
  }
  $('#return-stuff').click (function(e){
    var xhr = createCORSRequest('GET','http://api.divesites.com/?mode=sites&lat=47.6031537682643&lng=-122.336164712906&dist=25')
    console.log(xhr);
    xhr.onload = function (){
      var responseText = xhr.responseText;
      console.log(responseText)
    };
    xhr.onerror = function(){
      console.log('There was an error!')
    }
    xhr.send();
  });
});

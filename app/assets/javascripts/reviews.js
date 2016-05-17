$( document ).on('ready page:load', function() {
  $('.review-link').on('click',function(e){
    e.preventDefault();
    var url = $(this).attr("href");
    console.log(url)
    $.ajax({
      url: url,
      method: 'get'
    }).done(function(response){
      $(".review-link").hide()
      $(".review-div").append('<div class="alert alert-warning" role="alert">You must be logged in to post a review.</div>')
      $(".review-div").append(response);
    });
  });
});

$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  // $('form').on('submit', function(event){
  //   event.preventDefault();
  //   $('.loading').text('LOADING YOUR PORN')

  //   $.ajax({
  //     type: 'GET',
  //     url: '/subreddits',
  //     data: $(this).serialize()
  //   })
  //   .done(function(data) {
  //     var parsedSubreddits = JSON.parse(data)
  //     for (var i = 0; i < parsedSubreddits.length; i++) {
  //       $('.nsfw').append('<p>'+(parsedSubreddits[i])+'<p>')
  //     }
  //     $('.loading').text("HERE'S YOUR PORNOGRAPHY")
  //   })
  // });

});

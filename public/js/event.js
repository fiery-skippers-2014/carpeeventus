$(document).ready(function() {

  console.log('div is loaded')

  function eventClick(){
    $('body').on('click', '.eventChoice', eventChoice)
    $('body').on('submit', '.locationChoice', addLocation)
    $('body').on('submit', '.feedbackSubmitted', submitFeedback)
   //  $('body').on('mouseover', '.description', function() {
   // $(this).parent().children('.descript').show()
       $('body').on('mouseover', '.event', function() {
   $(this).children('.descript').show()})
    $('body').on('mouseout', '.event', function() {
   $(this).children('.descript').show()})

    // $('body').on('click', '.description', showDescription)
    // $('body').on('click', '.description', function() {
    //    $(this).parent().children('.descript').show()

    // $('.event').mouseover(function() {
    //   $(this).children(".descript").show();
// })
    // $(this).children(".descript").show();
    // $('body').on('click', '.description',
    // console.log("OVER THE THING")

  }

//     $(this).children(".descript").show();
// }).mouseout(function() {
//     $(this).children(".descript").hide();
// });

// $(".event").mouseover(function (){console.log($(this).children(".descript"))})

  // function showDescription (){
  //   var event_container = $(this).parent()
  //   event_container.children('#desc').toggleClass('descriptionNone')
  //   // $('#desc').toggleClass('descriptionNone')
  // }

  function eventChoice() {
    event.preventDefault();
    var event_container = $(this).parent()
    var event_data = {
      title: event_container.children('.title').text(),
      address: event_container.children('.event_address').text(),
      start_date: event_container.children('.start_date').text(),
      end_date: event_container.children('.end_date').text()
    }
    $.ajax({
      url: '/event/new',
      type: 'post',
      data: event_data,
      success: function(data) {
        $('.profile').html(data)
      }
    })
  }

   function addLocation(event) {
      event.preventDefault();
      var jqhxr = $.ajax({
        url: '/location/new',
        type: 'post',
        data: $(this).serialize(),
        success: function(data) {
          console.log(data);
          $('.locationChoice').append(data)
        }
      })
    }

    function submitFeedback(event) {
      event.preventDefault();
      var jqhxr = $.ajax({
        url: '/feedback/new',
        type: 'post',
        data: $(this).serialize(),
        success: function(data) {
          console.log(data);
          $('.feedbackSubmitted').append(data)
        }
      })
    }

  eventClick()
})



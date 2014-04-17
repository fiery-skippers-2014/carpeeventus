$(document).ready(function() {

  console.log('div is loaded')

  function eventClick(){
    $('body').on('click', '.eventChoice', eventChoice)

  }


  function eventChoice() {
    console.log("we are in the eventChoice function")
    event.preventDefault();
    var event_container = $(this).parent()
    debugger
    var event_data = {
      title: event_container.children('.title').text(),
      address: event_container.children('.event_address').text(),
      start_date: event_container.children('.start_date').text(),
      end_date: event_container.children('.end_date').text()
    }
    // var event_data = 1
    $.ajax({
      url: '/event/new',
      type: 'post',
      data: event_data,
      success: function(data) {
        console.log('u really hit the button')
        //console.log(data)
      }
    })

  }
  eventClick()
})



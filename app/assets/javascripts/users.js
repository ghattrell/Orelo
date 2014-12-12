$(document).ready(function(){
  //poll the server for new_recieved_calls
  function getCalls(){
    var since = $('#since').val();
    $.ajax({
      url: '/calls?since=' + since,
      dataType: 'json',
      type: 'get'
    }).success(function(data){
      console.log(data)
      $.each(data, function(index, call){
        $('.received-calls').prepend('<p>' + call.user.firstname + ' is calling you</p>');
        console.log(call.user.firstname)
        alert(call.user.firstname+ " " + "is calling you!!!! Pick the fuck up")
        updateTimestamp(call);
      })
    })
  }

  function addCalls(data) {
    console.log(data)
    $.each(data, function(i, call) {
      $('.received-calls').prepend(call)
      console.log(call.user.firstname)
      alert(call.user.firstname+ " " + "is calling you!!!! Pick the fuck up")

    })
  }

  function updateTimestamp(data) {
    if (data.length > 1) {
      $('#since').val(data[data.length-1].created_at);    
    }
  }

  // function ajaxRequest(data) {
  //   var ajaxOptions = {
  //     url: '/calls',
  //     dataType: 'json',
  //     data: data,
  //     type: 'get'
  //   };
  //   return $.ajax(ajaxOptions).success(addCalls).success(updateTimestamp)
  // }

  if($('.received-calls').length > 0){
    setInterval(getCalls, 10000);
  }

});







// $(function() {
//   $('#message_form').on('submit', function(ev) {
//     ev.preventDefault();
//     ajaxRequest({'message': $('#message').val(), 'since': $('#since').val()}).success(clearForm);
//   });
//   if(!!$("#match-messages").length){
//     setInterval(function() {
//       console.log("interval")
//       ajaxRequest(
//         {'since': $('#since').val()}
//         )
//     }, 2000);
//   }
  
// });
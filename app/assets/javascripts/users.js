$(document).ready(function(){
  //poll the server for new_recieved_calls
  function getCalls(){
    console.log('getCalls')
    $.ajax({
      url: '/calls',
      dataType: 'json',
      type: 'get'
    }).success(function(data){
      console.log(data)
      $.each(data, function(index, call){
        $('.received-calls').prepend(call)
        console.log(call.user.firstname)
        alert(call.user.firstname+ " " + "is calling you!!!! Pick the fuck up")
        
      })
    })
  }
  if($('.received-calls').length > 0){
    setInterval(getCalls, 10000);
  }
})
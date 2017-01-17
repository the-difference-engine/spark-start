function changeRole(id, status) {
  var userId = id;
  var url = "/api/v1/users/" + userId;
  if(status == true){
    var data = false;
  }else{
    var data = true;
  }
  $.ajax(url, {
      method: 'PUT',
      headers: {
                  'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
                },
      contentType: 'application/json',
      processData: false,
      success: function(res){
        window.location = window.location
      },
      data: JSON.stringify({
          admin: data
      })
  });

};
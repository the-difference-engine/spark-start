function changeRole() {
  var url = "/api/v1/users/3";
  var data = {"admin": false}

  $.ajax(url, {
      method: 'PUT',
      contentType: 'application/json',
      processData: false,
      data: JSON.stringify({
          user_id: data
      })
  });

};

function colorChange() {
  var checked
};
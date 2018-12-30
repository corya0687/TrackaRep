function createRun(url, data) {
  $.ajax({
    type: 'POST',
    url: url,
    data: data,
    dataType: 'json',
    success:  function (data) {
      window.location.pathname = 'users/'+data.user_id+'/runs/'+data.id;
    },
    error: function() {
      console.log($.makeArray(arguments));
    }
  });
}

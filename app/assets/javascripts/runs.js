$(document).ready(function () {
 attachRunListeners();
});

function attachRunListeners() {
  setRunDataUrl();
}

function setRunDataUrl() {
  $("#end-run").on('click',function (e) {
    var url = $(this).data("href")
    var data = {
      "run" : {
        "duration" : duration_seconds
        }
      }
      updateRun(url, data);
  })

}

function updateRun(url, data) {
  $.ajax({
    url: url,
    type: 'PATCH',
    dataType: 'javascript',
    data: data
  })
}

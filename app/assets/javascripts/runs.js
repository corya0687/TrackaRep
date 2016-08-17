$(document).ready(function () {
 attachRunListeners();
});

function attachRunListeners() {
  setRunDataUrl();
}



function setRunDataUrl() {
  $("#end-run").on('click',function (e) {
    debugger;

    let url = $(this).data("href")
    let data = {
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
    data: data,
    success: console.log(data)
  })
}

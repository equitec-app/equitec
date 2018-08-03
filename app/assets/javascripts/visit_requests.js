

function CreateVisitRequestForm() {
  console.log('Entrooooo putitooos');
  $( "select" ).change(function () {
    console.log("Detecto el cambio");
    var value = $( "#visit_request_concept" ).val();
    console.log(value);
  })

  // setInterval(function() {
  //   $( "select" ).change(function () {
  //     console.log("Detecto el cambio");
  //     var value = $( "#visit_request_concept" ).val();
  //     console.log(value);
  //   })
  // }, 1000);
}

$("document").ready(function() {
  

  $("#add_animal").on("click", function() {
      // Data to be submitted
      newAnimal = {
        // create the animal object
        "animal": {
        // the animal has a common name
        "common_name": $("#common_name").val(),
        // the animal has a latin name
        "latin_name": $("#latin_name").val(),
        // the animal has a kingdom
        "kingdom": $("#kingdom").val(),
        }
      } // end newAnimal variable

      // give an alert to show newAnimal object. Use JSON.stringify to show the object, otherwise the alert will just show [object Object]
      alert("Sending message: " + JSON.stringify(newAnimal));
      // create the Ajax call.
      $.ajax({
        // tell the server that we are talking JSON
        dataType: 'json',
        // tell the server what resource to retrieve
        url: '/animals',
        // the HTTP method to store information on the server
        method: 'POST',
        // data to be sent. In this case it is the newAnimal object that was created
        data: newAnimal,
        // call this function if call to server was successful
        success: function(dataFromServer) {
          alert("Received message: " + JSON.stringify(dataFromServer));
          add_to_animal_list(dataFromServer);
        },
        // call this function if call to server was not successful
        error: function(jqXHR, textStatus, errorThrown) {
          alert("Add new animal failed: " + errorThrown);
        }
      });// end ajax

  });// end add animal

});

// Function to be called after data has been successfully submitted
function add_to_animal_list(data) {
  $("#animal_list").append(
    "<tr>" +
      "<td>" + data.common_name + "</td>" +
      "<td>" + data.latin_name + "</td>" +
      "<td>" + data.kingdom + "</td>" +
      '<td><a href="/animals/' + data.id + '">Show</a></td>' +
      '<td><a href="/animals/' + data.id + '/edit"' + ">Edit</a></td>" +
      '<td><a data-confirm="Are you sure?" rel="nofollow" data-method="delete" href="/animals/' + data.id + '">Destroy</a></td>' +
    "</tr>"
  )
};

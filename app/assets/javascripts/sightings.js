$("document").ready(function() {

  $("#add_sighting").on("click", function() {
      // Data to be submitted
      newSighting = {
        // create the sighting object
        "sighting": {
        // the sighting will be for the current animal
        "animal_id": $("#animal_id").val(),
        // the sighting has a date and time
        "date_time": $("#sighting_date_time_1i").val() + "-" + $("#sighting_date_time_2i").val() + "-" + $("#sighting_date_time_3i").val() + "T" +  $("#sighting_date_time_4i").val() + ":" + $("#sighting_date_time_5i").val() + ":00.000Z",
        // the sighting has a latitude
        "latitude": $("#latitude").val(),
        // the sighting has a longitude
        "longitude": $("#longitude").val(),
        }
      } // end newSighting variable

      // give an alert to show newSighting object. Use JSON.stringify to show the object, otherwise the alert will just show [object Object]
      alert("Sending message: " + JSON.stringify(newSighting));
      // create the Ajax call.
      $.ajax({
        // tell the server that we are talking JSON
        dataType: 'json',
        // tell the server what resource to retrieve
        url: '/sightings',
        // the HTTP method to store information on the server
        method: 'POST',
        // data to be sent. In this case it is the newsighting object that was created
        data: newSighting,
        // call this function if call to server was successful
        success: function(dataFromServer) {
          alert("Received message: " + JSON.stringify(dataFromServer));
          add_to_sighting_list(dataFromServer);
        },
        // call this function if call to server was not successful
        error: function(jqXHR, textStatus, errorThrown) {
          alert("Add new sighting failed: " + errorThrown);
        }
      });// end ajax

  });// end add sighting

});

// Function to be called after data has been successfully submitted
function add_to_sighting_list(data) {
  $("#sighting_list").append(
    '<li>' + data.date_time + data.latitude + data.longitude + "</li>"
  );
};

$(document).ready(function() {
   $("#calendar").fullCalendar({
     header: {
				left: 'title',
				center: '',
				right: 'month, basicWeek, basicDay, prev,next'
			},
     events: "/animals/get_sightings",
     timeFormat: "LT",
     eventClick: function(event) {
      if (event.url) {
          window.open(event.url);
          return false;
      }
    }
  });
});

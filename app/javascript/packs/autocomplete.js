function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var loadAddress = document.getElementById('flat_address');

    if (loadAddress) {
      var autocomplete = new google.maps.places.Autocomplete(loadAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(loadAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault();
        }
      });
    }
  });
}

export { autocomplete };

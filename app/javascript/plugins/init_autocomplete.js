import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('inputOrigin');
  const addressDestino = document.getElementById('inputDestino');
  if (addressInput || addressDestino) {
    places({ container: addressInput });
    places({ container: addressDestino });
  }
};

export { initAutocomplete };

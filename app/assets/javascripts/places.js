// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

document.addEventListener('turbolinks:load', function() {

  var modal             = document.getElementById('place-images-modal');
  var modalBackground   = document.getElementsByClassName('modal-background')[0];
  var modalClose        = document.getElementsByClassName('modal-close')[0];
  var modalImageSrc     = document.querySelectorAll('#place-images-modal img')[0];
  var modalOpenInNewTab = document.querySelectorAll('.modal-content a')[0];
  var placeImages       = Array.from(document.getElementsByClassName('place-image'));
  var body              = document.getElementsByTagName('body')[0];

  placeImages.forEach(function(placeImage) {

    placeImage.addEventListener('click', function() {
      var image = this.dataset.image;

      modal.classList.add('is-active');
      modalImageSrc.setAttribute('src', image);
      modalOpenInNewTab.setAttribute('href', image);

      // Add closing of modal when clicked on the background outside the image
      modalBackground.addEventListener('click', function() {
        modal.classList.remove('is-active');
      });

      // Add listener to close modal when x icon is clicked
      modalClose.addEventListener('click', function() {
        modal.classList.remove('is-active');
      });

      // Add listener to close modal when escape key is pressed
      body.addEventListener('keyup', function(e) {
        if (e.key === 'Escape') {
          modal.classList.remove('is-active');
        }
      });

    });

  });
});

// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

document.addEventListener('turbolinks:load', function() {

  var modal           = document.getElementById('place-images-modal');
  var modalBackground = document.getElementsByClassName('modal-background')[0];
  var modalClose      = document.getElementsByClassName('modal-close')[0];
  var modalImageSrc   = document.querySelectorAll('#place-images-modal img')[0];
  var placeImages     = Array.from(document.getElementsByClassName('place-image'));
  var body            = document.getElementsByTagName('body')[0];

  placeImages.forEach(function(placeImage) {
    placeImage.addEventListener('click', function() {
      var image = this.dataset.image;

      modal.classList.add('is-active');
      modalImageSrc.setAttribute('src', image);
    });
  });

  if (!!modalBackground) {
    modalBackground.addEventListener('click', function() {
      modal.classList.remove('is-active');
    });
  }

  if (!!modalClose) {
    modalClose.addEventListener('click', function() {
      modal.classList.remove('is-active');
    });
  }

  body.addEventListener('keyup', function(e) {
    if (e.key === 'Escape') {
      modal.classList.remove('is-active');
    }
  });

});

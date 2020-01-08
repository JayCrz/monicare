import $ from 'jquery';

window.onload = function() {
  let anchor = /(#.*)/;
  if (document.location.href.match(anchor)){
    switch (window.location.hash) {
      case '#meal':
        $('#list-meal-list').click();
        break;
      case '#misc':
        $('list-misc-list').click();
        break;
      case '#list-pick-up':
        $('#list-pick-up-list').click();
        break;
      case '#feed-medicine':
        $('list-medicine-list').click();
        break;
    }
  } 

  function readURL(uploadPicInput) {
    if (uploadPicInput.files && uploadPicInput.files[0]) {
      let reader = new FileReader();
      
      reader.onload = function(picUrl) {
        $('#preview_pick_up_pic').attr('src', picUrl.target.result);
      }
      
      reader.readAsDataURL(uploadPicInput.files[0]);
      $('.pick_up_pic_url').text(uploadPicInput.files[0].name);
    }
  }
  
  $("#pick_up_pick_up_pic").change(function() {
    readURL(this);
  });
};


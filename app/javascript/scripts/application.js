import $ from 'jquery';
import './search'
import './flatpickr'
import './delete_alert'

window.onload = function() {
  let anchor = /(#.*)/;
  if (document.location.href.match(anchor)){
    switch (window.location.hash) {
      case '#meal':
        $('#list-meal-list').click();
        break;
      case '#misc':
        $('#list-misc-list').click();
        break;
      case '#list-pick-up':
        $('#list-pick-up-list').click();
        break;
      case '#feed-medicine':
        $('#list-medicine-list').click();
        break;
    }
  }

  function readURL(uploadPicInput) {
    if (uploadPicInput.files && uploadPicInput.files[0]) {
      let reader = new FileReader();
      
      reader.onload = function(picUrl) {
        $('#preview_pick_up_pic').attr('src', picUrl.target.result);
        $('#preview_child_pic').attr('src', picUrl.target.result);
        $('#preview_meal_pic').attr('src', picUrl.target.result);
        $('#preview_misc_pic').attr('src', picUrl.target.result);
        $('#preview_pick_up_pic').show();
        $('#preview_child_pic').show();
        $('#preview_meal_pic').show();
        $('#preview_misc_pic').show();
      }
      
      reader.readAsDataURL(uploadPicInput.files[0]);
      $('.pick_up_pic_url').text(uploadPicInput.files[0].name);
      $('.child_pic_url').text(uploadPicInput.files[0].name);
      $('.meal_pic_url').text(uploadPicInput.files[0].name);
      $('.misc_pic_url').text(uploadPicInput.files[0].name);
    }
  }
  
  $("#pick_up_pick_up_pic").change(function() {
    readURL(this);
  });
  $("#child_child_pic").change(function() {
    readURL(this);
  });
  $("#dashboard_admin_sign").change(function() {
    readURL(this);
  });
};


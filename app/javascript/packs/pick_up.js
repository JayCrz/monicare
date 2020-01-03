import $ from 'jquery'

window.onload = function() {
  let anchor = /(#.*)/;
  document.location.href.match(anchor)[0];
  document.querySelector('#list-pick-up-list').click();
};

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

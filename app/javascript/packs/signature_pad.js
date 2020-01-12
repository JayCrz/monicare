import SignaturePad from 'signature_pad';
import $ from 'jquery';
import Swal from 'sweetalert2'

let canvas = document.getElementById('signature-pad');

window.onload = function() {
  signaturePad.off();
  $('.signature-pad-wrapper').hide();
  $('#clear').hide();
  $('#save').hide();
}

function resizeCanvas() {
  let ratio =  Math.max(window.devicePixelRatio || 1, 1);
  canvas.width = canvas.offsetWidth * ratio;
  canvas.height = canvas.offsetHeight * ratio;
  canvas.getContext("2d").scale(ratio, ratio);
}

window.onresize = resizeCanvas;
resizeCanvas();

let signaturePad = new SignaturePad(canvas, {
  backgroundColor: 'rgb(250, 250, 250)'
});

document.getElementById('draw').addEventListener('click', function () {
  $('.signature-pad-wrapper').show();
  signaturePad.on();
  $('#draw').hide();
  $('#clear').show();
  $('#save').show();
});

document.getElementById('clear').addEventListener('click', function () {
  signaturePad.clear();
  signaturePad.on();
});

document.getElementById('save').addEventListener('click', function () {
  if (signaturePad.isEmpty()) {
    return Swal.fire({
      title: "請務必簽名!",
      icon: 'warning'
    });
  }
  let data = signaturePad.toDataURL();
  signaturePad.off();
  $('#dashboard_parent_sign').attr('value', data);
  $('#dashboard_admin_sign').attr('value', data);
  Swal.fire({
    title: "已簽署完成",
    html: '請務必按下<b>新增紀錄</b>或<b>更新紀錄</b>的按鈕喔!',
    icon: 'success'
  });
});

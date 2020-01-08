import SignaturePad from 'signature_pad';
import $ from 'jquery';

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
  backgroundColor: 'rgb(255, 255, 255)'
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
    return alert("請務必簽名!");
  }
  let data = signaturePad.toDataURL();
  signaturePad.off();
  $('#dashboard_parent_sign').attr('value', data);
  $('#dashboard_admin_sign').attr('value', data);
  alert("已簽署完成! 請務必按下新增紀錄或更新紀錄的按鈕喔!");
});

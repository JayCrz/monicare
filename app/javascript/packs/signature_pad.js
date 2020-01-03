import SignaturePad from 'signature_pad';
import $ from 'jquery';

let canvas = document.getElementById('signature-pad');

window.onload = function() {
  signaturePad.off();
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
  backgroundColor: 'rgb(255, 255, 255)' // necessary for saving image as JPEG; can be removed is only saving as PNG or SVG
});

document.getElementById('save').addEventListener('click', function () {
  if (signaturePad.isEmpty()) {
    return alert("請務必簽名!");
  }

  let data = signaturePad.toDataURL();
  console.log(data);
  signaturePad.off();
  $('#dashboard_parent_sign').attr('value', data);
});

document.getElementById('draw').addEventListener('click', function () {
  signaturePad.on();
  let ctx = canvas.getContext('2d');
  console.log(ctx.globalCompositeOperation);
  ctx.globalCompositeOperation = 'source-over';
});

document.getElementById('clear').addEventListener('click', function () {
  signaturePad.clear();
  signaturePad.on();
});

document.getElementById('undo').addEventListener('click', function () {
	let data = signaturePad.toData();
  if (data) {
    data.pop(); // remove the last dot or line
    signaturePad.fromData(data);
  }
});

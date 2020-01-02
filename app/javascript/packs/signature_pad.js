import SignaturePad from 'signature_pad';

let canvas = document.getElementById('signature-pad');

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

document.getElementById('save-jpeg').addEventListener('click', function () {
  if (signaturePad.isEmpty()) {
    return alert("Pl  ease provide a signature first.");
  }

  let data = signaturePad.toDataURL('image/jpeg');
  console.log(data);
  window.open(data);
});

// document.getElementById('draw').addEventListener('click', function () {
//   let ctx = canvas.getContext('2d');
//   console.log(ctx.globalCompositeOperation);
//   ctx.globalCompositeOperation = 'source-over'; 
// });

document.getElementById('clear').addEventListener('click', function () {
  signaturePad.clear();
});

document.getElementById('undo').addEventListener('click', function () {
	let data = signaturePad.toData();
  if (data) {
    data.pop(); // remove the last dot or line
    signaturePad.fromData(data);
  }
});

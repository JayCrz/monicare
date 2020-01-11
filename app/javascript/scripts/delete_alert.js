import $ from 'jquery'
import Swal from 'sweetalert2'
$(document).ready(() => {
  $('.confirm_delete').on('click',function(){
    if (this.dataset['go_delete'] === 'true') {
      return true
    }
    let self = this;
    Swal.fire({
      title: '確認刪除?',
      text: "執行後將無法恢復該明細",
      icon: 'warning',
      showCancelButton: true,
      cancelButtonText: '取消',
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: '確認刪除'
    }).then(reslut => {
      if (reslut.value) {
        Swal.fire({
          title: '成功刪除',
          text: '本視窗將在兩秒後自動關閉',
          icon: 'success',
          showConfirmButton: false,
          timer: 2000,
          timerProgressBar: true,
        })
        self.dataset['go_delete'] = 'true';
        setTimeout(() => {
          self.click();
          console.log('執行刪除')
        }, 1180);
      }
      
    })
    return false
  })
})
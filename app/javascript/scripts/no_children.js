import $ from 'jquery'
import Swal from 'sweetalert2'

$(document).ready(()=> {
  let url = window.location.pathname
  if ( url === '/dashboard') {
    let $list =  $('.children_list')
    let text = $list.html().toString().trim()
    if (text.length === 0) {
      Swal.fire({
        title: '您目前沒有小孩資料',
        text: '請聯繫老師新增您的孩子',
        icon: 'warning'
      })     
    }
    
  }
})
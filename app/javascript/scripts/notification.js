import $ from 'jquery'
import axios from 'axios'

$(document).ready(()=> {
  let notification_url = window.location.pathname.split('/')
  console.log(notification_url)
  if ( notification_url[4] === 'medicine' && notification_url[5] === 'new'){
    $('.btn_new').on('click',function(){
      $('.btn_notification').click()
    })
  }
  
})
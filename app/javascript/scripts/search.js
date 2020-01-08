import $ from 'jquery'
import axios from 'axios'
$(document).ready(()=>{
  let serach_value = $('.search').val()
  $('.search_btn').on('click',function(){
    event.preventDefault()
    axios.get('http://localhost:3000/api',{params:{serach_value: $('.search').val()}})
       .then(function(response){
         let student_list = response.data.map(student => (
          `<tr>
            <td>圖</td>
            <td>${student.name}</td>
            <td><a href="/teacher/dashboard/children/${student.id}/overview" class="btn btn-info">列表</a></td>
            <td><a href="/teacher/dashboard/children/${student.id}" class="btn btn-info">功能</a></td>
          </tr>`
       ))
         let student_area = document.querySelector('.student_list')
         let student_list_str = ''
         for (let i = 0; i < student_list.length; i++) {
          student_list_str += student_list[i]
        }
        if (student_list_str !== '' ){
          student_area.innerHTML = student_list_str}
        else
          alert('沒有符合的搜尋結果')
       })
  })
})
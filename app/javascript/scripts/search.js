import $ from 'jquery'
import axios from 'axios'
$(document).ready(()=>{
  let serach_value = $('.search').val()
  let search_url = window.location.href
  if(search_url === 'http://localhost:3000/teacher/dashboard'){
    $('.search_btn').on('click',function(){
      event.preventDefault()
      axios.get('http://localhost:3000/search_student',{params:{serach_value: $('.search').val()}})
        .then(function(response){
          let student_list = response.data.map(student => {
            if (student.child_pic == null) {
              return`<tr>
                      <td><img id="preview_child_pic" src="https://fakeimg.pl/247x247/FFDD55/FFA488/?text=小孩照片&font=noto" alt="小孩圖片"></td>
                      <td>${student.name}</td>
                      <td><a href="/teacher/dashboard/children/${student.id}/overview" class="btn btn-info">列表</a></td>
                      <td><a href="/teacher/dashboard/children/${student.id}" class="btn btn-info">功能</a></td>
                    </tr>`   
            }else{
              return`<tr>
              <td><img id="preview_child_pic" src="${student.child_pic.url}" alt="小孩圖片"></td>
              <td>${student.name}</td>
              <td><a href="/teacher/dashboard/children/${student.id}/overview" class="btn btn-info">列表</a></td>
              <td><a href="/teacher/dashboard/children/${student.id}" class="btn btn-info">功能</a></td>
            </tr>` 
            }

          })
          let student_area = document.querySelector('.student_list')
          let student_list_str = ''
          for ( let i = 0; i < student_list.length; i++) {
            student_list_str += student_list[i]
          }
          if (student_list_str !== '' ) {
            student_area.innerHTML = student_list_str}
          else{
            alert('沒有符合的搜尋結果')
          }
        })
    })
  }  

  if (search_url.slice(22,31) === 'dashboard' && search_url.slice(-8) === 'overview') {
    $('.search_btn').on('click', function() {
      event.preventDefault()
      axios.get('http://localhost:3000/search_dashboard',{params:{serach_value: $('.search').val(), child_id: search_url.slice(-10,-9)}})
           .then(response =>{
             let dashboard_list = response.data.map(dashboard => { 
               if(dashboard[4] !== 'medicine') {
                return`<tr>
                        <td><a href="/dashboard/children/${dashboard[5]}/${dashboard[4]}/${dashboard[3]}" class="font-weight-bold text-danger">${dashboard[0]}</a></td>
                        <td>${dashboard[1]}</td>
                        <td>${dashboard[2]}</td>
                        <td><a href="/dashboard/children/${dashboard[5]}/${dashboard[4]}/${dashboard[3]}" class="btn btn-info">詳情</a></td>
                      </tr>`
               }else{
                return`<tr>
                        <td><a href="/dashboard/children/${dashboard[5]}/${dashboard[4]}/${dashboard[3]}/edit" class="font-weight-bold text-danger">${dashboard[0]}</a></td>
                        <td>${dashboard[1]}</td>
                        <td>${dashboard[2]}</td>
                        <td><a href="/dashboard/children/${dashboard[5]}/${dashboard[4]}/${dashboard[3]}/edit" class="btn btn-info">詳情</a></td>
                      </tr>`                    
               }             
              })
             let dashboard_area = document.querySelector('.dashboard_list')
             let dashboard_list_str = ''
             for (let i = 0; i < dashboard_list.length; i++) {
               dashboard_list_str += dashboard_list[i]
             }
             if (dashboard_list_str !== ''){
              dashboard_area.innerHTML = dashboard_list_str
             }else{
               alert('請輸入正確的日期格式，或日期局部數字，ex : 2020-01-02 或 2020 或 01-02')
             }
           })
    })
  }


})
import $ from 'jquery'
import axios from 'axios'
import Swal from 'sweetalert2'

$(document).ready(()=>{
  let search_url = window.location.pathname
  let url_ary = search_url.split('/')
  if(search_url === '/teacher/dashboard'){
    $('.search_btn').on('click',function(){
      console.log($('.search_value').val())
      event.preventDefault()
      axios.get('http://localhost:3000/api/search_student',{params:{serach_value: $('.search_value').val()}})
        .then(function(response){
          if (response.status === 200) {
            return response.data
          } else {
            throw new Error('Oops! Something Wrong, Pease Check Status ')
          }
        })
        .then(function(result){
          console.log(result)
          let student_list = result.map(student => {
            if (student.child_pic.url == null) {
              return` <a href="/teacher/dashboard/children/${student.id}/overview" class="col-6 mb-3">
                        <div class="card">
                          <div class="card-image">
                            <img src="https://fakeimg.pl/247x247/?text=小孩照片&font=noto" class="card-img-top child_pic" alt="${student.name}的照片">
                          </div>
                          <div class="card-body align-items-center pt-3 pb-3">
                            <h5 class="child-name font-weight-bold">${student.name}</h5>
                          </div>
                         </div>
                       </a> ` 
            } else {
              return` <a href="/teacher/dashboard/children/${student.id}/overview" class="col-6 mb-3">
                        <div class="card">
                          <div class="card-image">
                            <img src="${student.child_pic.url}" class="card-img-top child_pic" alt="${student.name}的照片">
                          </div>
                          <div class="card-body align-items-center pt-3 pb-3">
                            <h5 class="child-name font-weight-bold">${student.name}</h5>
                          </div>
                        </div>
                      </a>`
            }
          })
          let student_area = document.querySelector('.student_list')
          let student_list_str = ''
          for ( let i = 0; i < student_list.length; i++) {
            student_list_str += student_list[i]
          }
          if (student_list_str !== '' ) {
            student_area.innerHTML = student_list_str
          } else {
            Swal.fire({
              title: '沒有符合的搜尋結果',
              text: '請重新輸入',
              icon: 'info'
            })
          }
        })
        .catch(function(error){
          Swal.fire({
            title: '' + error,
            icon: 'error'
          });
        })
    })
  }  

  if (url_ary[1] === 'dashboard' && url_ary[4] === 'overview') {
    $('.search_btn').on('click', function() {
      event.preventDefault()
      axios.get('http://localhost:3000/api/search_dashboard',{params:{serach_value: $('.search').val(), child_id: url_ary[3]}})
           .then(function(response){
             if (response.status === 200) {
               return response.data
             } else {
               throw new Error('Oops! Something Wrong, Pease Check Status ')
            }
           })
           .then(result =>{
             let dashboard_list = result.map(dashboard => { 
               if(dashboard[4] !== 'medicine') {
                return`<table class="table">
                        <tr>
                          <td><a href="/dashboard/children/${dashboard[5]}/${dashboard[4]}/${dashboard[3]}" class="font-weight-bold link-button">${dashboard[0]}</a></td>
                          <td>${dashboard[1]}</td>
                          <td>${dashboard[2]}</td>
                          <td><a href="/dashboard/children/${dashboard[5]}/${dashboard[4]}/${dashboard[3]}" class="btn more-button">詳情</a></td>
                        </tr>
                       </table>`
               } else {
                return`<table class="table">
                        <tr>
                          <td><a href="/dashboard/children/${dashboard[5]}/${dashboard[4]}/${dashboard[3]}/edit" class="font-weight-bold link-button">${dashboard[0]}</a></td>
                          <td>${dashboard[1]}</td>
                          <td>${dashboard[2]}</td>
                          <td><a href="/dashboard/children/${dashboard[5]}/${dashboard[4]}/${dashboard[3]}/edit" class="btn more-button">詳情</a></td>
                        </tr>
                       </table>`                    
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
               Swal.fire({
                 title: '找不到相符的結果',
                 html: '<p>請確認輸入日期格式</p><p>如 : <b>2020-01-02</b> 或 <b>2020</b> 或 <b>01-02</b></p>',
                 icon: 'warning'
                })
             }
           })
           .catch(function(error){
            Swal.fire({
              title: '' + error,
              icon: 'error'
            })
          })
    })
  }

  if (url_ary[1] === 'teacher' && url_ary[2] === 'dashboard' && url_ary[5] === 'overview') {
    $('.search_btn').on('click', function() {
      event.preventDefault()
      axios.get('http://localhost:3000/api/search_dashboard',{params:{serach_value: $('.search').val(), child_id: url_ary[4]}})
           .then(function(response){
             if (response.status === 200) {
               return response.data
             } else {
               throw new Error('Oops! Something Wrong, Pease Check Status ')
            }
           })
           .then(result =>{
             console.log(result)
             let dashboard_list = result.map(dashboard => { 
               if(dashboard[4] !== 'medicine') {
                return`
                        <tr>
                          <td><a href="/dashboard/children/${dashboard[5]}/${dashboard[4]}/${dashboard[3]}" class="font-weight-bold link-button">${dashboard[0]}</a></td>
                          <td>${dashboard[1]}</td>
                          <td>${dashboard[2]}</td>
                          <td><a href="/dashboard/children/${dashboard[5]}/${dashboard[4]}/${dashboard[3]}" class="btn more-button">詳情</a></td>
                        </tr>`
               } else {
                return`
                        <tr>
                          <td><a href="/dashboard/children/${dashboard[5]}/${dashboard[4]}/${dashboard[3]}/edit" class="font-weight-bold link-button">${dashboard[0]}</a></td>
                          <td>${dashboard[1]}</td>
                          <td>${dashboard[2]}</td>
                          <td><a href="/dashboard/children/${dashboard[5]}/${dashboard[4]}/${dashboard[3]}/edit" class="btn more-button">詳情</a></td>
                        </tr>`                    
               }             
              })
             let dashboard_area = document.querySelector('.dashboard_list')
             let dashboard_list_str = ''
             for (let i = 0; i < dashboard_list.length; i++) {
               dashboard_list_str += dashboard_list[i]
             }
             if (dashboard_list_str !== ''){
              dashboard_area.innerHTML = `<table class="table>${dashboard_list_str}</table>`
             }else{
               Swal.fire({
                 title: '找不到相符的結果',
                 html: '<p>請確認輸入日期格式</p><p>如 : <b>2020-01-02</b> 或 <b>2020</b> 或 <b>01-02</b></p>',
                 icon: 'warning'
                })
             }
           })
           .catch(function(error){
            Swal.fire({
              title: '' + error,
              icon: 'error'
            })
          })
    })
  }
})

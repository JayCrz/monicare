import $ from 'jquery'
import axios from 'axios'
import Swal from 'sweetalert2'

$(document).ready(()=>{
  let search_url = window.location.pathname
  let url_ary = search_url.split('/')
  if(search_url === '/teacher/dashboard' || url_ary[3] === 'myclass'){
    $('.search_btn').on('click',function(){
      event.preventDefault()
      axios.get('http://localhost:3000/api/search_student',{params:{serach_value: $('.search_value').val(), class: url_ary[3], class_id: url_ary[4]}})
        .then(function(response){
          if (response.status === 200) {
            return response.data
          } else {
            throw new Error('Oops! Something Wrong, Pease Check Status ')
          }
        })
        .then(function(result){
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
    $('.search_btn_show').on('click', function() {
      event.preventDefault()
      let date_style = /\d\d\d\d-\d\d-\d\d/.test($('.search').val())
      if ($('.search').val() !== '' && date_style) {
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
                  let content = dashboard[2]
                  if (dashboard[2] === '') {
                    content = '無內容'
                  }
                  return` <tr>
                            <th class="font-weight-bold text-dark">
                              <i class="fas fa-capsules mb-1"></i>
                              <a href="/dashboard/children/${dashboard[5]}/${dashboard[4]}/${dashboard[3]}/edit" class="font-weight-bold link-button">${dashboard[0]}</a>
                            </th>
                            </tr>
                            <tr>
                              <td>${content}</td>
                            </tr>`
                } else {
                  let content = dashboard[2]
                  if (dashboard[2] === '') {
                    content = '無內容'
                  }
                  return` <tr>
                            <th class="font-weight-bold text-dark">
                              <i class="fas fa-capsules mb-1"></i>
                              <a href="/dashboard/children/${dashboard[5]}/${dashboard[4]}/${dashboard[3]}" class="font-weight-bold link-button">${dashboard[0]}</a>
                            </th>
                            </tr>
                          <tr>
                            <td>${content}</td>
                          </tr>`                   
                }             
                })
              let dashboard_area = document.querySelector('.overview_dashboard')
              let dashboard_list_str = ''
              for (let i = 0; i < dashboard_list.length; i++) {
                dashboard_list_str += dashboard_list[i]
              }
              if ( dashboard_list_str !== '' ){
                dashboard_area.innerHTML = `<table class="table"><tbody class="list">${dashboard_list_str}</tbody></table>`
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
      }else{
        Swal.fire({
          title: '請輸入欲查詢日期',
          html: '<p>請確認輸入日期格式如 :</p><p> <b>2020-01-02</b> 或 <b>2020</b> 或 <b>01-02</b></p>',
          icon: 'warning'
          })
      }
    })
  }

  if (url_ary[1] === 'teacher' && url_ary[2] === 'dashboard' && url_ary[5] === 'overview') {
    $('.search_btn_show').on('click', function() {
      event.preventDefault()
      let date_style = /\d\d\d\d-\d\d-\d\d/.test($('.search').val())
      if ( $('.search').val() !== '' && date_style){
        axios.get('http://localhost:3000/api/search_dashboard',{params:{serach_value: $('.search').val(), child_id: url_ary[4]}})
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
                  let content = dashboard[2]
                  if (dashboard[2] === '') {
                    content = '無內容'
                  }
                  return` <tr>
                            <th class="font-weight-bold text-dark">
                              <i class="fas fa-capsules mb-1"></i>
                              <a href="/teacher/dashboard/children/${dashboard[5]}/${dashboard[4]}/${dashboard[3]}/edit" class="font-weight-bold link-button">${dashboard[0]}</a>
                            </th>
                            </tr>
                            <tr>
                              <td>${content}</td>
                            </tr>`
                } else {
                  let content = dashboard[2]
                  if (dashboard[2] === '') {
                    content = '無內容'
                  }
                  return` <tr>
                            <th class="font-weight-bold text-dark">
                              <i class="fas fa-capsules mb-1"></i>
                              <a href="/teacher/dashboard/children/${dashboard[5]}/${dashboard[4]}/${dashboard[3]}" class="font-weight-bold link-button">${dashboard[0]}</a>
                            </th>
                            </tr>
                          <tr>
                            <td>${content}</td>
                          </tr>`                  
                }             
                })
              let dashboard_area = document.querySelector('.overview_dashboard')
              let dashboard_list_str = ''
              for (let i = 0; i < dashboard_list.length; i++) {
                dashboard_list_str += dashboard_list[i]
              }
              if (dashboard_list_str !== ''){
                dashboard_area.innerHTML = `<table class="table"><tbody class="list">${dashboard_list_str}</tbody></table>`
              }else{
                Swal.fire({
                  title: '找不到相符的結果',
                  html: '<p>請確認輸入日期格式</p><p>如 : <b>2020-01-02</b></p>',
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
      }else{
        Swal.fire({
          title: '請輸入欲查詢日期',
          html: '<p>日期格式如 :</p><p><b>2020-01-02</b></p>',
          icon: 'warning'
        })
      }
    })
  }
})

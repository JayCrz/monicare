import 'flatpickr/dist/flatpickr.min.css'
import flatpickr from 'flatpickr'

document.addEventListener('DOMContentLoaded',function(){
  flatpickr(".datetimepickr", {
    enableTime: true,
    dateFormat: "Y-m-d H:i",
    minDate: "today",
    maxDate: new Date().fp_incr(6)
  })

  flatpickr(".todaypickr", {
    enableTime: true,
    dateFormat: "Y-m-d H:i",
    defaultDate: "today",
    minDate: "today",
    maxDate: "today"
  })

  flatpickr(".three_day_scope", {
    minDate:new Date().fp_incr(-3),

    maxDate: new Date().fp_incr(3)

    // defaultDate: "today",
    // minDate: "today",
    // maxDate: "today"
  })
})

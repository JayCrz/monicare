import 'flatpickr/dist/flatpickr.min.css'
import flatpickr from 'flatpickr'

document.addEventListener('DOMContentLoaded',function(){
  flatpickr(".datetimepickr", {
    disableMobile: true,
    enableTime: true,
    dateFormat: "Y-m-d H:i",
    minDate: "today",
    maxDate: new Date().fp_incr(6)
  })

  flatpickr(".todaypickr", {
    disableMobile: true,
    enableTime: true,
    dateFormat: "Y-m-d H:i",
    defaultDate: "today",
    // noCalendar: true,
  })

flatpickr(".today_without_time", {
  disableMobile: true,
    defaultDate: "today",
    // noCalendar: true,
  })
})

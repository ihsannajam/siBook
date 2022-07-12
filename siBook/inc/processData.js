const rsvDate = document.getElementById('rsvDate')
const rsvTimeStart = document.getElementById('rsvTimeStart')
const rsvTimeEnd = document.getElementById('rsvTimeEnd')
const rsvQty = document.getElementById('rsvQty')

const form = document.getElementById('form')
const errormsg = document.getElementById('error_msg')

document.getElementById("form").addEventListener('submit', (e) =>{
    let messages = ''
    var date = new Date(dob.value)

    if(rsvDate.value === '') { 
      messages='The date for reservation is empty';
    }
    else if(rsvTimeStart.value === '') {
      messages='The start time for reservation is empty';
    }
    else if(rsvTimeEnd.value === '') {
      messages='The end time for reservation is empty';
    }
    else if(rsvQty.value === ''){
      messages='Quantity must not be empty';
    }
    if(messages!==""){
      e.preventDefault()
      errormsg.innerText = messages
    }  
})
  
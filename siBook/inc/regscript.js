const email = document.getElementById('email')
const fname = document.getElementById('fname')
const dob = document.getElementById('dob')
const gender = document.getElementById('gender')
const phone = document.getElementById('phone')
const password = document.getElementById('password')
const cpassword = document.getElementById('cpassword')



const form = document.getElementById('form')
const errormsg = document.getElementById('error_msg')

var numbers = /^08[0-9]+/
var email_val = /[a-z0-9]+@(gmail|yahoo|hotmail|outlook|binus).(com|co.id|ac.id)/
var alpha = /[a-zA-Z]+/
var num = /[0-9]+/


form.addEventListener('submit', (e) =>{
    let messages = ''
    var date = new Date(dob.value)
    if(email.value === '' || !email.value.match(email_val)){
        messages='Email field is empty or invalid\n *Email must contain @ and a following address'
    }
    else if(fname.value === ''){
        messages='Full Name field is empty or invalid'
    }
    else if(dob.value === '' || date.getFullYear()>2007){
        messages='Date of Birth field is empty or invalid\n *Must be 15 years or older'
    }
    else if(gender.value == ""){
        messages='Gender field is empty'
    }
    else if(!phone.value.match(numbers) || phone.value.length < 8 || phone.value.length > 12){
        messages='Phone Number field is empty or invalid\n *Must be 8-12 digits long'
    }
    else if(password.value.length < 8 || password.value.length > 20 || !password.value.match(alpha) || !password.value.match(num)){
        messages='Password field is empty or invalid\n *Must contain 8 - 20 characters with atleast one alphabet and one numerical value'
    }
    else if(!cpassword.value.match(password.value)){
        messages='Password confirmation did not match'
    }
    if(messages!==""){
        e.preventDefault()
        errormsg.innerText=messages
    }
    // console.log(email.value)
    // console.log(fname.value)
    // console.log(dob.value)
    // console.log(gender.value)
    // console.log(typeof(dob.value))
    // console.log(date)
    
    
})
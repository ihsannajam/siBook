const email = document.getElementById('email')
const password = document.getElementById('password')



const form = document.getElementById('form')
const errormsg = document.getElementById('error_msg')


form.addEventListener('submit', (e) =>{
    let messages = ''
    if(email.value === '' || password.value === ''){
        messages='Login Invalid\n Email or Password is Incorrect'
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
const old = document.getElementById('Old')
const news = document.getElementById('New')
const confirm = document.getElementById('Confirm')

const form = document.getElementById('form')
const errormsg = document.getElementById('error_msg')

document.getElementById("changeid").addEventListener("submit", function(e){
    let messages = ''
    if(old.value == '' || news.value == '' || confirm.value == ''){
        alert("Please input password")
        
    }
    else if(news.value != confirm.value){
        alert("Password not match")
    }
    if(messages!==""){
        e.preventDefault()
        errormsg.innerText=messages
    }
});

    



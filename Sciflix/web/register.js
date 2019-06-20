var check = function() {
  if (document.getElementById('password').value ==
    document.getElementById('confirm_password').value) {
    document.getElementById('message').style.color = 'white';
    document.getElementById('message').innerHTML = 'Matching';
    document.getElementById('submit').disabled = false;
  } else {
    document.getElementById('message').style.color = 'red';
    document.getElementById('message').innerHTML = 'Not Matching!';
    document.getElementById('submit').disabled = true;
  }
}

var login=function(){
document.getElementByName('message').innerHTML ='Please check username or password';
}
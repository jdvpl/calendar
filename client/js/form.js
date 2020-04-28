$(document).ready(function () {
  $('#mostrar1').click(function () {
    if ($('#mostrar1').is(':checked')) {
      $('#contrasena').attr('type', 'text');
    } else {
      $('#contrasena').attr('type', 'password');
    }
  });
});

$(document).ready(function () {
  $('#mostrar1').click(function () {
    if ($('#mostrar1').is(':checked')) {
      $('#contrasenaRepetida').attr('type', 'text');
    } else {
      $('#contrasenaRepetida').attr('type', 'password');
    }
  });
});

$(function(){

  $('#formulario').submit(function(event){
  event.preventDefault();
  checkContrasena();
  
  //checkContrasena();
  })


  $('select').material_select();
  $('.datepicker').pickadate({
  selectMonths: true,
  selectYears: 50,
  format: 'yyyy-mm-dd'
  });

 
  
  
  })

 

function checkContrasena(){
  var contrasena = $('#contrasena').val();
  var repContrasena = $('#contrasenaRepetida').val();

  if (contrasena===repContrasena) {
    getDatos();

  }else {
    alert('Las contraseñas no coinciden')
  }
}

function getDatos(){
  var form_data = new FormData();
  form_data.append('nombre', $('#nombre').val());
  form_data.append('fechaNacimiento', $('#fechaNacimiento').val());
  form_data.append('email', $('#email').val());
  form_data.append('contrasena', $('#contrasena').val());
  sendForm(form_data);
}

function sendForm(formData){
  $.ajax({
    url: '../server/create_user1.php',
    dataType: "json",
    cache: false,
    processData: false,
    contentType: false,
    data: formData,
    type: 'POST',
    success: function(php_response){
      if (php_response.msg == "exito en la inserción") {
        window.location.href = 'index.html';
      }else {
        alert(php_response.msg);
      }
    },
    error: function(){
      alert("error en la comunicación con el servidorform");
    }
  })
}






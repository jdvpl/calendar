<?php

  require('./conector.php');


 
  $con = new ConectorBD();
  $response['conexion'] = $con->initConexion($con->database);



  if ($response['conexion']=='OK') {

    
  $data['nombre'] = "'".$_POST['nombre']."'";
  $data['fecha_nacimiento'] = "'".$_POST['fechaNacimiento']."'";
  $data['email'] = "'".$_POST['email']."'";
  $data['password'] = "'".password_hash($_POST['contrasena'], PASSWORD_DEFAULT)."'";

    if($con->insertData('usuarios', $data)){
      $response['msg']="exito en la inserción";
    }else {
      $response['msg']= "Hubo un error y los datos no han sido cargados";
    }
  }else {
    $response['msg']= "No se pudo conectar a la base de datos";
  }

  echo json_encode($response);


 ?>

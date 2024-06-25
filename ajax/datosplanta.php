<?php
session_start();
require "../modelos/planta.php";

$planta = new plantas();
$circulorojo = "<i class='fa-solid fa-circle' style='color: #ff0000;'></i>";
$circuloverde = "<i class='fa-solid fa-circle' style='color: #00ff00;'></i>";
$circuloamarillo = "<i class='fa-solid fa-circle' style='color: #FFD43B;'></i>";

switch ( $_GET[ "op" ] ) {
  case "listar":
    $respuesta = $planta->listar();

    if ( $respuesta->num_rows > 0 ) {
      $datos = array();
      while ( $fila = $respuesta->fetch_row() ) {
        $humedad = calcularporcentaje( $fila[ 1 ] );
        $luz = calcularporcentaje( $fila[ 2 ] );
        $nivelagua = calcularNivel( $fila[ 3 ] );
        $fecha = explode( " ", $fila[ 4 ] );
        $datos[] = array(
          "Humedad" => $humedad . "%",
          "LuzSolar" => $luz . "%",
          "NivelAgua" => $nivelagua . "%",
          "Fecha" => $fecha[ 0 ],
          "Hora" => $fecha[ 1 ],
        );
      }
    }
    echo json_encode( array( "data" => $datos ) );
    break;
  case "ultimo":
    $respuesta = $planta->UltimoDato();
    if ( $respuesta->num_rows > 0 ) {
      $fila = $respuesta->fetch_row();
      $humedad = calcularporcentaje( $fila[ 1 ] );
      $luz = calcularporcentaje( $fila[ 2 ] );
      $nivelagua = calcularNivel( $fila[ 3 ] );
      switch ( true ) {
        case ( $humedad <= 20 ):
          $estadoH = $circulorojo . " Seco";
          break;
        case ( $humedad > 20 && $humedad <= 60 ):
          $estadoH = $circuloamarillo . " Humedo";
          break;
        case ( $humedad > 60 && $humedad <= 100 ):
          $estadoH = $circuloverde . " Mojado";
          break;
      }
      switch ( true ) {
        case ( $luz <= 20 ):
          $estadoL = $circulorojo . " Baja Intensidad";
          break;
        case ( $luz > 20 && $luz <= 60 ):
          $estadoL = $circuloamarillo . " Intensidad Moderada";
          break;
        case ( $luz > 60 && $luz <= 100 ):
          $estadoL = $circuloverde . " Alta Intensidad";
          break;
      }
      switch ( true ) {
        case ( $nivelagua <= 20 ):
          $estadoA = $circulorojo . " Bajo";
          break;
        case ( $nivelagua > 20 && $nivelagua <= 60 ):
          $estadoA = $circuloamarillo . " Normal";
          break;
        case ( $nivelagua > 60 && $nivelagua <= 100 ):
          $estadoA = $circuloverde . " Alto";
          break;
      }
      $fecha = explode( "*", $fila[ 4 ] );
      $estado = "<h4>Estado: " . $fecha[ 0 ] . " a las " . $fecha[ 1 ] . "</h4><p>Humedad: " . $humedad . "% " . $estadoH . "</p><p>Luz Solar: " . $luz . "% " . $estadoL . "</p><p>Nivel del agua: " .
      $nivelagua . "% " . $estadoA . "</p>";
    }
    echo $estado;
    break;
  case "estadistica":
    $fecha = isset( $_POST[ "fec" ] ) ? $_POST[ "fec" ] : date( "Y-m-d", strtotime( "yesterday" ) );
    $respuesta = $planta->estadisticaDiaria( $fecha );

    if ( $respuesta->num_rows > 0 ) {
      $datos = array();

      while ( $fila = $respuesta->fetch_row() ) {
        $datos[ "hora" ][] = horaDecimal( $fila[ 5 ] );
        $datos[ "humedad" ][] = calcularPorcentaje( $fila[ 1 ] );
        $datos[ "luz" ][] = calcularPorcentaje( $fila[ 2 ] );
        $datos[ "nivelagua" ][] = calcularNivel( $fila[ 3 ] );
      }
      array_multisort( $datos[ 'hora' ], $datos[ 'humedad' ], $datos[ 'luz' ], $datos[ 'nivelagua' ] );
      echo json_encode( $datos );
    }
    break;
}

function calcularPorcentaje( $numero ) {
  $porcentaje = ( $numero / 1023 ) * 100;
  return number_format( $porcentaje, 2 );
}

function calcularNivel( $numero ) {
  $porcentaje = ( $numero / 30 ) * 100;
  return number_format( $porcentaje, 2 );
}

function horaDecimal( $hora ) {
  $hora = explode( ":", $hora );
  $hora = $hora[ 0 ] + $hora[ 1 ] / 60;
  return number_format( $hora, 2 );
}
?>

<?php
require( "../config/conexion.php" );
class plantas {
  function listar() {
    $sql = "call sp_DatosP(2, null, null, null, null, null)";
    return ejecutarConsultaSP( $sql );
  }

  function UltimoDato() {
    $sql = "call sp_DatosP(4, null, null, null, null, null)";
    return ejecutarConsultaSP( $sql );
  }

  function insertPlan( $humedad, $luz, $agua ) {
    $sql = "call sp_DatosP(1, null, $humedad, $luz, $agua, null)";
    return ejecutarConsultaSP( $sql );
  }

  function estadisticaDiaria( $fecha ) {
    $sql = "call sp_DatosP(5, null, null, null, null, '$fecha')";
    return ejecutarConsultaSP( $sql );
  }
}
?>
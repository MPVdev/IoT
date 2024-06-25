<!doctype html>
<html lang="es">
<head>
<meta charset="utf-8">
<title>Proyecto IoT</title>
<link href="files/estilos.css" rel="stylesheet">
<link href="files/datatables.min.css" rel="stylesheet">
<link href="files/fontawesome-free-6.5.1/css/fontawesome.css" rel="stylesheet">
<link href="files/fontawesome-free-6.5.1/css/brands.css" rel="stylesheet">
<link href="files/fontawesome-free-6.5.1/css/solid.css" rel="stylesheet">
</head>
<body>
<h2>Sistema de Riego Automatico</h2>
<div id="Estadodiv"></div>
<div class="fila-botones">
  <button id="btnTabla" name="btnTabla" class="glow-on-hover">Mostrar Tabla</button>
  <button id="btnEstadisticas" name="btnEstadisticas" class="glow-on-hover">Mostrar Estadisticas</button>
  <button id="btnActualizar" name="btnActualizar" class="glow-on-hover">Actualizar</button>
</div>
<div id="tabladiv">
  <table id="DatosPlanta" name="DatosPlanta" class="tablas">
    <thead>
      <tr>
        <th>Fecha</th>
        <th>Hora</th>
        <th>Humedad</th>
        <th>Luz Solar</th>
        <th>Nivel Agua</th>
      </tr>
    </thead>
    <tbody>
    </tbody>
  </table>
</div>
<div id="estadisticasdiv" style="display: none">
  <input type="date" id="fecha" value="2024-02-15">
  <canvas id="myLineChart" width="800" height="600"></canvas>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="files/jquery-3.7.1.min.js"></script>
<script src="files/datatables.min.js"></script>
<script src="vistas/js/IoT.js"></script>
</html>

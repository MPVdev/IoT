$(document).ready(function () {
  var dataestadistica = [];

  $("#fecha").change(function () {
    var fechaSeleccionada = $(this).val();
    estadistica(fechaSeleccionada);
    actualizarestadistica();
  });
  var options = {
    scales: {
      x: {
        type: 'linear',
        position: 'bottom',
        min: 0,
        max: 24,
        beginAtZero: true,
        ticks: {
          stepSize: 1
        },
        title: {
          display: true,
          text: 'Hora del Dia'
        },
      },
      y: {
        type: 'linear',
        position: 'left',
        beginAtZero: true,
        max: 100,
        title: {
          display: true,
          text: 'Porcentaje'
        },
      }
    },
    plugins: {
      title: {
        display: true,
        text: 'Relacion Hora - Porcentaje',
      }
    }
  };

  estadistica("2024-02-15");

  actualizarestadistica();

  var myLineChart;

  function actualizarestadistica() {
    var ctx = document.getElementById('myLineChart').getContext('2d');

    // Verifica si myLineChart ya está definido antes de destruirlo
    if (myLineChart) {
      myLineChart.destroy();
    }

    myLineChart = new Chart(ctx, {
      type: 'line',
      data: dataestadistica,
      options: options
    });
  }


  $("#btnTabla").click(function () {
    $("#tabladiv").toggle();
    if ($("#tabladiv").is(":visible")) {
      $("#estadisticasdiv").hide();
      $("#btnEstadisticas").text("Mostrar Estadisticas");
    }
    var texto = $("#tabladiv").is(":visible") ? "Ocultar Tabla" : "Mostrar Tabla";
    $("#btnTabla").text(texto);
  });

  $("#btnEstadisticas").click(function () {
    $("#estadisticasdiv").toggle();
    if ($("#estadisticasdiv").is(":visible")) {
      $("#tabladiv").hide();
      $("#btnTabla").text("Mostrar Tabla");
    }
    var texto = $("#estadisticasdiv").is(":visible") ? "Ocultar Estadisticas" : "Mostrar Estadisticas";
    $("#btnEstadisticas").text(texto);
  });


  $("#btnActualizar").click(function () {
    VerDatos();
    ultimoDato();
  });

  VerDatos();
  ultimoDato();

  function VerDatos() {
    $('#DatosPlanta').DataTable().destroy();
    $('#DatosPlanta').DataTable({
      language: {
        url: "../files/datatable-spanish.json"
      },
      ajax: {
        url: "../ajax/datosplanta.php?op=listar",
        type: "POST",
        dataSrc: 'data'
      },
      columns: [{
          data: 'Fecha'
        },
        {
          data: 'Hora'
        },
        {
          data: 'Humedad'
        },
        {
          data: 'LuzSolar'
        },
        {
          data: 'NivelAgua'
        },
      ]
    });
  }

  function ultimoDato() {
    var estado = document.getElementById("Estadodiv");
    $.ajax({
      url: "../ajax/datosplanta.php?op=ultimo",
      type: "POST",
      contentType: false,
      processData: false,
      async: false,
      success: function (datos) {
        datos = datos.replace(/\\/g, '').replace(/"/g, '');
        estado.innerHTML = datos;
      }
    });
  }

  function estadistica(fe) {
    $.ajax({
      url: "../ajax/datosplanta.php?op=estadistica",
      type: "POST",
      data: {
        fec: fe
      },
      success: function (response) {
        var data = JSON.parse(response);

        var horaArray = data.hora.map(parseFloat);
        var humedadArray = data.humedad.map(parseFloat);
        var luzArray = data.luz.map(parseFloat);
        var aguaArray = data.nivelagua.map(parseFloat);

        dataestadistica = {
          labels: ["0:00", "1:00", "2:00", "3:00", "4:00", "5:00", "6:00", "7:00", "8:00", "9:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00", "21:00", "22:00", "23:00", "24:00"],
          datasets: [{
              label: 'Humedad',
              data: horaArray.map((valor, index) => ({
                x: valor,
                y: humedadArray[index]
              })),
              fill: false,
              borderColor: 'rgba(0, 255, 212, 1)',
              borderWidth: 2
            },
            {
              label: 'Luz Solar',
              data: horaArray.map((valor, index) => ({
                x: valor,
                y: luzArray[index]
              })),
              fill: false,
              borderColor: 'rgba(255, 185, 0, 1)',
              borderWidth: 2
            },
            {
              label: 'Nivel de Agua',
              data: horaArray.map((valor, index) => ({
                x: valor,
                y: aguaArray[index]
              })),
              fill: false,
              borderColor: 'rgba(10, 40, 210, 1)',
              borderWidth: 2
            },
          ]
        };
        actualizarestadistica();
      }
    });
  }
});

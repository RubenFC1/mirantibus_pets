<%@ page import="dominio.modelos.Mascota" %>
<%@ page import="datos.MascotaDAO" %>
<%@ page import="dominio.constructores.MascotaBuilder" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
  <title>registro-mascota-perdida</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assetsPerdida/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat&amp;display=swap">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assetsPerdida/css/Registration-Form-with-Photo.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assetsPerdida/css/styles.css">
</head>

<body>

<!-- Barra de navegación -->
<jsp:include page="../comunes/barraDeNavegacion.jsp"/>

<div id="contenedor">
  <section class="register-photo">
    <div class="form-container">
      <form method="post"
            action="${pageContext.request.contextPath}/ServletControladorMascota?action=registerLost"
            enctype="multipart/form-data">
        <h2 class="text-center"><strong>Registro de mascota perdida</strong></h2>
        <div class="mb-3"><input class="form-control" type="text" placeholder="Nombre" name="nombre" required="" maxlength="25"><select class="form-select" id="genero" required="" name="genero">
          <option value="" selected="">Género</option>
          <option value="f">Hembra</option>
          <option value="m">Macho</option>
        </select></div>
        <div class="mb-3"><input class="form-control" type="number" placeholder="Edad" name="edad" required="" max="30"><input class="form-control derechas" type="date" name="ultima-vez-visto" required=""></div>
        <div class="mb-3"><input class="form-control" type="text" placeholder="Raza" name="raza" required="" maxlength="25"><input class="form-control derechas" type="text" name="contacto" placeholder="Contacto" required="" maxlength="25"></div>
        <div class="mb-3"><input class="form-control" type="text" placeholder="Especie" name="especie" required="" maxlength="25"><input class="form-control derechas" type="file" name="foto-mascota" required="" accept="image/png, image/jpeg, image/jpg, image/ico"></div>
        <div class="mb-3"><textarea class="form-control" id="desc" name="descripcion" placeholder="Descripción" required="" maxlength="180"></textarea></div>
        <input type="hidden" name="id-usuario" value="${usuario.idUsuario}">
        <div class="mb-3"><button class="btn btn-primary d-block" id="enviar" type="submit">Subir mascota</button></div>
      </form>
    </div>
  </section><img class="imgLost" src="${pageContext.request.contextPath}/resources/assetsPerdida/img/gatore.png">
</div>
<script src="${pageContext.request.contextPath}/resources/assetsPerdida/bootstrap/js/bootstrap.min.js"></script>

<!-- Pie de página -->
<jsp:include page="../comunes/pieDePagina.jsp"/>

</body>

</html>

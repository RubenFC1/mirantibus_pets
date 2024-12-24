<%--@elvariable id="usuario" type="dominio.modelos.Usuario"--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../comunes/validacionDeSesion.jsp" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Mirantibus Pets - Registrar Mascota</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat&amp;display=swap">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assetsMascota/css/styles.css">
</head>

<body>

<!-- Barra de navegación -->
<jsp:include page="../comunes/barraDeNavegacion.jsp"/>

<div id="contenedor">
    <div id="titulo">
        <h1 class="text-center" id="retitulo"><strong>Registro de mascota&nbsp;</strong></h1>
    </div>
    <img id="foto" src="${pageContext.request.contextPath}/resources/assetsMascota/img/mascotas.png">
    <div id="div2">
        <section class="register-photo">
            <div class="form-container">
                <form method="post"
                      action="${pageContext.request.contextPath}/ServletControladorMascota?action=register">
                    <div>
                        <h6 id="rellena">Rellena los campos con la información solicitada</h6>
                    </div>
                    <div class="mb-3"><input class="form-control" type="text" placeholder="Nombre" name="nombre"
                                             required="" maxlength="25"></div>
                    <div class="mb-3"><input class="form-control" type="number" placeholder="Edad" name="edad"
                                             required="" min="0" max="30"></div>
                    <div class="mb-3"><input class="form-control" type="text" placeholder="Raza" name="raza" required=""
                                             maxlength="25"></div>
                    <div class="mb-3"><input class="form-control" type="text" placeholder="Especie" name="especie"
                                             required=""
                                             maxlength="25"></div>
                    <div class="mb-3"><select class="form-select" id="genero" required="" name="genero">
                        <option value="m" selected="">Macho</option>
                        <option value="f">Hembra</option>
                    </select></div>

                    <input type="hidden" name="id-usuario" value="${usuario.idUsuario}">
                    <div class="mb-3">
                        <button class="btn btn-primary d-block" id="enviar" type="submit">Subir mascota</button>
                    </div>
                </form>
            </div>
        </section>
    </div>
</div>

<!-- Pie de página -->
<jsp:include page="../comunes/pieDePagina.jsp"/>
</body>

</html>
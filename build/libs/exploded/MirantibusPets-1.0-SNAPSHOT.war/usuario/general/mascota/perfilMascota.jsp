<%@ page import="datos.MascotaDAO" %>
<%@ page import="dominio.constructores.MascotaBuilder" %>
<%@ page import="dominio.modelos.Mascota" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Contact Us - Brand</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assetsMascota/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:400,400i,700,700i,600,600i">
</head>

<body style="font-family: Montserrat, sans-serif;">

<!-- Barra de navegación -->
<jsp:include page="../comunes/barraDeNavegacion.jsp"/>

<main class="page contact-us-page"
      style="background: url(${pageContext.request.contextPath}/resources/assetsMascota//img/banner-dog-and-cat-in-row-hiding-isolated-on-gray-background.jpg) center / cover, rgba(0,0,0,0);">
    <section class="clean-block clean-form dark" style="background: rgba(0,0,0,0);filter: blur(0px);">
        <div class="container" style="opacity: 1;border-left-color: rgba(33,37,41,0);">
            <div class="block-heading"
                 style="opacity: 1;border-color: rgba(33,37,41,0);">
                <h2 class="text-info" style="color: rgb(255,267,255);">Perfil de mascota</h2>
                <p style="color: rgb(0,0,0);">Aquí podrás editar el perfil de tu mascota :3</p>
            </div>

            <%
                int idMascota = Integer.parseInt(request.getParameter("mascota"));
                Mascota mascota = new MascotaDAO().encontrar(new MascotaBuilder().setIdMascota(idMascota).createMascota());
            %>

            <form method="post" action="${pageContext.request.contextPath}/ServletControladorMascota?action=update"
                  style="max-width: 700px;padding: 0px;background: rgba(0,0,0,0);opacity: 1;border-top-width: 0px;border-left-color: #000000;">
                <div class="row text-center"
                     style="opacity: 1;background: rgba(0,178,255,0.82);margin-right: 0px;margin-left: 0px;">
                    <div class="col align-self-center">
                        <label for="foto-mascota"><img
                                src="${pageContext.request.contextPath}/public/uploads/<%=mascota.getUriFotoMascota()%>>"
                                alt="Foto de tu Mascota"
                                style="height: 200px;width: auto;background: #fefefe;border-radius: 0;border-width: 5px;border-color: rgb(255,255,255);border-bottom: 0 solid rgb(255,255,255);box-shadow: 0 0 2px rgb(67,67,67);max-width: 200px;max-height: 200px;"></label>
                        <input type="file" id="foto-mascota" name="foto-perfil"
                               accept="image/png, image/jpeg, image/jpg, image/ico"
                               style="display: none;" data-bs-toggle="tooltip" title="Cambia la foto de tu mascota">
                    </div>
                    <div class="col text-start" style="font-size: 13px;padding: 26px;background: #ffffff;">
                        <div class="mb-3"><label class="form-label" for="nombre"
                                                 style="font-size: 13px;">Nombre</label><input class="form-control"
                                                                                               type="text" id="nombre"
                                                                                               name="name"
                                                                                               value="<%=mascota.getNombre()%>">
                        </div>
                        <div class="d-inline-flex mb-3">
                            <div><label class="form-label" for="edad" style="font-size: 13px;">Edad</label><input
                                    id="edad" name="edad" class="form-control" type="number"
                                    style="margin-right: -140px;" value="<%=mascota.getEdad()%>"></div>
                            <div style="margin-left: 18px;"><label class="form-label text-start" for="edad"
                                                                   style="width: 100%;font-size: 13px;">Raza</label><input
                                    class="form-control" type="text" id="subject-1" name="subject"></div>
                        </div>
                        <div class="d-inline-flex mb-3">
                            <div><label class="form-label" for="genero" style="font-size: 13px;">Género</label><input
                                    class="form-control" type="text" id="genero" name="genero"
                                    value="<%=mascota.getGenero()%>"></div>
                            <div style="margin-left: 18px;"><label class="form-label text-start" for="especie"
                                                                   style="width: 100%;font-size: 13px;">Especie</label><input
                                    class="form-control" type="text" id="especie" name="especie"
                                    value="<%=mascota.getEspecie()%>"></div>
                        </div>
                        <div class="mb-3"><label class="form-label" for="descripcion"
                                                 style="font-size: 13px;">Descripción</label>
                            <textarea class="form-control" id="descripcion" name="descripcion">
                            <%=mascota.getDescripcion()%>
                        </textarea></div>
                        <div class="d-lg-flex d-xxl-flex justify-content-center align-items-lg-center align-items-xxl-center">
                            <label class="form-label d-flex d-xxl-flex align-items-center justify-content-xxl-center align-items-xxl-center"
                                   style="margin-bottom: 0px;margin-right: 8px;font-size: 13px;">¿Está perdida tu
                                mascota?<input name="perdida" value="true"
                                               class="d-flex d-xxl-flex align-items-center justify-content-xxl-center align-items-xxl-center"
                                               type="checkbox"
                                               style="width: 15px;height: 15px;margin-left: 5px;"></label>
                        </div>
                        <div class="d-sm-flex d-xxl-flex align-items-end justify-content-sm-end justify-content-xxl-end mb-3"
                             style="margin-top: 33px;">
                            <button class="btn btn-primary d-sm-flex justify-content-sm-end" type="submit">Modificar
                                perfil
                            </button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </section>
</main>

<!-- Pie de página -->
<jsp:include page="../comunes/pieDePagina.jsp"/>

<script src="${pageContext.request.contextPath}/resources/assetsMascota/js/bs-init.js"></script>
</body>

</html>
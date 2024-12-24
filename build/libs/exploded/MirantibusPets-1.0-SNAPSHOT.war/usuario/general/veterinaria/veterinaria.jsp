<%@ page import="dominio.modelos.Mascota" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="datos.MascotaDAO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../comunes/validacionDeSesion.jsp" %>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Mirantibus Pets - Veterinaria</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat&amp;display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/assetsVeterinaria/css/Customizable-Background--Overlay.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assetsVeterinaria/css/Social-Icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assetsVeterinaria/css/styles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assetsVeterinaria/css/Register-form.css">
</head>

<body style="font-family: Montserrat, sans-serif;">

<!-- Barra de navegación -->
<jsp:include page="../comunes/barraDeNavegacion.jsp"/>

<!-- Bloque de titulo -->
<section>
    <div style="background-image: url(${pageContext.request.contextPath}/resources/assetsVeterinaria/img/veterinaria.jpg);height: 500px;background-position: center;background-size: cover;background-repeat: no-repeat;">
        <div class="d-flex justify-content-center align-items-center"
             style="height: inherit;min-height: initial;width: 100%;position: absolute;left: 0;background-color: rgba(34,34,34,0.5);">
            <div class="container">
                <h1 class="text-center"
                    style="color: rgb(255,255,255);font-size: 55px;font-family: Montserrat, sans-serif;">¡Ven y visita
                    la clínica Veterinaria Gamma Vet!</h1>
                <h3 class="text-center"
                    style="color: var(--bs-light);padding-top: 0.25em;padding-bottom: 0.25em;font-weight: normal;font-size: 22px;">
                    <strong>Los mejores servicios y cuidados para tu mascota.</strong><br>Tu amigo peludo necesita
                    cuidados y orientación profesional, sabemos lo importante que es para ti, así que no dudes en venir
                    con nosotros.<br>
                    <a href="tienda.jsp">
                        <button class="btn btn-outline-light btn-lg" type="button">¡Comprar!
                        </button>
                    </a>
                    <button class="btn btn-outline-light btn-lg" type="button" style="margin: 20px;"
                            data-bs-target="#agendar-cita"
                            data-bs-toggle="modal">Agendar cita
                    </button>
                    <br></h3>
            </div>
        </div>
    </div>
</section>

<%--@declare id="login"--%><input type="hidden" name="page" value="veterinaria" form="login">

<!-- Bloque de tienda -->
<section>
    <div class="container-fluid col-xxl-8 px-4 py-5">
        <div class="row flex-lg-row-reverse align-items-center g-5 py-5">
            <div class="col-lg-6">
                <h1 class="display-5 fw-bold lh-1 mb-3" style="font-size: 35px;">Visita tienda</h1>
                <p class="lead" style="font-size: 18px;">Al entrar en nuestra sección de tienda podrás reservar o
                    comprar
                    para tu mascota accesorios, medicamentos, productos alimenticios y de limpieza animal. Facilita tu
                    manera de consentir a tu mascota.</p>
                <div class="d-grid gap-2 d-md-flex justify-content-md-start">
                    <a href="tienda.jsp">
                        <button class="btn btn-outline-primary btn-lg" type="button">¡Ir ahora!
                        </button>
                    </a>
                </div>
            </div>
            <div class="col-10 col-sm-8 col-lg-6"><img class="img-fluid border-white d-block mx-lg-auto"
                                                       src="${pageContext.request.contextPath}/resources/assetsVeterinaria/img/Accesorios.jpg"
                                                       width="2000" height="1334" loading="lazy"
                                                       style="border: 6px solid var(--bs-gray-200);border-radius: 5px;"
                                                       alt="accesorios"></div>
        </div>
    </div>
</section>

<!-- Bloque de agendar cita -->
<section>
    <div class="container-fluid col-xxl-8 px-4 py-5">
        <div class="row flex-lg-row-reverse align-items-center g-5 py-5" id="agendar">
            <div class="col-10 col-sm-8 col-lg-6"><img class="img-fluid d-block mx-lg-auto" id="agendacion"
                                                       src="${pageContext.request.contextPath}/resources/assetsVeterinaria/img/agendar.jpg"
                                                       width="2000" height="1125" loading="lazy"
                                                       style="align-content: center;" alt="Imagen de una agenda"></div>
            <div class="col-lg-6">
                <h1 class="display-5 fw-bold lh-1 mb-3" style="font-size: 35px;">Agendar cita</h1>
                <p class="lead" style="font-size: 18px;">Podrás programar una cita en el horario y fecha de tu
                    conveniencia
                    llenando los datos solicitados de tú y tu mascota. Al igual que podrás modificarla o cancelarla
                    de
                    forma rápida y sencilla.</p>
                <div class="d-grid gap-2 d-md-flex justify-content-md-start">
                    <button class="btn btn-outline-primary btn-lg" type="button" data-bs-target="#agendar-cita"
                            data-bs-toggle="modal">¡Ir ahora!
                    </button>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Bloque de servicios -->
<section>
    <div class="container-fluid col-xxl-8 px-4 py-5">
        <div class="row flex-lg-row-reverse align-items-center g-5 py-5">
            <div class="col-lg-6">
                <h1 class="display-5 fw-bold lh-1 mb-3" style="font-size: 35px;">Servicios gratuitos</h1>
                <p class="lead" style="font-size: 18px;">Hacemos campañas de esterilización y aplicación de vacunas
                    completamente gratis. ¡Visita nuestras redes sociales! Brinda salud de calidad a tu mascota.</p>
                <div class="d-grid gap-2 d-md-flex justify-content-md-start">
                    <div class="social-icons"><a href="https://wa.link/ywzb3o" target="_blank"><i
                            class="icon ion-social-whatsapp-outline"></i></a><a
                            href="https://www.facebook.com/MedicalVeterinaria" target="_blank"><i
                            class="icon ion-social-facebook"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-10 col-sm-8 col-lg-6"><img class="img-fluid border-white d-block mx-lg-auto"
                                                       src="${pageContext.request.contextPath}/resources/assetsVeterinaria/img/Servicio.jpg"
                                                       width="626" height="417" loading="lazy"
                                                       style="border: 6px solid var(--bs-gray-200);border-radius: 5px;"
                                                       alt="Perrito siendo inyectado">
            </div>
        </div>
    </div>
</section>

<!-- Pie de página -->
<jsp:include page="../comunes/pieDePagina.jsp"/>

<!-- Modal de Agendar Cita-->
<div class="modal fade" role="dialog" tabindex="-1" id="agendar-cita">
    <div class="modal-dialog modal-xl" role="document">
        <div class="modal-content">
            <section>
                <div style="background-image: url(${pageContext.request.contextPath}/resources/assetsVeterinaria/img/GatoVeterinaria.png);height: 500px;background-position: center;background-size: cover;background-repeat: no-repeat;">
                    <div class="d-flex justify-content-center align-items-center"
                         style="height: inherit;min-height: initial;width: 100%;position: absolute;left: 0;background-color: rgba(34,34,34,0.5);">
                        <div class="d-flex align-items-center order-5" style="height:200px;">
                            <div class="container">
                                <h1 class="text-center"
                                    style="color: rgb(242,245,248);font-size: 55px;font-family: Montserrat, sans-serif;">
                                    Agendar cita</h1>
                                <h3 class="text-center"
                                    style="color: rgb(242,245,248);padding-top: 0.25em;padding-bottom: 0.25em;font-weight: bold;font-size: 22px;">
                                    ¡Ven y conócenos!&nbsp;</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <br>
            <section>
                <div class="rf-register-form">

                    <%
                        String idUsuario;
                        List<Mascota> perros = new ArrayList<>();
                        List<Mascota> gatos = new ArrayList<>();
                        List<Mascota> otros = new ArrayList<>();
                        if (usuario != null) {
                            idUsuario = usuario.getIdUsuario();
                            perros = new MascotaDAO().listarPerros(idUsuario);
                            gatos = new MascotaDAO().listarGatos(idUsuario);
                            otros = new MascotaDAO().listarOtros(idUsuario);
                        }
                    %>

                    <form class="rg-form">
                        <h4 class="text-center" style="font-family: Montserrat, sans-serif;">Si tus mascotas necesitan
                            ayuda, ¡Agenda una cita ahora!</h4>
                        <div class="align-items-center rf-input-container"><input class="border-white form-control"
                                                                                  type="text" readonly=""
                                                                                  value="Cita a nombre de: <%=usuario.getNombre()%> <%=usuario.getApellido()%>"
                                                                                  style="background: rgb(239,239,239);">
                        </div>
                        <div class="rf-input-container"><i
                                class="icon ion-social-octocat fa fa-user rf-icon"></i><select
                                class="form-select rf-input-field" data-bs-toggle="tooltip" data-bss-tooltip=""
                                title="Selecciona a tu mascota de la siguiente lista">
                            <optgroup label="Mis perros">
                                <%
                                    for (Mascota perro : perros) {
                                %>
                                <option value="<%=perro.getIdMascota()%>">
                                    <%=perro.getNombre()%>
                                </option>
                                <%
                                    }
                                %>
                            </optgroup>
                            <optgroup label="Mis gatos">
                                <%
                                    for (Mascota gato : gatos) {
                                %>
                                <option value="<%=gato.getIdMascota()%>">
                                    <%=gato.getNombre()%>
                                </option>
                                <%
                                    }
                                %>
                            </optgroup>
                            <optgroup label="Mis otras mascotas">
                                <%
                                    for (Mascota otro : otros) {
                                %>
                                <option value="<%=otro.getIdMascota()%>">
                                    Nombre: <%=otro.getNombre()%> | Especie: <%=otro.getEspecie()%>
                                </option>
                                <%
                                    }
                                %>
                            </optgroup>
                        </select></div>
                        <div class="rf-input-container"><i
                                class="icon ion-ios-calendar-outline fa fa-envelope rf-icon"></i><input
                                class="form-control rf-input-field" data-bs-toggle="tooltip" data-bss-tooltip=""
                                type="datetime-local" title="Elige la fecha y hora de tu cita"></div>
                        <button class="btn btn-primary rf-btn" type="button"
                                style="font-family: Montserrat, sans-serif;">Agendar
                        </button>
                    </form>
                </div>
            </section>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/resources/assetsVeterinaria/js/bs-init.js"></script>
</body>

</html>
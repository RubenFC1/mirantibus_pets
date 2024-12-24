<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../comunes/validacionDeSesion.jsp" %>
<!DOCTYPE html>
<html lang="es">

<head>
    <!-- Required meta tags -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Mirantibus Pets - Inicio</title>
    <!-- Inicio recursos de la página -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/assetsUsuario/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:400,400i,700,700i,600,600i">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assetsUsuario/css/Team-Grid.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assetsUsuario/css/vanilla-zoom.min.css">
    <!-- Fin recursos de la página -->
</head>

<body style="font-family: Montserrat, sans-serif;">

<!-- Barra de navegación -->
<jsp:include page="../comunes/barraDeNavegacion.jsp"/>

<!-- Cuerpo de la página -->
<main class="page landing-page">

    <!-- Bloque de inicio -->
    <section id="inicio" class="clean-block clean-hero"
             style="color: rgba(34,34,34,0.5);background: url(${pageContext.request.contextPath}/resources/assetsUsuario/img/group-portrait-of-adorable-puppies.jpg) center / cover no-repeat;">
        <div class="text">
            <h2 class="display-2">Mirantibus Pets</h2>
            <p><strong>¿Buscas un amigo nuevo?</strong><br>Tenemos perros y gatos en adopción en busca de la oportunidad
                de una nueva y buena vida</p>
        </div>
    </section>

    <!-- Bloque de servicios que ofrecemos -->
    <section id="servicios" class="clean-block features">
        <div class="container">
            <div class="block-heading">
                <h2 style="color: #8b91ff;">Servicios con los que contamos</h2>
                <p><em>Nuestro objetivo principal como empresa es&nbsp;ayudar a los animalitos que&nbsp;se encuentran en
                    situación de vulnerabilidad.</em><br></p>
            </div>
            <div class="row justify-content-center">
                <div class="col-md-5 feature-box"><i class="fas fa-cat icon" style="color: #ff7256;"></i>
                    <h4>Publicación de mascotas</h4>
                    <p>Podrás hacer uso de nuestro foro para publicar alguna mascota perdida o un animalito en situación de calle.</p>
                </div>
                <div class="col-md-5 feature-box"><i class="fas fa-heart icon" style="color: #ff7256;"></i>
                    <h4>Adopción de mascotas</h4>
                    <p>Brindamos la facilidad para ponerte en contacto con algún otro usuario para llevar a cabo el proceso de
                        adopción de alguna mascota.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Bloque acerca de nosotros -->
    <section id="acerca-de-nosotros" class="clean-block about-us">
        <div class="block-heading">
            <h2 style="color: #8b91ff;">Acerca de nosotros</h2>
            <p><strong><em><span style="text-decoration: underline;">En este apartado podrán visualizar al equipo de trabajo encargado del desarrollo de la aplicación, así como una breve descripción de su trabajo en la misma.</span></em></strong>
            </p>
        </div>
        <section class="team-grid">
            <div class="container">
                <div class="row people">
                    <div class="col-md-4 col-lg-3 item">
                        <div class="box"
                             style="background: url(${pageContext.request.contextPath}/resources/assetsUsuario/img/ruben.jpg) top / cover no-repeat;">
                            <div class="cover">
                                <h3 class="name">Rubén Flores</h3>
                                <p class="title" style="color: #8b91ff;">Desarrollador fullstack</p>
                                <div class="social"><a href="#"><i class="fa fa-facebook-official"></i></a><a
                                        href="#"><i class="fa fa-twitter"></i></a><a href="#"><i
                                        class="fa fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-lg-3 item">
                        <div class="box"
                             style="background: url(${pageContext.request.contextPath}/resources/assetsUsuario/img/alberto.jpg) bottom / cover no-repeat;">
                            <div class="cover">
                                <h3 class="name">Alberto Navarro</h3>
                                <p class="title" style="color: #8b91ff;">Diseñador y programador</p>
                                <div class="social"><a href="#"><i class="fa fa-facebook-official"></i></a><a
                                        href="#"><i class="fa fa-twitter"></i></a><a href="#"><i
                                        class="fa fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-lg-3 item">
                        <div class="box"
                             style="background: url(${pageContext.request.contextPath}/resources/assetsUsuario/img/daniel.jpg) center / cover no-repeat;">
                            <div class="cover">
                                <h3 class="name">Daniel Díaz</h3>
                                <p class="title" style="color: #8b91ff;">Ingeniero de software</p>
                                <div class="social"><a href="#"><i class="fa fa-facebook-official"></i></a><a
                                        href="#"><i class="fa fa-twitter"></i></a><a href="#"><i
                                        class="fa fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </section>

    <!-- Pie de página -->
    <jsp:include page="../comunes/pieDePagina.jsp"/>
</main>

<!-- Inicio Scripts -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assetsUsuario/js/vanilla-zoom.js"></script>
<script src="${pageContext.request.contextPath}/resources/assetsUsuario/js/theme.js"></script>
<!-- Fin Scripts -->
</body>

</html>
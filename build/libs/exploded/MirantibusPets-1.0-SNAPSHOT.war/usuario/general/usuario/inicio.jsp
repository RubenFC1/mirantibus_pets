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
            <a href="../centroDeAyuda/ayuda.jsp">
                <button class="btn btn-outline-light btn-lg" type="button">¡Adoptar ahora!</button>
            </a>
        </div>
    </section>

    <!-- Bloque de mascotas destacadas -->
    <section id="mascotas-destacadas" class="clean-block slider dark">
        <div class="container">
            <div class="block-heading">
                <h2 style="color: #8b91ff;">Mascotas destacadas</h2>
                <p>Algunas de las mascotas que puedes encontrar en el catálogo de adopción de nuestra sección centro de
                    ayuda.</p>
            </div>
            <div class="carousel slide" data-bs-ride="carousel" id="carousel-1">
                <div class="carousel-inner">
                    <div class="carousel-item active"><img class="w-100 d-block"
                                                           src="${pageContext.request.contextPath}/resources/assetsUsuario/img/image1.jpg"
                                                           alt="Slide Image"></div>
                    <div class="carousel-item"><img class="w-100 d-block"
                                                    src="${pageContext.request.contextPath}/resources/assetsUsuario/img/image4.jpg"
                                                    alt="Slide Image"></div>
                    <div class="carousel-item"><img class="w-100 d-block"
                                                    src="${pageContext.request.contextPath}/resources/assetsUsuario/img/image6.jpg"
                                                    alt="Slide Image"></div>
                </div>
                <div><a class="carousel-control-prev" href="#carousel-1" role="button" data-bs-slide="prev"><span
                        class="carousel-control-prev-icon"></span><span class="visually-hidden">Previous</span></a><a
                        class="carousel-control-next" href="#carousel-1" role="button" data-bs-slide="next"><span
                        class="carousel-control-next-icon"></span><span class="visually-hidden">Next</span></a></div>
                <ol class="carousel-indicators">
                    <li data-bs-target="#carousel-1" data-bs-slide-to="0" class="active"></li>
                    <li data-bs-target="#carousel-1" data-bs-slide-to="1"></li>
                    <li data-bs-target="#carousel-1" data-bs-slide-to="2"></li>
                </ol>
            </div>
        </div>
    </section>

    <!-- Bloque de introducción -->
    <section id="introduccion" class="clean-block clean-info dark">
        <div class="container">
            <div class="block-heading">
                <h2 style="color: #8b91ff;">Administra a tus mascotas</h2>
                <p>Mirantibus Pets es una aplicación diseñada para llevar un control con cada una de tus mascotas.</p>
            </div>
            <div class="row align-items-center">
                <div class="col-md-6"><img class="img-thumbnail"
                                           src="${pageContext.request.contextPath}/resources/assetsUsuario/img/cute-little-dog-impersonating-business-person.jpg"
                                           alt="Dog as person">
                </div>
                <div class="col-md-6">
                    <h3>Forma parte de nuestro proceso</h3>
                    <div class="getting-started-info">
                        <p>Por el momento los servicios que ofrecemos son variados, pero incrementaran con el tiempo. Se
                            tiene la idea de ir creando una aplicación con la cual el usuario maximice su productividad
                            y pueda administrar las actividades de su mascota, añadiendo compatibilidad con dispositivos
                            diseñados para mascota.</p>
                    </div>
                    <button class="btn btn-outline-primary btn-lg" type="button" data-bs-toggle="modal"
                            data-bs-target="#registro-de-usuario">Regístrate ahora
                    </button>
                </div>
            </div>
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
                    <h4>Registro de mascotas</h4>
                    <p>Cada aspecto de Mirantibus Pets se ha diseñado para facilitar la interacción del usuario con sus
                        mascotas.</p>
                </div>
                <div class="col-md-5 feature-box"><i class="fas fa-laptop-medical icon" style="color: #ff7256;"></i>
                    <h4>Veterinaria</h4>
                    <p>Contamos con el servicio de veterinaria, para que sus mascotas puedan recibir un servicio de
                        calidad en caso que lo necesiten.</p>
                </div>
                <div class="col-md-5 feature-box"><i class="fas fa-heart icon" style="color: #ff7256;"></i>
                    <h4>Centro de ayuda</h4>
                    <p>Brindaremos apoyo con sus mascotas a quien lo requiera, respondiendo sus preguntas. Igual podrás
                        contactarnos.</p>
                </div>
                <div class="col-md-5 feature-box"><i class="fas fa-shopping-cart icon" style="color: #ff7256;"></i>
                    <h4>Tienda</h4>
                    <p>Podrás comprar cualquier articulo que tu mascota requiera, ya sea juguetes, comida, medicina,
                        entre otros artículos.</p>
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
                             style="background: url(${pageContext.request.contextPath}/resources/assetsUsuario/img/diego_leyva.jpg) top / cover no-repeat;">
                            <div class="cover">
                                <h3 class="name">Diego Leyva</h3>
                                <p class="title" style="color: #8b91ff;">Director y Desarrollador</p>
                                <div class="social">
                                    <a href="https://github.com/AtomicZdaemoN" target="_blank"><i
                                            class="fab fa-github"></i></a>
                                    <a href="https://www.instagram.com/atomiczdaemon" target="_blank"><i
                                            class="fab fa-instagram"></i></a>
                                    <a href="https://twitter.com/atomiczbv" target="_blank"><i
                                            class="fab fa-twitter"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-lg-3 item">
                        <div class="box"
                             style="background: url(${pageContext.request.contextPath}/resources/assetsUsuario/img/cecilia_sanchez.jpeg) bottom / cover no-repeat;">
                            <div class="cover">
                                <h3 class="name">Leilani Sánchez</h3>
                                <p class="title" style="color: #8b91ff;">Diseñadora y artista</p>
                                <div class="social"><a href="#"><i class="fa fa-facebook-official"></i></a><a
                                        href="#"><i class="fa fa-twitter"></i></a><a href="#"><i
                                        class="fa fa-instagram"></i></a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-lg-3 item">
                        <div class="box"
                             style="background: url(${pageContext.request.contextPath}/resources/assetsUsuario/img/ruben_flores.jpg) center / cover no-repeat;">
                            <div class="cover">
                                <h3 class="name">Rubén Flores</h3>
                                <p class="title" style="color: #8b91ff;">Ingeniero de software</p>
                                <div class="social"><a href="#"><i class="fa fa-facebook-official"></i></a><a
                                        href="#"><i class="fa fa-twitter"></i></a><a href="#"><i
                                        class="fa fa-instagram"></i></a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-lg-3 item">
                        <div class="box"
                             style="background: url(${pageContext.request.contextPath}/resources/assetsUsuario/img/eduardo_martinez.jpg) center / cover no-repeat;">
                            <div class="cover">
                                <h3 class="name">Eduardo Martínez</h3>
                                <p class="title" style="color: #8b91ff;">Mercadologo y Tester&nbsp;</p>
                                <div class="social">
                                    <a href="#"><i class="fa fa-facebook-official"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
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
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!-- Imports Requeridos -->
<!--<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">-->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat+Alternates&amp;display=swap">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.0/css/all.css">
<!-- Fin Imports Requeridos -->

<!-- Componente -->
<nav class="navbar navbar-light navbar-expand-lg sticky-top bg-white"
     style="font-family: 'Montserrat Alternates', sans-serif;padding: 16px;">
    <div class="container-fluid"><a class="navbar-brand" href="#"><img
            src="${pageContext.request.contextPath}/resources/MIRANTIBUS.svg" loading="lazy"
            alt="Mirantibus Pets Logo"></a>
        <button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1"><span
                class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse text-center" id="navcol-1">
            <ul class="navbar-nav flex-fill justify-content-evenly">
                <li class="nav-item"><a class="nav-link active"
                                        href="${pageContext.request.contextPath}/usuario/invitado/inicio.jsp"><i
                        class="fas fa-home"></i>&nbsp;Inicio</a>
                </li>
                <li class="nav-item"><a class="nav-link active"
                                        href="${pageContext.request.contextPath}/usuario/invitado/inicio.jsp#acerca-de-nosotros"><i
                        class="fas fa-star"></i>&nbsp;Acerca
                    de nosotros</a></li>
                <li class="nav-item"><a class="nav-link active"
                                        href="${pageContext.request.contextPath}/usuario/invitado/mascota.jsp"><i
                        class="fas fa-dog"></i>&nbsp;Mascota</a>
                </li>
                <li class="nav-item"><a class="nav-link active"
                                        href="${pageContext.request.contextPath}/usuario/invitado/veterinaria.jsp"><i
                        class="fas fa-briefcase-medical"></i>&nbsp;Veterinaria</a></li>
                <li class="nav-item"><a class="nav-link active"
                                        href="${pageContext.request.contextPath}/usuario/invitado/ayuda.jsp"><i
                        class="fas fa-hands-helping"></i>&nbsp;Centro de Ayuda</a></li>
                <li class="nav-item"><a class="nav-link active" href="#" data-bs-target="#inicio-de-sesion"
                                        data-bs-toggle="modal"><i class="fas fa-user-alt"
                                                                  style="color: #222222;font-size: 18px;"></i>&nbsp;Inicio
                    de sesión</a></li>
                <li class="nav-item"><a class="nav-link" href="#" style="color: rgba(0, 0, 0, 0.55);"
                                        data-bs-target="#inicio-de-sesion"
                                        data-bs-toggle="modal"><i
                        class="fas fa-shopping-bag" style="color: #ff7256;font-size: 24px;"></i></a></li>
            </ul>
        </div>
    </div>
</nav>
<!-- Fin Componente -->

<!-- Modal de inicio de sesión y registro de usuario -->
<jsp:include page="../comunes/modalLogInSignUp.jsp"/>

<!-- Scripts Requeridos -->

<!-- Fin Scripts Requeridos -->
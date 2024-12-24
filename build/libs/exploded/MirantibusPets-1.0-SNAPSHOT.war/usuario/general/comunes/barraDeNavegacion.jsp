<%--@elvariable id="usuario" type="dominio.modelos.Usuario"--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../comunes/validacionDeSesion.jsp" %>

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
                                        href="${pageContext.request.contextPath}/usuario/general/usuario/inicio.jsp"><i
                        class="fas fa-home"></i>&nbsp;Inicio</a>
                </li>
                <li class="nav-item"><a class="nav-link active"
                                        href="${pageContext.request.contextPath}/usuario/general/usuario/inicio.jsp#acerca-de-nosotros"><i
                        class="fas fa-star"></i>&nbsp;Acerca
                    de nosotros</a></li>
                <li class="nav-item"><a class="nav-link active"
                                        href="${pageContext.request.contextPath}/usuario/general/mascota/mascota.jsp"><i
                        class="fas fa-dog"></i>&nbsp;Mascota</a>
                </li>
                <li class="nav-item"><a class="nav-link active"
                                        href="${pageContext.request.contextPath}/usuario/general/veterinaria/veterinaria.jsp"><i
                        class="fas fa-briefcase-medical"></i>&nbsp;Veterinaria</a></li>
                <li class="nav-item"><a class="nav-link active"
                                        href="${pageContext.request.contextPath}/usuario/general/centroDeAyuda/ayuda.jsp"><i
                        class="fas fa-hands-helping"></i>&nbsp;Centro de Ayuda</a></li>
                <li class="nav-item dropdown"><a class="dropdown-toggle nav-link" aria-expanded="false"
                                                 data-bs-toggle="dropdown" href="#"><img
                        style="width: 24px;height: 24px;"
                        src="${pageContext.request.contextPath}/public/uploads/${usuario.uriFotoUsuario}">&nbsp;Hola ${usuario.nombre}
                </a>
                    <div class="dropdown-menu"><a class="dropdown-item"
                                                  href="${pageContext.request.contextPath}/usuario/general/usuario/perfil.jsp"><i
                            class="fas fa-user-tie"
                            style="width: 16px;height: 16px;"></i>&nbsp;Ir
                        a perfil</a><a class="dropdown-item"
                                       href="${pageContext.request.contextPath}/ServletControladorUsuario?action=logout"><i
                            class="fas fa-sign-out-alt"
                            style="width: 16px;height: 16px;"></i>&nbsp;Cerrar
                        sesión</a></div>
                </li>
                <li class="nav-item"><a class="nav-link"
                                        href="${pageContext.request.contextPath}/usuario/general/comunes/cesta.jsp"
                                        style="color: rgba(0, 0, 0, 0.55);"><i
                        class="fas fa-shopping-bag" style="color: #ff7256;font-size: 24px;"></i></a></li>
            </ul>
        </div>
    </div>
</nav>
<!-- Fin Componente -->

<!-- Scripts Requeridos -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Fin Scripts Requeridos -->
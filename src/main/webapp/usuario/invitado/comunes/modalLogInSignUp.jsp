<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!-- Imports Requeridos -->
<!--<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">-->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat+Alternates&amp;display=swap">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.0/css/all.css">
<!-- Fin Imports Requeridos -->

<div class="container-fluid" style="font-family: 'Montserrat Alternates', sans-serif;">
    <div class="modal fade" role="dialog" tabindex="-1" id="inicio-de-sesion">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4><i class="far fa-folder"></i>&nbsp;Iniciar Sesión</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="${pageContext.request.contextPath}/ServletControladorUsuario?action=login"
                          method="post" id="login">
                        <div class="form-group mb-3">
                            <div class="input-group"><span class="text-primary input-group-text"><i class="far fa-user"
                                                                                                    style="width: 16px;height: 16px;color: #8b91ff;"></i></span><input
                                    class="form-control" type="text" placeholder="Nombre de usuario" minlength="5"
                                    maxlength="15" required="" autofocus="" name="id-usuario"
                                    style="text-transform:lowercase;"></div>
                        </div>
                        <div class="form-group mb-3">
                            <div class="input-group"><span class="text-primary input-group-text"><i
                                    class="fas fa-user-lock"
                                    style="width: 16px;height: 16px;color: #8b91ff;"></i></span><input
                                    class="form-control" type="password" required="" placeholder="Contraseña"
                                    minlength="6" maxlength="25" name="password"></div>
                        </div>
                        <div class="form-group mb-3">
                            <button class="btn btn-primary btn-lg" style="width: 100%;background: #8b91ff;"
                                    type="submit">Iniciar sesión
                            </button>
                        </div>
                    </form>
                    <hr style="background-color: #bababa;">
                    <p class="text-center"><a class="text-decoration-none" href="#" style="color: #ff8076;">¿Olvidaste
                        tu contraseña?</a></p>
                    <p class="text-center">¿Aun no tienes cuenta con nosotros? &nbsp;<a class="text-decoration-none"
                                                                                        href="#" data-bs-dismiss="modal"
                                                                                        data-bs-toggle="modal"
                                                                                        data-bs-target="#registro-de-usuario"
                                                                                        style="color: #ff8076;">¡Regístrate
                        aquí!</a></p>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" role="dialog" tabindex="-1" id="registro-de-usuario">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="text-dark"><i class="far fa-folder-open"></i>&nbsp;Registro de usuario</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p class="text-center" style="color: #222222;">Rellena los campos con la información solicitada</p>
                    <form class="mt-4 was-validated"
                          action="${pageContext.request.contextPath}/ServletControladorUsuario?action=register"
                          method="post">
                        <div class="form-group mb-3">
                            <div class="input-group"><span class="text-primary input-group-text"><i class="far fa-user"
                                                                                                    style="width: 16px;height: 16px;color: #8b91ff;"></i></span><input
                                    class="form-control" type="text" data-bs-toggle="tooltip" data-bss-tooltip=""
                                    data-bs-placement="right" required="" placeholder="Nombre de usuario*" autofocus=""
                                    minlength="5" maxlength="15" name="id-usuario" title="Crea un nombre de usuario"
                                    style="text-transform:lowercase;">
                            </div>
                        </div>
                        <div class="form-group mb-3">
                            <div class="input-group"><span class="text-primary input-group-text"><i
                                    class="far fa-hand-point-up"
                                    style="width: 16px;height: 16px;color: #8b91ff;"></i></span><input
                                    class="form-control" type="text" data-bs-toggle="tooltip" data-bss-tooltip=""
                                    data-bs-placement="right" required="" placeholder="Nombre*" minlength="3"
                                    maxlength="20" name="nombre" title="Ingresa tu nombre"></div>
                        </div>
                        <div class="form-group mb-3">
                            <div class="input-group"><span class="text-primary input-group-text"><i
                                    class="fab fa-lastfm"
                                    style="width: 16px;height: 16px;color: #8b91ff;"></i></span><input
                                    class="form-control" type="text" data-bs-toggle="tooltip" data-bss-tooltip=""
                                    data-bs-placement="right" required="" placeholder="Apellido*" minlength="3"
                                    maxlength="30" name="apellido" title="Ingresa tu apellido"></div>
                        </div>
                        <div class="form-group mb-3">
                            <div class="input-group text-muted"><span class="text-primary input-group-text"><i
                                    class="far fa-calendar-alt"
                                    style="width: 16px;height: 16px;color: #8b91ff;"></i></span><input
                                    class="form-control" data-bs-toggle="tooltip" data-bss-tooltip=""
                                    data-bs-placement="right" type="date" name="fecha-de-nacimiento"
                                    title="Ingresa tu fecha de nacimiento*" required=""
                                    style="color: rgb(108,117,125);"></div>
                        </div>
                        <div class="form-group mb-3">
                            <div class="input-group"><span class="text-primary input-group-text"><i
                                    class="far fa-envelope" style="width: 16px;height: 16px;color: #8b91ff;"></i></span><input
                                    class="form-control" type="email" data-bs-toggle="tooltip" data-bss-tooltip=""
                                    data-bs-placement="right" required="" placeholder="Correo electrónico"
                                    minlength="10" maxlength="80" title="Ingresa un correo electrónico" name="email">
                            </div>
                        </div>
                        <div class="form-group mb-3">
                            <div class="input-group"><span class="text-primary input-group-text"><i
                                    class="fas fa-user-lock"
                                    style="width: 16px;height: 16px;color: #8b91ff;"></i></span><input
                                    class="form-control" type="password" data-bs-toggle="tooltip" data-bss-tooltip=""
                                    data-bs-placement="right" required="" placeholder="Contraseña"
                                    title="Crea una contraseña" minlength="6" maxlength="25" name="password"></div>
                        </div>
                        <div class="form-group mb-3">
                            <button class="btn btn-lg link-light" style="width: 100%;background: #8b91ff;"
                                    type="submit">Regístrate
                            </button>
                        </div>
                    </form>
                    <hr style="background-color: #bababa;">
                    <p class="text-center">¿Ya tienes cuenta con nosotros?&nbsp;<a class="text-decoration-none" href="#"
                                                                                   data-bs-target="#inicio-de-sesion"
                                                                                   data-bs-toggle="modal"
                                                                                   style="color: #ff8076;">Inicia
                        Sesión</a></p>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Scripts Requeridos -->
<script src="${pageContext.request.contextPath}/resources/assetsUsuario/js/bs-init.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Fin Scripts Requeridos -->
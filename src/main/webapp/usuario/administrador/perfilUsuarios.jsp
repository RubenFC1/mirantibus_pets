<%@ page import="datos.UsuarioDAO" %>
<%@ page import="dominio.constructores.UsuarioBuilder" %>
<%@ page import="dominio.modelos.Usuario" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>



<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>PaginaPerfil</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.0/css/all.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat&amp;display=swap">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/assetsUsuario/css/Account-setting-or-edit-profile.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assetsUsuario/css/Footer-Basic.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/assetsUsuario/css/Customizable-Background--Overlay.css">
</head>

<body style="font-family: Montserrat, sans-s
erif;">

<!-- Barra de navegación -->
<jsp:include page="./comunes/barraDeNavegacion.jsp"/>

<!-- Cuerpo de la página -->
<main>

    <!-- Titulo de la página -->
    <div style="background: url(${pageContext.request.contextPath}/resources/assetsUsuario/img/cat-hide-and-seek-in-white-background-with-copyspace.png) center / cover no-repeat;height: 400px;">
        <div class="d-flex align-items-center"
             style="height: inherit;min-height: initial;width: 100%;position: absolute;left: 0;background: rgba(255,255,255,0);">
            <div class="d-flex flex-grow-1 align-items-end order-5" style="height:200px;">
                <div class="container">
                    <h1 class="text-end d-xl-flex justify-content-xl-end col-md-11"
                        style="color: #222222;font-size: 75px;font-family: Montserrat, sans-serif;border-color: rgb(34,34,34);font-weight: bold;">
                        Su Cuenta</h1>
                </div>
            </div>
        </div>
    </div>

    <br/>
    <br/>
    <%
        String idUsuario = request.getParameter("usuario");
        Usuario usuario = new UsuarioDAO().encontrarUsuario(new UsuarioBuilder().setIdUsuario(idUsuario).createUsuario());
        String foto = usuario.getUriFotoUsuario();
    %>
    <!-- Formulario para modificar perfil -->
    <div class="container">
        <div class="row gutters">
            <div class="rounded col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
                <div class="card h-100">
                    <div class="card-body">
                        <div class="account-settings">
                            <div class="user-profile">
                                <div class="user-avatar">
                                    <label for="foto-perfil"><img
                                            src="${pageContext.request.contextPath}/public/uploads/<%=foto%>"
                                            alt="Foto de perfil"></label>
                                    <input type="file" id="foto-perfil" name="foto-perfil"
                                           accept="image/png, image/jpeg, image/jpg, image/ico" form="modificar-perfil"
                                           style="display: none;">
                                </div>
                                <h5 class="user-name"><%=usuario.getNombre()%> <%=usuario.getApellido()%></h5>
                                <h6 class="user-email">@<%=usuario.getIdUsuario()%></h6>
                            </div>
                            <div class="about">
                                <h5>Acerca de mi</h5>
                                <p><%=usuario.getDescripcion()%></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
                <div class="card h-100">
                    <form id="modificar-perfil" class="card-body"
                          action="${pageContext.request.contextPath}/ServletControladorUsuario?action=adminUpdate"
                          method="post" enctype="multipart/form-data">
                        <div class="row gutters">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <h6 class="mb-2 text-primary">Detalles Personales</h6>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="nombre">Nombre(s)</label>
                                    <input type="text" class="form-control" id="nombre" name="nombre"
                                           value="<%=usuario.getNombre()%>"
                                           placeholder="Introduce tu nombre completo" minlength="3" maxlength="20"
                                           required>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="email">Correo Electrónico</label>
                                    <input type="email" class="form-control" id="email" name="correo"
                                           value="<%=usuario.getCorreo()%>"
                                           placeholder="Introduce tu correo electrónico" minlength="10" maxlength="80"
                                           required>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="apellido">Apellido(s)</label>
                                    <input type="text" class="form-control" id="apellido" name="apellido"
                                           value="<%=usuario.getApellido()%>" placeholder="Introduce tus apellidos"
                                           minlength="3"
                                           maxlength="30" required>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="password">Contraseña</label>
                                    <input type="password" class="form-control password" id="password" name="password"
                                           value="<%=usuario.getPassword()%>" placeholder="Introduce una contraseña"
                                           minlength="6"
                                           maxlength="25" required>
                                </div>
                            </div>
                        </div>
                        <div class="row gutters">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <h6 class="mt-3 mb-2 text-primary">Otros datos</h6>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="genero">Género</label>
                                    <input type="text" class="form-control" id="genero" name="genero"
                                           value="<%=usuario.getGenero()%>"
                                           placeholder="Introduce tu género (Opcional)" maxlength="10">
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="direccion">Dirección</label>
                                    <input type="text" class="form-control" id="direccion" name="direccion"
                                           value="<%=usuario.getDireccion()%>" placeholder="Introduce tu direccion (Opcional)">
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="telefono">Telefono</label>
                                    <input type="text" class="form-control" id="telefono" name="telefono"
                                           value="<%=usuario.getTelefono()%>" placeholder="Introduce tu telefono (Opcional)">
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="descripcion">Descripción</label>
                                    <input type="text" class="form-control" id="descripcion" name="descripcion"
                                           value="<%=usuario.getDescripcion()%>"
                                           placeholder="Introduce una descripcion (Opcional)">
                                </div>
                            </div>
                        </div>
                        <br>
                        <div class="row gutters">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="text-right">
                                    <button type="submit" class="btn btn-primary">Actualizar Datos</button>
                                    &nbsp;
                                    <button type="button" class="btn btn-danger" onclick="confirmMessage()">Borrar
                                        Usuario
                                    </button>
                                    <br/>
                                    <br/>
                                    <a href="administrarUsuarios.jsp">
                                        <button type="button" class="btn btn-secondary">Regresar al inicio</button>
                                    </a>

                                </div>
                            </div>
                        </div>
                        <input type="hidden" name="id-usuario" value="<%=usuario.getIdUsuario()%>">
                    </form>
                </div>
            </div>
        </div>
    </div>

</main>
<script>
    function confirmMessage() {
        swal({
            title: "¿Estas seguro de que deseas borrar su cuenta?",
            text: "Una vez borrada, no podrá recuperar a sus mascotas ni su historial de compras",
            icon: "warning",
            buttons: ["Cancelar", "Borrar"],
            dangerMode: true
        })
            .then((willDelete) => {
                if (willDelete) {
                    document.location.href = "${pageContext.request.contextPath}/ServletControladorUsuario?action=adminDelete&id-usuario=<%=usuario.getIdUsuario()%>"
                } else {
                    swal("¡Su cuenta esta segura!");
                }
            });
    }
</script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- Pie de página -->
<jsp:include page="./comunes/pieDePagina.jsp"/>
</body>

</html>
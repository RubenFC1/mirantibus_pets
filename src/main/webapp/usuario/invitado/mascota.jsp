<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Mirantibus Pets - Mascota</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat&amp;display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/assetsMascota/css/Card-with-popup-text-effect.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}resources/assetsMascota/css/cards.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/assetsMascota/css/Customizable-Background--Overlay.css">
</head>

<body>

<!-- Barra de navegación -->
<jsp:include page="comunes/barraDeNavegacion.jsp"/>

<!-- Bloque de paginas -->
<section>
    <div style="height: 500px;background: url(${pageContext.request.contextPath}/resources/assetsMascota/img/mascotas3.jpg) center / cover no-repeat;font-family: Montserrat, sans-serif;">
        <div class="d-flex justify-content-center align-items-center"
             style="height: inherit;min-height: initial;width: 100%;position: absolute;left: 0;background: rgba(34,34,34,0.5);">
            <div class="d-flex align-items-center order-5" style="height:200px;">
                <div class="container">
                    <h1 class="text-center"
                        style="color: rgb(242,245,248);font-size: 55px;font-weight: bold;font-family: Montserrat, sans-serif;">
                        Mascota</h1>
                    <h3 class="text-center"
                        style="color: rgb(242,245,248);padding-top: 0.25em;padding-bottom: 0.25em;font-weight: normal;font-size: 22px;">
                        Tenemos varias opciones para ti y tu mascota, escoge la de tu preferencia.&nbsp;</h3>
                </div>
            </div>
        </div>
    </div>
</section>

<br/>
<br/>

<section>
    <%--@declare id="login"--%><input type="hidden" name="page" value="mascota" form="login">
    <div>
        <div class="container">
            <div class="cust_bloglistintro">
                <p style="margin-left:34px;color:rgba(255,255,255,0.5);font-size:14px;"></p>
            </div>
            <div class="row">
                <div class="col-md-4 cust_blogteaser"
                     style="padding-bottom: 20px;margin-bottom: 32px;font-family: Montserrat, sans-serif;"><a
                        href="#" data-bs-target="#inicio-de-sesion"
                        data-bs-toggle="modal"><img class="img-fluid"
                                                    style="height: auto;border-radius: 5px;border-width: 6px;border-color: var(--bs-gray-200);"
                                                    src="${pageContext.request.contextPath}/resources/assetsMascota/img/Perrito-rosa.jpg"
                                                    alt="Perrito bonito"></a>
                    <h3 style="text-align: left;margin-top: 20px;font-family: Montserrat, sans-serif;font-size: 18px;margin-right: 0;margin-left: 24px;line-height: 34px;letter-spacing: 0;font-style: normal;font-weight: bold;">
                        Regístrate o inicia sesión<br></h3>
                    <p class="text-secondary"
                       style="text-align: left;font-size: 14px;font-family: Montserrat, sans-serif;line-height: 22px;color: rgb(9,9,10);margin-left: 24px;">
                        Inicia sesión en tu cuenta para acceder a los servicios brindados.<br><br></p><a class="h4" href="#"
                                                                                                     data-bs-target="#inicio-de-sesion"
                                                                                                     data-bs-toggle="modal"><i
                            class="fa fa-arrow-circle-right" style="margin-left:23px;"></i></a>
                </div>
                <div class="col-md-4 cust_blogteaser" style="padding-bottom:20px;margin-bottom:32px;"><a href="#"
                                                                                                         data-bs-target="#inicio-de-sesion"
                                                                                                         data-bs-toggle="modal"><img
                        class="img-fluid" style="height: auto;border-width: 6px;border-radius: 5px;"
                        src="${pageContext.request.contextPath}/resources/assetsMascota/img/Yatzy%20yaya.jpg"
                        alt="Perrito rosa"></a>
                    <h3 style="text-align: left;margin-top: 20px;font-family: Montserrat, sans-serif;font-size: 18px;margin-right: 0;margin-left: 24px;line-height: 34px;letter-spacing: 0;font-style: normal;font-weight: bold;">
                        Publicar Mascota Perdida</h3>
                    <p class="text-secondary"
                       style="text-align: left;font-size: 14px;font-family: Montserrat, sans-serif;line-height: 22px;color: rgb(9,9,10);margin-left: 24px;">
                        Al perder una mascota puedes publicarla para ayudarte a encontrarla, también puedes publicar una mascota en situación de calle y ayudarla a encontrar un
                        nuevo hogar.</p>
                    <a class="h4" href="#" data-bs-target="#inicio-de-sesion"
                       data-bs-toggle="modal"><i class="fa fa-arrow-circle-right" style="margin-left:23px;"></i></a>
                </div>
                <div class="col-md-4 cust_blogteaser" style="padding-bottom:20px;margin-bottom:32px;"><a href="#"
                                                                                                         data-bs-target="#inicio-de-sesion"
                                                                                                         data-bs-toggle="modal"><img
                        class="img-fluid"
                        style="height: auto;border-radius: 5px;border-width: 6px;border-color: var(--bs-gray-200);"
                        src="${pageContext.request.contextPath}/resources/assetsMascota/img/Perrito-azul.jpg"
                        alt="Perrito azul"></a>
                    <h3 style="text-align: left;margin-top: 20px;font-family: Montserrat, sans-serif;font-size: 18px;margin-right: 0;margin-left: 24px;line-height: 34px;letter-spacing: 0;font-style: normal;font-weight: bold;">
                        Foro Mascotas Perdidas<br></h3>
                    <p class="text-secondary"
                       style="text-align: left;font-size: 14px;font-family: Montserrat, sans-serif;line-height: 22px;color: rgb(9,9,10);margin-left: 24px;">
                        ¿Perdiste a tu mascota? No te preocupes, encuentra a tus mascotas en el foro brindado.<br><br>
                    </p><a class="h4" href="#" data-bs-target="#inicio-de-sesion"
                           data-bs-toggle="modal"><i class="fa fa-arrow-circle-right" style="margin-left:23px;"></i></a>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Pie de página -->
<jsp:include page="comunes/pieDePagina.jsp"/>

</body>

</html>
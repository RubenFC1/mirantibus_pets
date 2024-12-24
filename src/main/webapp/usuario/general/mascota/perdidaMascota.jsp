<%@ page import="dominio.modelos.Mascota" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="datos.MascotaDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../comunes/validacionDeSesion.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>mascotas-perdidas2</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat&amp;display=swap">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/styles.css">
</head>

<body>

<!-- Barra de navegación -->
<jsp:include page="../comunes/barraDeNavegacion.jsp"/>

<header>
    <h1>MASCOTAS PERDIDAS</h1>
</header>
<section class="article-list">
    <%
        List<Mascota> perdidas;
        perdidas = new MascotaDAO().listarPerdidas();

    %>

    <div class="container" id="contenedor">
        <div class="row articles">
            <%
            for (Mascota perdida : perdidas){
            %>

                <div class="col-sm-6 col-md-4 item"><img class="imgLost" id="img1" src="${pageContext.request.contextPath}/public/uploadsPets/<%=perdida.getUriFotoMascota()%>" width="350">
                <ul class="list-group ulLost">
                    <li class="list-group-item filas"><span>Nombre:</span><input type="text" class="nombres" value="<%=perdida.getNombre()%>"></li>
                    <li class="list-group-item filas"><span>Edad:</span><input type="text" class="edades" value="<%=perdida.getEdad()%>"></li>
                    <li class="list-group-item filas"><span>Raza:</span><input type="text" class="razas" value="<%=perdida.getRaza()%>"></li>
                    <li class="list-group-item filas"><span>Especie:</span><input type="text" class="especies" value="<%=perdida.getEspecie()%>"></li>
                    <li class="list-group-item filas"><span>Género:</span><input type="text" class="generos" <%if (perdida.getGenero().equals("m")){%>value="Macho" <%}else{%>value="Hembra"<%}%>></li>
                    <li class="list-group-item filas"><span>Última vez visto:</span><input class="vistos" type="date" readonly="" value="<%=perdida.getUltimaVezVisto()%>"></li>
                    <li class="list-group-item filas"><span>Contacto:</span><input type="text" class="contactos" value="<%=perdida.getContacto()%>"></li>
                    <li class="list-group-item filas"><span>Descripción:</span><textarea><%=perdida.getDescripcion()%></textarea></li>
                </ul>
            </div>
            <%
            }
            %>
        </div>
    </div>
</section>
<script src="${pageContext.request.contextPath}/resources/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/6.4.8/swiper-bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/Simple-Slider.js"></script>

<!-- Pie de página -->
<jsp:include page="../comunes/pieDePagina.jsp"/>

</body>

</html>

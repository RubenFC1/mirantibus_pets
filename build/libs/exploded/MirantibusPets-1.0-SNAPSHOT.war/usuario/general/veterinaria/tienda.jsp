<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../comunes/validacionDeSesion.jsp" %>
<html lang="es">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Mirantibus Pets - Tienda</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:400,400i,700,700i,600,600i">
    <link href="https://cdn.reflowhq.com/v1/toolkit.min.css" rel="stylesheet"/>
</head>

<body style="font-family: Montserrat, sans-serif;">

<!-- Barra de navegación -->
<jsp:include page="../comunes/barraDeNavegacion.jsp"/>
<div class="container pt-5">

    <h2 class="mb-4">Productos</h2>
    <div data-reflow-type="product-list" data-reflow-perpage="8" data-reflow-order="price_desc"
         data-reflow-layout="cards" data-reflow-product-link="./product.jsp?product={id}"></div>

</div>

<!-- Pie de página -->
<jsp:include page="../comunes/pieDePagina.jsp"/>

<script src="https://cdn.reflowhq.com/v1/toolkit.min.js" data-reflow-store="1061353704" defer></script>
</body>
</html>
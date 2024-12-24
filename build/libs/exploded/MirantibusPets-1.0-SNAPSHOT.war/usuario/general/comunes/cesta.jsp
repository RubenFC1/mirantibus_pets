<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../comunes/validacionDeSesion.jsp" %>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Mirantibus Pets - Cesta</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <link href="https://cdn.reflowhq.com/v1/toolkit.min.css" rel="stylesheet"/>
</head>

<body>

<!-- Barra de navegación -->
<jsp:include page="../comunes/barraDeNavegacion.jsp"/>

<div class="container pt-5">
    <div data-reflow-type="shopping-cart"></div>
</div>

<!-- Pie de página -->
<jsp:include page="../comunes/pieDePagina.jsp"/>

<script src="https://cdn.reflowhq.com/v1/toolkit.min.js" data-reflow-store="1061353704" defer></script>
</body>
</html>

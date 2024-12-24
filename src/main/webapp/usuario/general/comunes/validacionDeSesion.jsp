<%@ page import="dominio.modelos.Usuario" %>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if (usuario != null) {
        if (!usuario.getTipo().equals("general")) {
            switch (usuario.getTipo()) {
                case "administrador":
                    response.sendRedirect("administradorRoute");
                    break;
                case "veterinario":
                    response.sendRedirect("veterinarioRoute");
                    break;
                default:
                    response.sendRedirect("/MirantibusPets/index.jsp");
                    break;
            }
        }
    } else {
        response.sendRedirect("/MirantibusPets/index.jsp");
    }
%>

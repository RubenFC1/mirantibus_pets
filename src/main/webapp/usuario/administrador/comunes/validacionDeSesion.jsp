<%@ page import="dominio.modelos.Usuario" %>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if (usuario != null) {
        if (!usuario.getTipo().equals("administrador")) {
            switch (usuario.getTipo()) {
                case "general":
                    response.sendRedirect("generalRoute");
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

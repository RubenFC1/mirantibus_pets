package web;

import datos.UsuarioDAO;
import dominio.constructores.UsuarioBuilder;
import dominio.modelos.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.time.LocalDate;

//@MultipartConfig
//@WebServlet(name = "ServletControladorUsuario", value = "/ServletControladorUsuario")
//public class ServletControladorUsuario extends HttpServlet {

@MultipartConfig
@WebServlet(name = "Ejemplin", value = "/Ejemplin")
public class Ejemplin extends HttpServlet {
    private void accionDefault(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idUsuario = request.getParameter("id-usuario");
        String password = request.getParameter("password");
        Usuario usuario = new UsuarioDAO().encontrar(new UsuarioBuilder().setIdUsuario(idUsuario).setNombre(password).createUsuario());
        if (usuario.getNombre() != null && usuario.getApellido() != null && usuario.getCorreo() != null) {
            HttpSession session = request.getSession();
            Usuario usr = (Usuario) session.getAttribute("usuario");
            if (usr != null) {
                session.removeAttribute("usuario");
            }
            session.setAttribute("usuario", usuario);
            String ruta = "usuario/general/usuario/perfilUsuarios.jsp";
            response.sendRedirect(ruta);
        } else {
            response.sendRedirect("index.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        String href = request.getParameter("href");
        if (accion != null) {
            switch (accion) {
                case "logout" -> cerrarSesion(request, response);
            }
        } else if (href != null) {
            String path = "/WEB-INF/paginas/usuario/";
            switch (href) {
                case "inicio.jsp", "inicio.jsp#acerca-de-nosotros", "mascota.jsp", "perfilUsuarios.jsp" -> request.getRequestDispatcher(path + href).forward(request, response);
            }
        }

    }

    private void cerrarSesion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().removeAttribute("usuario");
        request.getSession().invalidate();
        String jsp = "/index.jsp";
        request.getRequestDispatcher(jsp).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion != null) {
            switch (accion) {
                case "signup" -> registrarUsuario(request, response);
                case "login" -> iniciarSesion(request, response);
                case "update" -> actualizarUsuario(request, response);
            }
        }
    }

    private void registrarUsuario(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id-usuario");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        LocalDate fechaNacimiento = LocalDate.parse(request.getParameter("fecha-de-nacimiento"));
        String correo = request.getParameter("email");
        String password = request.getParameter("password");
        Usuario usuario = new UsuarioBuilder().setIdUsuario(id).setNombre(nombre).setApellido(apellido).setFechaNacimiento(fechaNacimiento).setCorreo(correo).setPassword(password).createUsuario();
        int registrosModificados = new UsuarioDAO().insertar(usuario);
        System.out.println("registrosModificados = " + registrosModificados);
        response.sendRedirect("inicio.jsp");
    }

    private void iniciarSesion(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        accionDefault(request, response);
    }


    private void actualizarUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idUsuario = request.getParameter("id-usuario");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String correo = request.getParameter("correo");
        String password = request.getParameter("password");
        String genero = request.getParameter("genero");
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");
        String uriFotoUsuario = fotoPerfil(request);
        String descripcion = request.getParameter("descripcion");

        //Creamos el objeto de usuario (modelo)
        //Usuario usuario = new UsuarioBuilder().setIdUsuario(idUsuario).setNombre(nombre).setApellido(apellido).setFechaNacimiento(correo).setCorreo(password).setPassword(genero).setTipo(direccion).setGenero(telefono).setDireccion(uriFotoUsuario).setTelefono(descripcion).createUsuario();

        // Modificamos el objeto en la base de datos
        //int registrosModificados = new UsuarioDAO().actualizar(usuario);
        //System.out.println("registrosModificados = " + registrosModificados);

        accionDefault(request, response);
    }

    private String fotoPerfil(HttpServletRequest request) throws ServletException, IOException {
        Part part = request.getPart("foto-perfil");
        String id = request.getParameter("id-usuario");
        return new Images().saveCustomer(part, id);
    }
}

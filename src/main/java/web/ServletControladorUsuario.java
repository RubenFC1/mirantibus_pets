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
import java.util.Locale;

@MultipartConfig
@WebServlet(name = "ServletControladorUsuario", value = "/ServletControladorUsuario")
public class ServletControladorUsuario extends HttpServlet {

    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String action = request.getParameter("action");
        switch (action) {
            case "register" -> registerUser(request, response);
            case "adminRegister" -> adminRegisterUser(request, response);
            case "login" -> logIn(request, response);
            case "logout" -> logOut(request, response);
            case "update" -> updateUser(request, response);
            case "adminUpdate" -> adminUpdateUser(request, response);
            case "delete" -> deleteUser(request, response);
            case "adminDelete" -> adminDeleteUser(request, response);
            default -> response.sendRedirect("index.jsp");
        }
    }

    private void registerUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String idUsuario = request.getParameter("id-usuario").toLowerCase(Locale.ROOT);
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        LocalDate fechaNacimiento = LocalDate.parse(request.getParameter("fecha-de-nacimiento"));
        String correo = request.getParameter("email");
        String password = request.getParameter("password");
        Usuario usuario = new UsuarioBuilder()
                .setIdUsuario(idUsuario)
                .setNombre(nombre)
                .setApellido(apellido)
                .setFechaNacimiento(fechaNacimiento)
                .setCorreo(correo)
                .setPassword(password)
                .createUsuario();
        int registrosModificados = new UsuarioDAO().insertar(usuario);
        if (registrosModificados > 0) {
            response.sendRedirect("index.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }

    private void adminRegisterUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String idUsuario = request.getParameter("id-usuario").toLowerCase(Locale.ROOT);
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        LocalDate fechaNacimiento = LocalDate.parse(request.getParameter("fecha-de-nacimiento"));
        String correo = request.getParameter("email");
        String password = request.getParameter("password");
        Usuario usuario = new UsuarioBuilder()
                .setIdUsuario(idUsuario)
                .setNombre(nombre)
                .setApellido(apellido)
                .setFechaNacimiento(fechaNacimiento)
                .setCorreo(correo)
                .setPassword(password)
                .createUsuario();
        int registrosModificados = new UsuarioDAO().insertar(usuario);
        if (registrosModificados > 0) {
            response.sendRedirect("usuario/administrador/administrarUsuarios.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }

    private void logIn(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String idUsuario = request.getParameter("id-usuario");
        String password = request.getParameter("password");
        Usuario usuario = new UsuarioBuilder().setIdUsuario(idUsuario).setPassword(password).createUsuario();
        usuario = new UsuarioDAO().encontrar(usuario);
        if (usuario.getNombre() != null && usuario.getApellido() != null && usuario.getCorreo() != null && usuario.getTipo().equals("general")) {
            HttpSession session = request.getSession();
            session.setAttribute("usuario", usuario);
            String page = request.getParameter("page");
            if (page != null) {
                switch (page) {
                    case "mascota" -> response.sendRedirect("usuario/general/mascota/mascota.jsp");
                    default -> response.sendRedirect("usuario/general/usuario/perfilUsuarios.jsp");
                }
            } else {
                response.sendRedirect("usuario/general/usuario/perfil.jsp");
            }
        } else {
            if (usuario.getNombre() != null && usuario.getApellido() != null && usuario.getCorreo() != null && usuario.getTipo().equals("administrador")) {
                HttpSession session = request.getSession();
                session.setAttribute("usuario", usuario);
                String page = request.getParameter("page");
                if (page != null) {
                    switch (page) {
                        case "mascota" -> response.sendRedirect("usuario/general/mascota/mascota.jsp");
                        default -> response.sendRedirect("usuario/general/usuario/perfilUsuarios.jsp");
                    }
                } else {
                    response.sendRedirect("usuario/administrador/administrarUsuarios.jsp");
                }
            }
            else {
                response.sendRedirect("index.jsp");
            }
        }
    }

    private void logOut(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.getSession().invalidate();
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("usuario") == null) {
            response.sendRedirect("index.jsp");
        } else {
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);
            logOut(request, response);
        }
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idUsuario = request.getParameter("id-usuario");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        LocalDate fechaNacimiento = null;
        if (request.getParameter("fecha-de-nacimiento") != null) {
            fechaNacimiento = LocalDate.parse(request.getParameter("fecha-de-nacimiento"));
        }
        String correo = request.getParameter("correo");
        String password = request.getParameter("password");
        String tipo = request.getParameter("tipo");
        String genero = request.getParameter("genero");
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");
        String uriFotoUsuario = fotoPerfil(request);
        String descripcion = request.getParameter("descripcion");

        Usuario usuario = new UsuarioBuilder()
                .setIdUsuario(idUsuario)
                .setNombre(nombre)
                .setApellido(apellido)
                .setFechaNacimiento(fechaNacimiento)
                .setCorreo(correo)
                .setPassword(password)
                .setTipo(tipo)
                .setGenero(genero)
                .setDireccion(direccion)
                .setTelefono(telefono)
                .setUriFotoUsuario(uriFotoUsuario)
                .setDescripcion(descripcion)
                .createUsuario();

        int registrosModificados = new UsuarioDAO().actualizar(usuario);
        if (registrosModificados > 0) {
            request.setAttribute("id-usuario", idUsuario);
            request.setAttribute("password", password);
            logIn(request, response);
        } else {
            response.sendRedirect("error.jsp");
        }
    }

    private void adminUpdateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idUsuario = request.getParameter("id-usuario");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        LocalDate fechaNacimiento = null;
        if (request.getParameter("fecha-de-nacimiento") != null) {
            fechaNacimiento = LocalDate.parse(request.getParameter("fecha-de-nacimiento"));
        }
        String correo = request.getParameter("correo");
        String password = request.getParameter("password");
        String tipo = request.getParameter("tipo");
        String genero = request.getParameter("genero");
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");
        String uriFotoUsuario = fotoPerfil(request);
        String descripcion = request.getParameter("descripcion");

        Usuario usuario = new UsuarioBuilder()
                .setIdUsuario(idUsuario)
                .setNombre(nombre)
                .setApellido(apellido)
                .setFechaNacimiento(fechaNacimiento)
                .setCorreo(correo)
                .setPassword(password)
                .setTipo(tipo)
                .setGenero(genero)
                .setDireccion(direccion)
                .setTelefono(telefono)
                .setUriFotoUsuario(uriFotoUsuario)
                .setDescripcion(descripcion)
                .createUsuario();

        int registrosModificados = new UsuarioDAO().actualizar(usuario);
        if (registrosModificados > 0) {
            response.sendRedirect("usuario/administrador/administrarUsuarios.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String idUsuario = request.getParameter("id-usuario");
        int registrosModificados = new UsuarioDAO().eliminar(new UsuarioBuilder().setIdUsuario(idUsuario).createUsuario());

        if (registrosModificados > 0) {
            System.out.println("Usuario borrado exitosamente");
        }
        logOut(request, response);
    }

    private void adminDeleteUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String idUsuario = request.getParameter("id-usuario");
        int registrosModificados = new UsuarioDAO().eliminar(new UsuarioBuilder().setIdUsuario(idUsuario).createUsuario());

        if (registrosModificados > 0) {
            System.out.println("Usuario borrado exitosamente");
            response.sendRedirect("usuario/administrador/administrarUsuarios.jsp");
        }
    }

    private String fotoPerfil(HttpServletRequest request) throws ServletException, IOException {
        Part part = request.getPart("foto-perfil");
        String id = request.getParameter("id-usuario");
        return new Images().saveCustomer(part, id);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        processRequest(request, response);
    }

}
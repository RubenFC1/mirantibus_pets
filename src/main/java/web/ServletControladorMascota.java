package web;

import datos.MascotaDAO;
import dominio.constructores.MascotaBuilder;
import dominio.modelos.Mascota;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;

@MultipartConfig
@WebServlet(name = "ServletControladorMascota", value = "/ServletControladorMascota")
public class ServletControladorMascota extends HttpServlet {

    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String action = request.getParameter("action");
        switch (action) {
            case "register" -> registerPet(request, response);
            case "registerLost" -> registerLostPet(request, response);
            case "update" -> updatePet(request, response);
        }
    }

    private void registerPet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String nombre = request.getParameter("nombre");
        int edad = Integer.parseInt(request.getParameter("edad"));
        String raza = request.getParameter("raza");
        String genero = request.getParameter("genero");
        String especie = request.getParameter("especie");
        String idUsuario = request.getParameter("id-usuario");
        String contacto = request.getParameter("contacto");
        String descripcion = request.getParameter("descripcion");
        Mascota mascota = new MascotaBuilder()
                .setNombre(nombre)
                .setEdad(edad)
                .setRaza(raza)
                .setGenero(genero)
                .setEspecie(especie)
                .setIdUsuario(idUsuario)
                .setContacto(contacto)
                .setDescripcion(descripcion)
                .createMascota();
        int registrosModificados = new MascotaDAO().insertar(mascota);
        if (registrosModificados > 0) {
            response.sendRedirect("usuario/general/mascota/mascota.jsp");
        } else {
            response.sendRedirect("usuario/general/mascota/registroMascota.jsp");
        }
    }

    private void registerLostPet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String nombre = request.getParameter("nombre");
        int edad = Integer.parseInt(request.getParameter("edad"));
        String raza = request.getParameter("raza");
        String genero = request.getParameter("genero");
        String especie = request.getParameter("especie");
        String idUsuario = request.getParameter("id-usuario");
        String descripcion = request.getParameter("descripcion");
        String contacto = request.getParameter("contacto");
        LocalDate ultimaVezVisto = LocalDate.parse(request.getParameter("ultima-vez-visto"));
        String uriFotoMascota = fotoMascota(request);
        boolean perdidaEstado = true;
        Mascota mascota = new MascotaBuilder()
                .setNombre(nombre)
                .setEdad(edad)
                .setRaza(raza)
                .setGenero(genero)
                .setEspecie(especie)
                .setIdUsuario(idUsuario)
                .setDescripcion(descripcion)
                .setContacto(contacto)
                .setUltimaVezVisto(ultimaVezVisto)
                .setPerdidaEstado(perdidaEstado)
                .setUriFotoMascota(uriFotoMascota)
                .createMascota();
        int registrosModificados = new MascotaDAO().insertar(mascota);
        int registrosModificadosPerdida = new MascotaDAO().insertarPerdida(mascota);
        if (registrosModificados > 0 && registrosModificadosPerdida > 0) {
            response.sendRedirect("usuario/general/mascota/mascota.jsp");
        } else {
            response.sendRedirect("usuario/general/mascota/registroMascota.jsp");
        }
    }

    private void updatePet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String nombre = request.getParameter("nombre");
        int edad = Integer.parseInt(request.getParameter("edad"));
        String raza = request.getParameter("raza");
        String genero = request.getParameter("genero");
        String especie = request.getParameter("especie");
        String uriFotoMascota = fotoMascota(request);
        String descripcion = request.getParameter("descripcion");
        int idMascota = Integer.parseInt(request.getParameter("id-mascota"));
        Mascota mascota = new MascotaBuilder()
                .setNombre(nombre)
                .setEdad(edad)
                .setRaza(raza)
                .setGenero(genero)
                .setEspecie(especie)
                .setUriFotoMascota(uriFotoMascota)
                .setDescripcion(descripcion)
                .setIdMascota(idMascota)
                .createMascota();
        int registrosModificados = new MascotaDAO().actualizar(mascota);
        if (registrosModificados > 0) {
            response.sendRedirect("usuario/general/mascota/mascota.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }

    private String fotoMascota(HttpServletRequest request) throws ServletException, IOException {
        Part part = request.getPart("foto-mascota");
        String id = request.getParameter("id-usuario");
        String idPet = request.getParameter("id-mascota");
        return new ImagesPets().savePet(part, id, idPet);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
}

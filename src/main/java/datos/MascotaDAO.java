package datos;

import dominio.constructores.MascotaBuilder;
import dominio.modelos.Mascota;

import java.sql.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class MascotaDAO {

    private static final String CALL_INSERT_PET = "CALL insertPet(?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String CALL_INSERT_LOST_PET = "CALL insertLostPet(?, ?)";
    public static final String CALL_FIND_PET_BY_ID = "CALL searchPetById(?)";
    private static final String CALL_LIST_ALL_DOGS = "CALL listAllDogsByUserId(?)";
    private static final String CALL_LIST_ALL_CATS = "CALL listAllCatsByUserId(?)";
    private static final String CALL_LIST_OTHERS = "CALL listOtherPetsByUserId(?)";
    private static final String CALL_LIST_LOST = "CALL listAllLostPets()";
    public static final String CALL_UPDATE_PET_BY_ID = "CALL updatePet(?, ?, ?, ?, ?, ?, ?, ?)";
    public static final String CALL_AGENDAR_CITA = "CALL agendarCita(?, ?)";
    public static final String CALL_LIST_ALL_CITAS = "CALL listAllCitasByUserId(?)";


    public int insertar(Mascota mascota) {
        Connection conn = null;
        CallableStatement cs = null;
        int rows = 0;
        try {
            conn = Conexion.getConnection();
            cs = conn.prepareCall(CALL_INSERT_PET);
            cs.setString(1, mascota.getNombre());
            cs.setInt(2, mascota.getEdad());
            cs.setString(3, mascota.getRaza());
            cs.setString(4, mascota.getGenero());
            cs.setString(5, mascota.getEspecie());
            cs.setString(6, mascota.getUriFotoMascota());
            cs.setString(7, mascota.getDescripcion());
            cs.setString(8, mascota.getIdUsuario());
            cs.setBoolean(9, mascota.isPerdidaEstado());
            rows = cs.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Conexion.close(cs);
            Conexion.close(conn);
        }
        System.out.println("Filas modificadas: " + rows);
        return rows;
    }

    public int insertarPerdida(Mascota mascota) {
        Connection conn = null;
        CallableStatement cs = null;
        int rows = 0;
        try {
            conn = Conexion.getConnection();
            cs = conn.prepareCall(CALL_INSERT_LOST_PET);
            cs.setString(1, mascota.getContacto());
            cs.setDate(2, Date.valueOf(mascota.getUltimaVezVisto()));
            rows = cs.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Conexion.close(cs);
            Conexion.close(conn);
        }
        System.out.println("Filas modificadas: " + rows);
        return rows;
    }

    public Mascota encontrar(Mascota mascota) {
        Connection conn = null;
        CallableStatement cs = null;
        ResultSet rs = null;
        try {
            conn = Conexion.getConnection();
            cs = conn.prepareCall(CALL_FIND_PET_BY_ID);
            cs.setInt(1, mascota.getIdMascota());
            cs.execute();
            rs = cs.getResultSet();
            rs.next();

            int idMascota = rs.getInt("id_mascota");
            String nombre = rs.getString("nombre");
            int edad = rs.getInt("edad");
            String raza = rs.getString("raza");
            String genero = rs.getString("genero");
            String especie = rs.getString("especie");
            String uriFotoMascota = rs.getString("uri_foto_mascota");
            String descripcion = rs.getString("descripcion");
            String idUsuario = rs.getString("id_usuario");
            boolean perdidaEstado = rs.getBoolean("perdida_estado");
            mascota = new MascotaBuilder()
                    .setIdMascota(idMascota)
                    .setNombre(nombre)
                    .setEdad(edad)
                    .setRaza(raza)
                    .setGenero(genero)
                    .setEspecie(especie)
                    .setUriFotoMascota(uriFotoMascota)
                    .setDescripcion(descripcion)
                    .setIdUsuario(idUsuario)
                    .setPerdidaEstado(perdidaEstado)
                    .createMascota();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Conexion.close(rs);
            Conexion.close(cs);
            Conexion.close(conn);
        }
        return mascota;
    }

    public int actualizar(Mascota mascota) {
        Connection conn = null;
        CallableStatement cs = null;
        int rows = 0;
        try {
            conn = Conexion.getConnection();
            cs = conn.prepareCall(CALL_UPDATE_PET_BY_ID);
            cs.setString(1, mascota.getNombre());
            cs.setInt(2, mascota.getEdad());
            cs.setString(3, mascota.getRaza());
            cs.setString(4, mascota.getGenero());
            cs.setString(5, mascota.getEspecie());
            cs.setString(6, mascota.getUriFotoMascota());
            cs.setString(7, mascota.getDescripcion());
            cs.setInt(8, mascota.getIdMascota());
            rows = cs.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Conexion.close(cs);
            Conexion.close(conn);
        }
        System.out.println("Filas modificadas: " + rows);
        return rows;
    }

    public List<Mascota> listarPerros(String idUsuario) {
        return getMascotas(idUsuario, CALL_LIST_ALL_DOGS);
    }

    public List<Mascota> listarGatos(String idUsuario) {
        return getMascotas(idUsuario, CALL_LIST_ALL_CATS);
    }

    public List<Mascota> listarOtros(String idUsuario) {
        return getMascotas(idUsuario, CALL_LIST_OTHERS);
    }

    public List<Mascota> listarPerdidas() {
        return getMascotasPerdidas(CALL_LIST_LOST);
    }

    public List<Mascota> listarCitas(String idUsuario){
        return getCitas(idUsuario, CALL_LIST_ALL_CITAS);
    }

    private List<Mascota> getMascotas(String idUsuario1, String callListPets) {
        Connection conn = null;
        CallableStatement cs = null;
        ResultSet rs = null;
        List<Mascota> pets = new ArrayList<>();
        try {
            conn = Conexion.getConnection();
            cs = conn.prepareCall(callListPets);
            cs.setString(1, idUsuario1);
            cs.execute();
            rs = cs.getResultSet();
            while (rs.next()) {
                int idMascota = rs.getInt("id_mascota");
                String nombre = rs.getString("nombre");
                int edad = rs.getInt("edad");
                String raza = rs.getString("raza");
                String genero = rs.getString("genero");
                String especie = rs.getString("especie");
                String uriFotoMascota = rs.getString("uri_foto_mascota");
                String descripcion = rs.getString("descripcion");
                String idUsuario = rs.getString("id_usuario");
                Mascota mascota = new MascotaBuilder()
                        .setIdMascota(idMascota)
                        .setNombre(nombre)
                        .setEdad(edad)
                        .setRaza(raza)
                        .setGenero(genero)
                        .setEspecie(especie)
                        .setUriFotoMascota(uriFotoMascota)
                        .setDescripcion(descripcion)
                        .setIdUsuario(idUsuario)
                        .createMascota();
                pets.add(mascota);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Conexion.close(rs);
            Conexion.close(cs);
            Conexion.close(conn);
        }
        return pets;
    }

    private List<Mascota> getMascotasPerdidas(String callListPets) {
        Connection conn = null;
        CallableStatement cs = null;
        ResultSet rs = null;
        List<Mascota> pets = new ArrayList<>();
        try {
            conn = Conexion.getConnection();
            cs = conn.prepareCall(callListPets);
            cs.execute();
            rs = cs.getResultSet();
            while (rs.next()) {
                int idMascota = rs.getInt("id_mascota");
                String nombre = rs.getString("nombre");
                int edad = rs.getInt("edad");
                String raza = rs.getString("raza");
                String genero = rs.getString("genero");
                String especie = rs.getString("especie");
                String uriFotoMascota = rs.getString("uri_foto_mascota");
                String descripcion = rs.getString("descripcion");
                String idUsuario = rs.getString("id_usuario");
                String contacto = rs.getString("contacto");
                LocalDate ultimaVezVisto = LocalDate.parse(rs.getString("ultima_vez_visto"));
                Mascota mascota = new MascotaBuilder()
                        .setIdMascota(idMascota)
                        .setNombre(nombre)
                        .setEdad(edad)
                        .setRaza(raza)
                        .setGenero(genero)
                        .setEspecie(especie)
                        .setUriFotoMascota(uriFotoMascota)
                        .setDescripcion(descripcion)
                        .setIdUsuario(idUsuario)
                        .setContacto(contacto)
                        .setUltimaVezVisto(ultimaVezVisto)
                        .createMascota();
                pets.add(mascota);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Conexion.close(rs);
            Conexion.close(cs);
            Conexion.close(conn);
        }
        return pets;
    }

    public int agendar(Mascota mascota) {
        Connection conn = null;
        CallableStatement cs = null;
        int rows = 0;
        try {
            conn = Conexion.getConnection();
            cs = conn.prepareCall(CALL_AGENDAR_CITA);
            cs.setInt(1, mascota.getIdMascota());
            cs.setString(2, mascota.getFechaCita());
            rows = cs.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Conexion.close(cs);
            Conexion.close(conn);
        }
        System.out.println("Filas modificadas: " + rows);
        return rows;
    }

    private List<Mascota> getCitas(String idUsuario1, String callListCitas) {
        Connection conn = null;
        CallableStatement cs = null;
        ResultSet rs = null;
        List<Mascota> citas = new ArrayList<>();
        try {
            conn = Conexion.getConnection();
            cs = conn.prepareCall(callListCitas);
            cs.setString(1, idUsuario1);
            cs.execute();
            rs = cs.getResultSet();
            while (rs.next()) {
                int idMascota = rs.getInt("id_mascota");
                String nombre = rs.getString("nombre");
                String idUsuario = rs.getString("id_usuario");
                String fechaCita = rs.getString("fecha_cita");
                Mascota cita = new MascotaBuilder()
                        .setIdMascota(idMascota)
                        .setNombre(nombre)
                        .setIdUsuario(idUsuario)
                        .setFechaCita(fechaCita)
                        .createMascota();
                citas.add(cita);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Conexion.close(rs);
            Conexion.close(cs);
            Conexion.close(conn);
        }
        return citas;
    }

}

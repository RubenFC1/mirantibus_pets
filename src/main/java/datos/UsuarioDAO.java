package datos;

import dominio.constructores.MascotaBuilder;
import dominio.constructores.UsuarioBuilder;
import dominio.modelos.Mascota;
import dominio.modelos.Usuario;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO {

    private static final String CALL_INSERT_USER = "CALL insertUsuario(?, ?, ?, ?, ?, ?)";
    public static final String CALL_SEARCH_USER_BY_ID_AND_PASSWORD = "CALL searchUsuarioByIdAndPassword(?, ?)";
    public static final String CALL_SEARCH_USER_BY_ID = "CALL searchUsuarioById(?)";
    public static final String CALL_UPDATE_USER = "CALL updateUsuario(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String CALL_DELETE_USER = "CALL deleteUserById(?)";
    private static final String CALL_LIST_ALL_USERS = "CALL listAllUsers()";

    public int insertar(Usuario usuario) {
        Connection conn = null;
        CallableStatement cs = null;
        int rows = 0;
        try {
            conn = Conexion.getConnection();
            cs = conn.prepareCall(CALL_INSERT_USER);
            cs.setString(1, usuario.getIdUsuario());
            cs.setString(2, usuario.getNombre());
            cs.setString(3, usuario.getApellido());
            cs.setDate(4, Date.valueOf(usuario.getFechaNacimiento()));
            cs.setString(5, usuario.getCorreo());
            cs.setString(6, usuario.getPassword());
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

    public Usuario encontrar(Usuario usuario) {
        Connection conn = null;
        CallableStatement cs = null;
        ResultSet rs = null;
        try {
            conn = Conexion.getConnection();
            cs = conn.prepareCall(CALL_SEARCH_USER_BY_ID_AND_PASSWORD);
            cs.setString(1, usuario.getIdUsuario());
            cs.setString(2, usuario.getPassword());
            cs.execute();
            rs = cs.getResultSet();
            rs.next(); //Nos posicionamos en el primer registro devuelto

            String nombreUsuario = rs.getString("id_usuario");
            String nombre = rs.getString("nombre");
            String apellido = rs.getString("apellido");
            LocalDate fechaDeNacimiento = rs.getDate("fecha_nacimiento").toLocalDate();
            String correo = rs.getString("correo");
            String password = rs.getString("password");
            String tipo = rs.getString("tipo");
            String genero = rs.getString("genero");
            String direccion = rs.getString("direccion");
            String telefono = rs.getString("telefono");
            String uriFotoUsuario = rs.getString("uri_foto_usuario");
            String descripcion = rs.getString("descripcion");

            usuario = new UsuarioBuilder()
                    .setIdUsuario(nombreUsuario)
                    .setNombre(nombre)
                    .setApellido(apellido)
                    .setFechaNacimiento(fechaDeNacimiento)
                    .setCorreo(correo)
                    .setPassword(password)
                    .setTipo(tipo)
                    .setGenero(genero)
                    .setDireccion(direccion)
                    .setTelefono(telefono)
                    .setUriFotoUsuario(uriFotoUsuario)
                    .setDescripcion(descripcion)
                    .createUsuario();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Conexion.close(rs);
            Conexion.close(cs);
            Conexion.close(conn);
        }
        System.out.println("usuario encontrado: " + usuario);
        return usuario;
    }

    public Usuario encontrarUsuario(Usuario usuario) {
        Connection conn = null;
        CallableStatement cs = null;
        ResultSet rs = null;
        try {
            conn = Conexion.getConnection();
            cs = conn.prepareCall(CALL_SEARCH_USER_BY_ID);
            cs.setString(1, usuario.getIdUsuario());
            cs.execute();
            rs = cs.getResultSet();
            rs.next(); //Nos posicionamos en el primer registro devuelto

            String nombreUsuario = rs.getString("id_usuario");
            String nombre = rs.getString("nombre");
            String apellido = rs.getString("apellido");
            LocalDate fechaDeNacimiento = rs.getDate("fecha_nacimiento").toLocalDate();
            String correo = rs.getString("correo");
            String password = rs.getString("password");
            String tipo = rs.getString("tipo");
            String genero = rs.getString("genero");
            String direccion = rs.getString("direccion");
            String telefono = rs.getString("telefono");
            String uriFotoUsuario = rs.getString("uri_foto_usuario");
            String descripcion = rs.getString("descripcion");

            usuario = new UsuarioBuilder()
                    .setIdUsuario(nombreUsuario)
                    .setNombre(nombre)
                    .setApellido(apellido)
                    .setFechaNacimiento(fechaDeNacimiento)
                    .setCorreo(correo)
                    .setPassword(password)
                    .setTipo(tipo)
                    .setGenero(genero)
                    .setDireccion(direccion)
                    .setTelefono(telefono)
                    .setUriFotoUsuario(uriFotoUsuario)
                    .setDescripcion(descripcion)
                    .createUsuario();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Conexion.close(rs);
            Conexion.close(cs);
            Conexion.close(conn);
        }
        System.out.println("usuario encontrado: " + usuario);
        return usuario;
    }

    public int actualizar(Usuario usuario) {
        Connection conn = null;
        CallableStatement cs = null;
        int rows = 0;
        try {
            conn = Conexion.getConnection();
            cs = conn.prepareCall(CALL_UPDATE_USER);
            cs.setString(1, usuario.getNombre());
            cs.setString(2, usuario.getApellido());
            cs.setString(3, usuario.getCorreo());
            cs.setString(4, usuario.getPassword());
            cs.setString(5, usuario.getGenero());
            cs.setString(6, usuario.getDireccion());
            cs.setString(7, usuario.getTelefono());
            cs.setString(8, usuario.getUriFotoUsuario());
            cs.setString(9, usuario.getDescripcion());
            cs.setString(10, usuario.getIdUsuario());

            rows = cs.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Conexion.close(cs);
            Conexion.close(conn);
        }
        return rows;
    }

    public int eliminar(Usuario usuario) {
        Connection conn = null;
        CallableStatement cs = null;
        int rows = 0;
        try {
            conn = Conexion.getConnection();
            cs = conn.prepareCall(CALL_DELETE_USER);
            cs.setString(1, usuario.getIdUsuario());
            rows = cs.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Conexion.close(cs);
            Conexion.close(conn);
        }
        return rows;
    }

    public List<Usuario> listarUsuarios(){
        return getUsuarios(CALL_LIST_ALL_USERS);
    }

    private List<Usuario> getUsuarios(String callListUsers) {
        Connection conn = null;
        CallableStatement cs = null;
        ResultSet rs = null;
        List<Usuario> users = new ArrayList<>();
        try {
            conn = Conexion.getConnection();
            cs = conn.prepareCall(callListUsers);
            cs.execute();
            rs = cs.getResultSet();
            while (rs.next()) {
                String idUsuario = rs.getString("id_usuario");
                String nombre = rs.getString("nombre");
                String apellido = rs.getString("apellido");
                LocalDate fechaNacimiento = LocalDate.parse(rs.getString("fecha_nacimiento"));
                String correo = rs.getString("correo");
                String password = rs.getString("password");
                String tipo = rs.getString("tipo");
                String genero = rs.getString("genero");
                String direccion = rs.getString("direccion");
                String telefono = rs.getString("telefono");
                String uriFotoUsuario = rs.getString("uri_foto_usuario");
                String descripcion = rs.getString("descripcion");
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
                users.add(usuario);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Conexion.close(rs);
            Conexion.close(cs);
            Conexion.close(conn);
        }
        return users;
    }
}

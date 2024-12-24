package dominio.constructores;

import dominio.modelos.Usuario;

import java.time.LocalDate;

public class UsuarioBuilder {
    private String idUsuario;
    private String nombre;
    private String apellido;
    private LocalDate fechaNacimiento;
    private String correo;
    private String password;
    private String tipo;
    private String genero;
    private String direccion;
    private String telefono;
    private String uriFotoUsuario;
    private String descripcion;

    public UsuarioBuilder setIdUsuario(String idUsuario) {
        this.idUsuario = idUsuario;
        return this;
    }

    public UsuarioBuilder setNombre(String nombre) {
        this.nombre = nombre;
        return this;
    }

    public UsuarioBuilder setApellido(String apellido) {
        this.apellido = apellido;
        return this;
    }

    public UsuarioBuilder setFechaNacimiento(LocalDate fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
        return this;
    }

    public UsuarioBuilder setCorreo(String correo) {
        this.correo = correo;
        return this;
    }

    public UsuarioBuilder setPassword(String password) {
        this.password = password;
        return this;
    }

    public UsuarioBuilder setTipo(String tipo) {
        this.tipo = tipo;
        return this;
    }

    public UsuarioBuilder setGenero(String genero) {
        this.genero = genero;
        return this;
    }

    public UsuarioBuilder setDireccion(String direccion) {
        this.direccion = direccion;
        return this;
    }

    public UsuarioBuilder setTelefono(String telefono) {
        this.telefono = telefono;
        return this;
    }

    public UsuarioBuilder setUriFotoUsuario(String uriFotoUsuario) {
        this.uriFotoUsuario = uriFotoUsuario;
        return this;
    }

    public UsuarioBuilder setDescripcion(String descripcion) {
        this.descripcion = descripcion;
        return this;
    }

    public Usuario createUsuario() {
        return new Usuario(idUsuario, nombre, apellido, fechaNacimiento, correo, password, tipo, genero, direccion, telefono, uriFotoUsuario, descripcion);
    }
}
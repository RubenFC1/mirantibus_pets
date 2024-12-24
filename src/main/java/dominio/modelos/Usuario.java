package dominio.modelos;

import java.time.LocalDate;

public class Usuario {
    String idUsuario;
    String nombre;
    String apellido;
    LocalDate fechaNacimiento;
    String correo;
    String password;
    String tipo;
    String genero;
    String direccion;
    String telefono;
    String uriFotoUsuario;
    String descripcion;

    public Usuario(String idUsuario, String nombre, String apellido, LocalDate fechaNacimiento, String correo, String password, String tipo, String genero, String direccion, String telefono, String uriFotoUsuario, String descripcion) {
        this.idUsuario = idUsuario;
        this.nombre = nombre;
        this.apellido = apellido;
        this.fechaNacimiento = fechaNacimiento;
        this.correo = correo;
        this.password = password;
        this.tipo = tipo;
        this.genero = genero;
        this.direccion = direccion;
        this.telefono = telefono;
        this.uriFotoUsuario = uriFotoUsuario;
        this.descripcion = descripcion;
    }

    public String getIdUsuario() {
        return idUsuario;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public LocalDate getFechaNacimiento() {
        return fechaNacimiento;
    }

    public String getCorreo() {
        return correo;
    }

    public String getPassword() {
        return password;
    }

    public String getTipo() {
        return tipo;
    }

    public String getGenero() {
        return genero;
    }

    public String getDireccion() {
        return direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public String getUriFotoUsuario() {
        return uriFotoUsuario;
    }

    public String getDescripcion() {
        return descripcion;
    }

    @Override
    public String toString() {
        return "Usuario{" +
               "idUsuario='" + idUsuario + '\'' +
               ", nombre='" + nombre + '\'' +
               ", apellido='" + apellido + '\'' +
               ", fechaNacimiento=" + fechaNacimiento +
               ", correo='" + correo + '\'' +
               ", password='" + password + '\'' +
               ", tipo='" + tipo + '\'' +
               ", genero='" + genero + '\'' +
               ", direccion='" + direccion + '\'' +
               ", telefono='" + telefono + '\'' +
               ", uriFotoUsuario='" + uriFotoUsuario + '\'' +
               ", descripcion='" + descripcion + '\'' +
               '}';
    }
}
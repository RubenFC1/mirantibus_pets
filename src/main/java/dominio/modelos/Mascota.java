package dominio.modelos;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class Mascota {
    int idMascota;
    String nombre;
    int edad;
    String raza;
    String genero;
    String especie;
    String uriFotoMascota;
    String descripcion;
    String idUsuario;
    String contacto;
    LocalDate ultimaVezVisto;
    boolean perdidaEstado;
    int idCita;
    String fechaCita;


    public Mascota(int idMascota, String nombre, int edad, String raza, String genero, String especie, String uriFotoMascota, String descripcion, String idUsuario, String contacto, LocalDate ultimaVezVisto, boolean perdidaEstado, int idCita, String fechaCita) {
        this.idMascota = idMascota;
        this.nombre = nombre;
        this.edad = edad;
        this.raza = raza;
        this.genero = genero;
        this.especie = especie;
        this.uriFotoMascota = uriFotoMascota;
        this.descripcion = descripcion;
        this.idUsuario = idUsuario;
        this.contacto = contacto;
        this.ultimaVezVisto = ultimaVezVisto;
        this.perdidaEstado = perdidaEstado;
        this.idCita = idCita;
        this.fechaCita = fechaCita;
    }

    public int getIdMascota() {
        return idMascota;
    }

    public String getNombre() {
        return nombre;
    }

    public int getEdad() {
        return edad;
    }

    public String getRaza() {
        return raza;
    }

    public String getGenero() {
        return genero;
    }

    public String getEspecie() {
        return especie;
    }

    public String getUriFotoMascota() {
        return uriFotoMascota;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public String getIdUsuario() {
        return idUsuario;
    }

    public String getContacto() { return contacto; }

    public LocalDate getUltimaVezVisto() { return ultimaVezVisto; }

    public boolean isPerdidaEstado() {
        return perdidaEstado;
    }

    public int getIdCita(){
        return idCita;
    }

    public String getFechaCita(){
        return fechaCita;
    }

    @Override
    public String toString() {
        return "Mascota{" +
               "idMascota=" + idMascota +
               ", nombre='" + nombre + '\'' +
               ", edad=" + edad +
               ", raza='" + raza + '\'' +
               ", genero='" + genero + '\'' +
               ", especie='" + especie + '\'' +
               ", uriFotoMascota='" + uriFotoMascota + '\'' +
               ", descripcion='" + descripcion + '\'' +
               ", idUsuario='" + idUsuario + '\'' +
               ", contacto='" + contacto + '\'' +
                ", ultimaVezVisto=" + ultimaVezVisto +
               ", perdidaEstado=" + perdidaEstado +
                ", idCita=" + idCita +
                ", fechaCita='" + fechaCita + '\'' +
               '}';
    }
}
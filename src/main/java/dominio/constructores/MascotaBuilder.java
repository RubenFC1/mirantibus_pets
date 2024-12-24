package dominio.constructores;

import dominio.modelos.Mascota;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class MascotaBuilder {
    private int idMascota;
    private String nombre;
    private int edad;
    private String raza;
    private String genero;
    private String especie;
    private String uriFotoMascota;
    private String descripcion;
    private String idUsuario;
    private String contacto;
    private LocalDate ultimaVezVisto;
    private boolean perdidaEstado;
    private int idCita;
    private String fechaCita;

    public MascotaBuilder setIdMascota(int idMascota) {
        this.idMascota = idMascota;
        return this;
    }

    public MascotaBuilder setNombre(String nombre) {
        this.nombre = nombre;
        return this;
    }

    public MascotaBuilder setEdad(int edad) {
        this.edad = edad;
        return this;
    }

    public MascotaBuilder setRaza(String raza) {
        this.raza = raza;
        return this;
    }

    public MascotaBuilder setGenero(String genero) {
        this.genero = genero;
        return this;
    }

    public MascotaBuilder setEspecie(String especie) {
        this.especie = especie;
        return this;
    }

    public MascotaBuilder setUriFotoMascota(String uriFotoMascota) {
        this.uriFotoMascota = uriFotoMascota;
        return this;
    }

    public MascotaBuilder setDescripcion(String descripcion) {
        this.descripcion = descripcion;
        return this;
    }

    public MascotaBuilder setIdUsuario(String idUsuario) {
        this.idUsuario = idUsuario;
        return this;
    }

    public MascotaBuilder setPerdidaEstado(boolean perdidaEstado) {
        this.perdidaEstado = perdidaEstado;
        return this;
    }

    public MascotaBuilder setContacto(String contacto) {
        this.contacto = contacto;
        return this;
    }

    public MascotaBuilder setUltimaVezVisto(LocalDate ultimaVezVisto) {
        this.ultimaVezVisto = ultimaVezVisto;
        return this;
    }

    public MascotaBuilder setIdCita(int idCita) {
        this.idCita = idCita;
        return this;
    }

    public MascotaBuilder setFechaCita(String fechaCita) {
        this.fechaCita = fechaCita;
        return this;
    }

    public Mascota createMascota() {
        return new Mascota(idMascota, nombre, edad, raza, genero, especie, uriFotoMascota, descripcion, idUsuario, contacto, ultimaVezVisto, perdidaEstado, idCita, fechaCita);
    }
}
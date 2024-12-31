drop database if exists mirantibus2_db;
create database mirantibus2_db;
use mirantibus2_db;

create table articulo
(
    id_articulo          int auto_increment
        primary key,
    nombre_articulo      varchar(40) charset utf8  not null,
    descripcion_articulo varchar(200) charset utf8 not null,
    precio               decimal                   not null,
    tipo                 varchar(30) charset utf8  not null,
    uri_articulo_imagen  varchar(100) charset utf8 not null,
    cantidad             int                       not null
);

create table usuario
(
    id_usuario       varchar(15) charset utf8                                   not null
        primary key,
    nombre           varchar(20) charset utf8                                   not null,
    apellido         varchar(30) charset utf8                                   not null,
    fecha_nacimiento date                                                       not null,
    correo           varchar(80) charset utf8                                   not null,
    password         varchar(25) charset utf8                                   not null,
    tipo             varchar(20) charset utf8  default 'general'                not null,
    genero           varchar(10) charset utf8                                   null,
    direccion        varchar(90) charset utf8                                   null,
    telefono         varchar(20) charset utf8                                   null,
    uri_foto_usuario varchar(100) charset utf8 default 'user.png'               null,
    descripcion      varchar(50) charset utf8  default 'Agrega una descripción' null
);

create table mascota
(
    id_mascota       int auto_increment
        primary key,
    nombre           varchar(30) charset utf8  not null,
    edad             int                       not null,
    raza             varchar(45) charset utf8  not null,
    genero           varchar(1) charset utf8   not null,
    especie          varchar(30) charset utf8  not null,
    uri_foto_mascota varchar(100) charset utf8 null,
    descripcion      varchar(200) charset utf8 null,
    id_usuario       varchar(15) charset utf8  not null,
    perdida_estado   tinyint(1) default 0      not null,
    constraint mascota_nombre_usuario_fk
        foreign key (id_usuario) references usuario (id_usuario)
            on update cascade on delete cascade
);

create table cita
(
    id_cita    int auto_increment
        primary key,
    fecha_cita datetime not null,
    id_mascota int      not null,
    constraint citas_fecha_cita_uindex
        unique (fecha_cita),
    constraint citas_id_mascota_fk
        foreign key (id_mascota) references mascota (id_mascota)
            on update cascade on delete cascade
);

create table mascota_perdida
(
    id_mascota       int                      not null
        primary key,
    contacto         varchar(20) charset utf8  null,
    ultima_vez_visto date                      null,
    constraint mascota_perdida_id_mascota_fk
        foreign key (id_mascota) references mascota (id_mascota)
            on update cascade on delete cascade
);

create table metodo_de_pago
(
    numero_de_tarjeta        varchar(20) charset utf8 not null,
    id_pago                  int                      not null
        primary key,
    nombre_titular           varchar(40) charset utf8 not null,
    fecha_expiracion         date                     not null,
    csv                      int                      not null,
    direccion_de_facturacion varchar(80) charset utf8 not null,
    tipo                     varchar(15) charset utf8 not null,
    id_usuario               varchar(15) charset utf8 null,
    constraint metodo_de_pago_id_usuario_fk
        foreign key (id_usuario) references usuario (id_usuario)
            on update cascade on delete cascade
);

create table pedido
(
    id_pedido   int auto_increment
        primary key,
    id_articulo int not null,
    id_pago     int not null,
    constraint pedidos_id_articulo_fk
        foreign key (id_articulo) references articulo (id_articulo)
            on update cascade on delete cascade,
    constraint pedidos_id_pago_fk
        foreign key (id_pago) references metodo_de_pago (id_pago)
            on update cascade on delete cascade
);

create
    definer = root@localhost procedure insertUsuario(IN arg1 varchar(15), IN arg2 varchar(20), IN arg3 varchar(30),
                                                     IN arg4 date, IN arg5 varchar(80), IN arg6 varchar(25))

insert into mirantibus2_db.usuario (id_usuario, nombre, apellido, fecha_nacimiento, correo, password) VALUES (arg1, arg2, arg3, arg4, arg5, arg6);


create
    definer = root@localhost procedure searchUsuarioByIdAndPassword(IN arg1 varchar(15), IN arg2 varchar(25))

    SELECT id_usuario,
           nombre,
           apellido,
           fecha_nacimiento,
           correo,
           password,
           tipo,
           genero,
           direccion,
           telefono,
           uri_foto_usuario,
           descripcion
    from mirantibus2_db.usuario
    where id_usuario = arg1
      and password = arg2;


create
    definer = root@localhost procedure updateUsuario(IN arg1 varchar(20), IN arg2 varchar(30), IN arg3 varchar(80),
                                                     IN arg4 varchar(25), IN arg5 varchar(10), IN arg6 varchar(90),
                                                     IN arg7 varchar(20), IN arg8 varchar(100), IN arg9 varchar(50),
                                                     IN arg10 varchar(15))

    UPDATE mirantibus2_db.usuario
    SET nombre=arg1,
        apellido=arg2,
        correo=arg3,
        password=arg4,
        genero=arg5,
        direccion=arg6,
        telefono=arg7,
        uri_foto_usuario=arg8,
        descripcion=arg9
    WHERE id_usuario = arg10;

create
    definer = root@localhost procedure listAllDogsByUserId(IN arg1 varchar(15))
    
    SELECT id_usuario,
           id_mascota,
           nombre,
           edad,
           raza,
           genero,
           uri_foto_mascota,
           descripcion,
           especie
    from mirantibus2_db.mascota
    where id_usuario = arg1
      and especie = "perro";
      
      
create
    definer = root@localhost procedure listAllCatsByUserId(IN arg1 varchar(15))
    
    SELECT id_usuario,
           id_mascota,
           nombre,
           edad,
           raza,
           genero,
           uri_foto_mascota,
           descripcion,
           especie
    from mirantibus2_db.mascota
    where id_usuario = arg1
      and especie = "gato";  
      
create
    definer = root@localhost procedure listOtherPetsByUserId(IN arg1 varchar(15))
    
    SELECT id_usuario,
           id_mascota,
           nombre,
           edad,
           raza,
           genero,
           uri_foto_mascota,
           descripcion,
           especie
    from mirantibus2_db.mascota
    where id_usuario = arg1
      and especie != "gato"
      and especie != "perro";    
      
create
    definer = root@localhost procedure insertPet(IN arg1 varchar(30), IN arg2 int, IN arg3 varchar(45),
                                                     IN arg4 varchar(1), IN arg5 varchar(30), IN arg6 varchar(100), arg7 varchar(200), IN arg8 varchar(15), IN arg9 tinyint)

insert into mirantibus2_db.mascota (nombre, edad, raza, genero, especie, uri_foto_mascota, descripcion, id_usuario, perdida_estado) VALUES (arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);   

create
    definer = root@localhost procedure insertLostPet(IN arg1 varchar(20), IN arg2 date)

insert into mirantibus2_db.mascota_perdida (id_mascota, contacto, ultima_vez_visto) VALUES (last_insert_id(), arg1, arg2); 

create
    definer = root@localhost procedure listAllLostPets()
    
    SELECT id_usuario,
           M.id_mascota,
           nombre,
           edad,
           raza,
           genero,
           uri_foto_mascota,
           descripcion,
           especie,
           contacto,
           ultima_vez_visto
    from mirantibus2_db.mascota M join mirantibus2_db.mascota_perdida P on M.id_mascota = P.id_mascota;

create
    definer = root@localhost procedure searchPetById(IN arg1 int)
    
    SELECT id_usuario,
           id_mascota,
           nombre,
           edad,
           raza,
           genero,
           uri_foto_mascota,
           descripcion,
           especie,
           perdida_estado
    from mirantibus2_db.mascota
    where id_mascota = arg1;  
    
create
    definer = root@localhost procedure updatePet(IN arg1 varchar(30), IN arg2 int, IN arg3 varchar(45),
                                                     IN arg4 varchar(1), IN arg5 varchar(30), IN arg6 varchar(100),
                                                     IN arg7 varchar(200), IN arg8 int)

    UPDATE mirantibus2_db.mascota
    SET nombre=arg1,
        edad=arg2,
        raza=arg3,
        genero=arg4,
        especie=arg5,
        uri_foto_mascota=arg6,
        descripcion=arg7,
        id_mascota=arg8
    WHERE id_mascota=arg8;
    
create
    definer = root@localhost procedure agendarCita(IN arg1 int, IN arg2 varchar(30))

insert into mirantibus2_db.cita (id_mascota, fecha_cita) VALUES (arg1, arg2);   

create
    definer = root@localhost procedure listAllUsers()
    
    SELECT id_usuario,
           nombre,
           apellido,
           fecha_nacimiento,
           correo,
           password,
           tipo,
           genero,
           direccion,
           telefono,
           uri_foto_usuario,
           descripcion
    from mirantibus2_db.usuario where tipo='general';
    
    create
    definer = root@localhost procedure searchUsuarioById(IN arg1 varchar(15))

    SELECT id_usuario,
           nombre,
           apellido,
           fecha_nacimiento,
           correo,
           password,
           tipo,
           genero,
           direccion,
           telefono,
           uri_foto_usuario,
           descripcion
    from mirantibus2_db.usuario
    where id_usuario = arg1;
    
    create
    definer = root@localhost procedure deleteUserById(IN arg1 varchar(15))

    delete from mirantibus2_db.usuario where id_usuario=arg1;
    
    create
    definer = root@localhost procedure listAllCitasByUserId(IN arg1 varchar(15))
    
    SELECT M.id_mascota,
           nombre,
           id_usuario,
           id_cita,
           fecha_cita
    from mirantibus2_db.mascota M join mirantibus2_db.cita C on M.id_mascota = C.id_mascota where id_usuario=arg1;
    

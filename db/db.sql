CREATE DATABASE IF NOT EXISTS company;

USE company;

CREATE TABLE CLIENTE(
	id_cliente INT(11) NOT NULL AUTO_INCREMENT,
	cedula VARCHAR(11) NOT NULL,
    nombre VARCHAR(15) NOT NULL,
    apellido VARCHAR(20) NOT NULL,
    correo VARCHAR(100) NOT NULL,
    contrasena VARCHAR(11) NOT NULL,
    numero_hijos INT(11) NOT NULL,
    PRIMARY KEY(id_cliente)
);

INSERT INTO CLIENTE(cedula, nombre, apellido, correo, contrasena, numero_hijos) 
VALUES ('1000', 'Juan', 'Perez', 'juanperez@hotmail.com', '123456', 3);

SELECT * FROM CLIENTE;

CREATE TABLE HIJO (
    id_hijo INT(11) NOT NULL AUTO_INCREMENT,
    ti VARCHAR(11) NOT NULL,
    nombre VARCHAR(15) NOT NULL,
    apellido VARCHAR(20) NOT NULL,
    alergia VARCHAR(11),
    direccion VARCHAR(100) NOT NULL,
    telefono VARCHAR(11) NOT NULL,
    id_cliente INT(11),
    id_membresia INT(11),
    FOREIGN KEY (id_cliente)
        REFERENCES CLIENTE (id_cliente),
    FOREIGN KEY (id_membresia)
        REFERENCES MEMBRESIA (id_membresia),
    PRIMARY KEY (id_hijo)
);

INSERT INTO HIJO(ti, nombre, apellido, alergia, direccion, telefono) 
VALUES ('1000', 'Juan', 'Perez', 'ninguna', 'call 30 con nqs' ,'123456');

SELECT * FROM HIJO;

CREATE TABLE MEMBRESIA(
	id_membresia INT (11) NOT NULL AUTO_INCREMENT,
    tipo_lonchera VARCHAR(50) NOT NULL,
    cantidad_lonchera INT(11) NOT NULL,
    costo INT(11) NOT NULL,
    id_lonchera INT(11),
    FOREIGN KEY (id_lonchera) REFERENCES MEMBRESIALONCHERA(id_lonchera), 
    PRIMARY KEY(id_membresia)
);

CREATE TABLE MEMBRESIALONCHERA(
	id_membresia INT(11),
    id_lonchera INT(11),
    FOREIGN KEY (id_membresia) REFERENCES MEMBRESIA(id_membresia), 
    FOREIGN KEY (id_lonchera) REFERENCES LONCHERAS(id_lonchera), 
    PRIMARY KEY (id_membresia, id_lonchera)
);

CREATE TABLE LONCHERAS(
	id_lonchera INT(11),
    cantidad_producto INT(11) NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
    id_membresia INT(11),
    id_producto INT(11),
    FOREIGN KEY (id_membresia) REFERENCES MEMBRESIALONCHERA(id_membresia), 
    FOREIGN KEY (id_producto) REFERENCES LONCHERAPRODUCTO(id_producto), 
    PRIMARY KEY (id_lonchera)
);

CREATE TABLE LONCHERAPRODUCTO(
	id_lonchera INT(11),
    id_producto INT(11),
    FOREIGN KEY (id_lonchera) REFERENCES LONCHERAS(id_lonchera), 
    FOREIGN KEY (id_producto) REFERENCES PRODUCTO(id_producto), 
    PRIMARY KEY (id_lonchera, id_producto)
);

CREATE TABLE PRODUCTO(
    id_producto INT(11) NOT NULL AUTO_INCREMENT,
    nombre_producto VARCHAR(11) NOT NULL,
    fecha_vencimiento DATE NOT NULL,
    precio INT(11) NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
    id_lonchera INT(11),
    id_proveedor INT(11),
    FOREIGN KEY (id_lonchera) REFERENCES LONCHERAPRODUCTO(id_lonchera), 
    FOREIGN KEY (id_proveedor) REFERENCES PROVEEDORES(id_proveedor), 
    PRIMARY KEY (id_producto)
);

ALTER TABLE producto ADD imagen_producto VARCHAR(200) NOT NULL AFTER descripcion;

CREATE TABLE PROVEEDORES(
	id_proveedor INT(11) NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(15) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    telefono VARCHAR(11) NOT NULL,
    PRIMARY KEY(id_proveedor)
);

CREATE TABLE employee(
	id INT(11) NOT NULL AUTO_INCREMENT,
    name VARCHAR(45) DEFAULT NULL,
    salary INT(11) DEFAULT NULL,
    primary key(id)

);


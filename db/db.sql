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
VALUES ('2000', 'Juanito', 'Perez', 'ninguna', 'call 30 con nqs' ,'123456');

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

INSERT INTO MEMBRESIA(tipo_lonchera, cantidad_lonchera, costo) 
VALUES ('premium', 5, 10000);

ALTER TABLE Membresia ADD numeroProductos INT(11);

SELECT * FROM membresia;

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

ALTER TABLE LONCHERAS MODIFY id_lonchera INT(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE loncheras ADD lista_productos json;

INSERT INTO LONCHERAS(id_lonchera, cantidad_producto, descripcion, id_membresia, id_producto, id_hijo, lista_productos) 
VALUES (3, 5, 'Pues bueno que hacemos', 2, 3, 5, '["1", "2", "3"]');

DELETE FROM LONCHERAS WHERE ID_LONCHERA =1;
SELECT * FROM loncheras;

ALTER TABLE LONCHERAS ADD id_hijo INT(11) unique;
ALTER TABLE LONCHERAS ADD foreign key(id_hijo) references HIJO(id_hijo);

SELECT * FROM loncheras;

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

INSERT INTO PRODUCTO(nombre_producto, fecha_vencimiento, precio, descripcion, imagen_producto, id_lonchera, id_proveedor) 
VALUES ('pepsi', '20-12-17', 2000, 'botella en lata, tomalo y veras', 'https://www.pepsi.com/en-us/uploads/images/can-pepsi.png?mtime=20180110134757', 2, 1);

SELECT * FROM PRODUCTO;

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


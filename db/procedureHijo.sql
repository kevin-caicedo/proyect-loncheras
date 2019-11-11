CREATE PROCEDURE hijoAddOrEdit(
	IN _id_hijo INT,
	IN _ti VARCHAR(11),
    IN _nombre VARCHAR (15),
    IN _apellido VARCHAR(20),
    IN _alergia VARCHAR(11),
    IN _direccion VARCHAR(100),
    IN _telefono VARCHAR(11),
    IN _id_cliente INT,
    IN _id_membresia INT
)
BEGIN
	IF _id_hijo = 0 THEN
		INSERT INTO HIJO(ti, nombre, apellido, alergia, direccion, telefono, id_cliente, id_membresia)
        VALUES (_ti, _nombre, _apellido, _alergia, _direccion, _telefono, _id_cliente, _id_membresia);
        SET _id_hijo = LAST_INSERT_ID();
	ELSE
		UPDATE HIJO
		SET
			ti = _ti,
            nombre = _nombre,
            apellido = _apellido,
            alergia = _alergia,
            direccion = _direccion,
            telefono = _telefono,
            id_cliente = _id_cliente
            WHERE id_hijo = _id_hijo;
	END IF;    
    SELECT _id_hijo AS id_hijo;
END
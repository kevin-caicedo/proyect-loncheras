CREATE PROCEDURE clienteAddOrEdit(
	IN _id_cliente INT,
	IN _cedula INT,
    IN _nombre VARCHAR (15),
    IN _apellido VARCHAR(20),
    IN _correo VARCHAR(100),
    IN _contrasena VARCHAR(11),
    IN _numero_hijos INT
)
BEGIN
	IF _id_cliente = 0 THEN
		INSERT INTO CLIENTE(cedula, nombre, apellido, correo, contrasena, numero_hijos)
        VALUES (_cedula, _nombre, _apellido, _correo, _contrasena, _numero_hijos);
        SET _id_cliente = LAST_INSERT_ID();
	ELSE
		UPDATE CLIENTE
		SET
			cedula = _cedula,
            nombre = _nombre,
            apellido = _apellido,
            correo = _correo,
            contrasena = _contrasena,
            numero_hijos = _numero_hijos
            WHERE id_cliente = _id_cliente;
	END IF;    
    SELECT _id_cliente AS id_cliente;
END
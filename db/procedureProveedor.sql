CREATE PROCEDURE proveedorAddOrEdit(
	IN _id_proveedor INT,
    IN _nombre VARCHAR (15),
    IN _direccion VARCHAR(100),
    IN _telefono VARCHAR(11)
)
BEGIN
	IF _id_proveedor = 0 THEN
		INSERT INTO PROVEEDORES(nombre, direccion, telefono)
        VALUES (_nombre, _direccion, _telefono);
        SET _id_proveedor = LAST_INSERT_ID();
	ELSE
		UPDATE PROVEEDORES
		SET
			nombre = _nombre,
            direccion = _direccion,
            telefono = _telefono
            WHERE id_proveedor = _id_proveedor;
	END IF;    
    SELECT _id_proveedor AS id_proveedor;
END
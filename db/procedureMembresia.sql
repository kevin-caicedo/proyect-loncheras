CREATE PROCEDURE membresiaAddOrEdit(
	IN _id_membresia INT,
	IN _tipo_lonchera VARCHAR(50),
    IN _cantidad_lonchera INT,
    IN _costo INT,
    IN _id_lonchera INT
)
BEGIN
	IF _id_membresia = 0 THEN
		INSERT INTO MEMBRESIA(tipo_lonchera, cantidad_lonchera, costo, id_lonchera)
        VALUES (_tipo_lonchera, _cantidad_lonchera, _costo, _id_lonchera);
        SET _id_membresia = LAST_INSERT_ID();
	ELSE
		UPDATE MEMBRESIA
		SET
			tipo_lonchera = _tipo_lonchera,
            cantidad_lonchera = _cantidad_lonchera,
            costo = _costo,
            id_lonchera = _id_lonchera
            WHERE id_membresia = _id_membresia;
	END IF;    
    SELECT _id_membresia AS id_membresia;
END
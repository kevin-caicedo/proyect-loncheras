CREATE DEFINER=`root`@`localhost` PROCEDURE `productoAddOrEddit`(
	IN _id_producto INT,
    IN _nombre_producto VARCHAR(11),
    IN _fecha_vencimiento DATE,
    IN _precio INT,
    IN _descripcion VARCHAR(100),
    IN _imagen_producto VARCHAR(200),
    IN _id_lonchera INT,
    IN _id_proveedor INT
)
BEGIN
	IF _id_producto = 0 THEN
		INSERT INTO PRODUCTO(id_producto, nombre_producto, fecha_vencimiento, precio, descripcion, imagen_producto, id_lonchera, id_proveedor)
        VALUES (_id_producto, _nombre_producto, _fecha_vencimiento, _precio, _descripcion, _imagen_producto, _id_lonchera, _id_proveedor);
        SET _id_producto = LAST_INSERT_ID();
	ELSE
		UPDATE PRODUCTO
		SET
			id_producto = _id_producto,
            nombre_producto = _nombre_producto,
            fecha_vencimiento = _fecha_vencimiento,
            precio = _precio,
            descripcion = _descripcion,
            imagen_producto = _imagen_producto,
            id_lonchera = _id_lonchera,
            id_proveedor = _id_proveedor
            WHERE id_producto = _id_producto;
	END IF;    
END
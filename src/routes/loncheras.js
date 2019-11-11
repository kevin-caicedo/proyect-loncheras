const express = require('express');
const router = express.Router();

const mysqlConnection = require('../database.js');

//CREA O INSERTA
    //REGISTRA CLIENTE
    router.post('/registroCliente', (req, res) => {
      const { id_cliente, cedula, nombre, apellido, correo, contrasena, numero_hijos } = req.body;
      const query = `
          CALL clienteAddOrEdit(?, ?, ?, ?, ?, ?, ?);
        `;

      mysqlConnection.query(query, [id_cliente, cedula, nombre, apellido, correo, contrasena, numero_hijos], (err, rows, fields) => {
        if (!err) {
          res.json({ status: 'Employeed Saved' });
        } else {
          console.log(err);
        }
      });
    });

    //REGISTRAR HIJOS
    router.post('/registroHijo', (req, res) => {
      const { id_hijo, ti, nombre, apellido, alergia, direccion, telefono, id_cliente, id_membresia } = req.body;
      const query = `
          CALL hijoAddOrEdit(?, ?, ?, ?, ?, ?, ?, ?, ?);
        `;

      mysqlConnection.query(query, [id_hijo, ti, nombre, apellido, alergia, direccion, telefono, id_cliente, id_membresia], (err, rows, fields) => {
        if (!err) {
          res.json({ status: 'Child Saved' });
        } else {
          console.log(err);
        }
      });
    });
    
    //REGISTRAR COMPRA DE MEMBRESÍAS
    router.post('/registroMembresia', (req, res) => {
      const { id_membresia, tipo_lonchera, cantidad_lonchera, costo, id_lonchera } = req.body;
      const query = `
          CALL membresiaAddOrEdit(?, ?, ?, ?, ?);
        `;

      mysqlConnection.query(query, [id_membresia, tipo_lonchera, cantidad_lonchera, costo, id_lonchera], (err, rows, fields) => {
        if (!err) {
          res.json({ status: 'Membership Saved' });
        } else {
          console.log(err);
        }
      });


    });
    //REGISTRAR PROVEEDOR
    router.post('/registroProveedor', (req, res) => {
      const { id_proveedor, nombre, direccion, telefono } = req.body;
      const query = `
          CALL proveedorAddOrEdit(?, ?, ?, ?);
        `;

      mysqlConnection.query(query, [id_proveedor, nombre, direccion, telefono], (err, rows, fields) => {
        if (!err) {
          res.json({ status: 'Provider Saved' });
        } else {
          console.log(err);
        }
      });

    });

    //Registrar PRODUCTO
    router.post('/registroProducto', (req, res) => {
      const { id_producto, nombre_producto, fecha_vencimiento, precio, descripcion, imagen_producto, id_lonchera, id_proveedor } = req.body;
      const query = `
          CALL productoAddOrEdit(?, ?, ?, ?, ?, ?, ?, ?);
        `;

      mysqlConnection.query(query, [id_producto, nombre_producto, fecha_vencimiento, precio, descripcion, imagen_producto, id_lonchera, id_proveedor], (err, rows, fields) => {
        if (!err) {
          res.json({ status: 'Product Saved' });
        } else {
          console.log(err);
        }
      });
    });



//LEER DATOS

    //Entrega información de solo un cliente correo y contrasena
        


    // Entrega información da lista de proveedores
    router.get('/proveedores', (req, res) => {
      mysqlConnection.query('SELECT * FROM PROVEEDORES', (err, rows, fields) => {
        if (!err) {
          res.json(rows);
        } else {
          console.log(err);
        }
      });
    });

    //Entrega información de lista de clientes
    router.get('/clientes', (req, res) => {
      mysqlConnection.query('SELECT * FROM CLIENTE', (err, rows, fields) => {
        if (!err) {
          res.json(rows);
        } else {
          console.log(err);
        }
      });
    });

    //Entrega información de lista de productos
    router.get('/productos', (req, res) => {
      mysqlConnection.query('SELECT * FROM PRODUCTO', (err, rows, fields) => {
        if (!err) {
          res.json(rows);
        } else {
          console.log(err);
        }
      });
    });

    //Entrega información de lista de hijos
    router.get('/hijos', (req, res) => {
      mysqlConnection.query('SELECT * FROM HIJO', (err, rows, fields) => {
        if (!err) {
          res.json(rows);
        } else {
          console.log(err);
        }
      });
    });

    //OBTIENE TODOS LOS HIJOS DE UN CLIENTE
    router.get('/cliente/hijo/:id_cliente', (req, res) =>{
      const { id_cliente } = req.params;
      mysqlConnection.query('SELECT * FROM HIJO WHERE id_cliente = ?', [id_cliente], (err, rows, fields) =>{
        if(!err){
          res.json(rows);
        }else{
          res.status(500).send('Internal error server');
        }

      });
    });

    //OBTIENE TODOS LOS PROVEEDORES DE UN PRODUCTO
    router.get('/proveedor/producto/:id_proveedor', (req, res) =>{
      const { id_proveedor } = req.params;
      mysqlConnection.query('SELECT * FROM PRODUCTO WHERE id_proveedor = ?', [id_proveedor], (err, rows, fields) =>{
        if(!err){
          res.json(rows);
        }else{
          res.status(500).send('Internal error server');
        }

      });
    });

    //OBTIENE TODAS LAS MEMBRESIAS DE PRODUCTOS
    router.get('/membresia/producto/:id_membresia', (req, res) =>{
      const { id_membresia } = req.params;
      mysqlConnection.query('SELECT * FROM PRODUCTO WHERE id_membresia = ?', [id_membresia], (err, rows, fields) =>{
        if(!err){
          res.json(rows);
        }else{
          res.status(500).send('Internal error server');
        }

      });
    });



// ACTUALIZAR DATOS

// ELIMINAR DATOS




// EJEMPLOS DE GUÍAS PARA DESARROLLO DE SERVICIOS REST
// GET all Employees
router.get('/', (req, res) => {
  mysqlConnection.query('SELECT * FROM employee', (err, rows, fields) => {
    if (!err) {
      res.json(rows);
    } else {
      console.log(err);
    }
  });
});

// GET An Employee
router.get('/:id', (req, res) => {
  const { id } = req.params;
  mysqlConnection.query('SELECT * FROM employee WHERE id = ?', [id], (err, rows, fields) => {
    if (!err) {
      res.json(rows[0]);
    } else {
      console.log(err);
    }
  });
});

// DELETE An Employee
router.delete('/:id', (req, res) => {
  const { id } = req.params;
  mysqlConnection.query('DELETE FROM employee WHERE id = ?', [id], (err, rows, fields) => {
    if (!err) {
      res.json({ status: 'Employee Deleted' });
    } else {
      console.log(err);
    }
  });
});

// INSERT An Employee
router.post('/', (req, res) => {
  const { id, name, salary } = req.body;
  console.log(id, name, salary);
  const query = `
    CALL employeeAddOrEdit(?, ?, ?);
  `;
  mysqlConnection.query(query, [id, name, salary], (err, rows, fields) => {
    if (!err) {
      res.json({ status: 'Employeed Saved' });
    } else {
      console.log(err);
    }
  });

});

// ACTUALIZA Y MODIFICA EMPLEADO
router.put('/:id', (req, res) => {
  const { name, salary } = req.body;
  const { id } = req.params;
  const query = `
    CALL employeeAddOrEdit(?, ?, ?);
  `;
  mysqlConnection.query(query, [id, name, salary], (err, rows, fields) => {
    if (!err) {
      res.json({ status: 'Employee Updated' });
    } else {
      console.log(err);
    }
  });
});

module.exports = router;

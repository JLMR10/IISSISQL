/* FUNCION AUXILIAR */
CREATE OR REPLACE FUNCTION EQUALS(salida BOOLEAN, salidaEsperada BOOLEAN) RETURN VARCHAR2 AS BEGIN IF (salida = salidaEsperada) THEN RETURN 'EXITO'; ELSE RETURN 'FALLO'; END IF; END EQUALS;

/
CREATE OR REPLACE PROCEDURE PRINTR(nombre_prueba VARCHAR2, salida BOOLEAN, salidaEsperada BOOLEAN) IS BEGIN DBMS_OUTPUT.put_line(nombre_prueba || ':' || EQUALS(salida, salidaEsperada)); END PRINTR;

/ /* DEFINICION PRUEBAS */
CREATE OR REPLACE PACKAGE PRUEBAS_SOCIO AS PROCEDURE inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2, i_nombre VARCHAR2, i_apellidos VARCHAR2, i_DNI VARCHAR2, i_direccion VARCHAR2, i_nacimiento DATE, i_email VARCHAR2 ,salidaEsperada BOOLEAN);

PROCEDURE actualizar (nombre_prueba VARCHAR2, a_DNI VARCHAR2, a_direccion VARCHAR2, a_email VARCHAR2, salidaEsperada BOOLEAN);

PROCEDURE eliminar (nombre_prueba VARCHAR2, e_DNI VARCHAR2, salidaEsperada BOOLEAN);

END PRUEBAS_SOCIO;

/
CREATE OR REPLACE PACKAGE PRUEBAS_PROVEEDOR AS PROCEDURE inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2, i_CIF VARCHAR2, i_nombre VARCHAR2, i_telefono INT, i_email VARCHAR2, salidaEsperada BOOLEAN);

PROCEDURE actualizar (nombre_prueba VARCHAR2, a_cif VARCHAR2, a_nombre VARCHAR2, a_telefono INT, a_email VARCHAR2, salidaEsperada BOOLEAN);

PROCEDURE eliminar (nombre_prueba VARCHAR2, e_CIF VARCHAR2, salidaEsperada BOOLEAN);

END PRUEBAS_PROVEEDOR;

/
CREATE OR REPLACE PACKAGE PRUEBAS_EMPLAZAMIENTO AS PROCEDURE inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2, i_direccion VARCHAR2, i_telefono INT, i_tipo VARCHAR2, salidaEsperada BOOLEAN);

PROCEDURE actualizar (nombre_prueba VARCHAR2, a_id_emplazamiento INT, a_direccion VARCHAR2, a_telefono INT, salidaEsperada BOOLEAN);

PROCEDURE eliminar (nombre_prueba VARCHAR2, e_id_emplazamiento INT, salidaEsperada BOOLEAN);

END PRUEBAS_EMPLAZAMIENTO;

/
CREATE OR REPLACE PACKAGE PRUEBAS_ALBARAN AS PROCEDURE inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2, i_fecha DATE, i_precio NUMBER, i_id_pedido INT, salidaEsperada BOOLEAN);

PROCEDURE eliminar (nombre_prueba VARCHAR2, e_id_albaran INT, salidaEsperada BOOLEAN);

END PRUEBAS_ALBARAN;

/
CREATE OR REPLACE PACKAGE PRUEBAS_PEDIDO AS PROCEDURE inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2, i_fecha DATE, i_precio NUMBER, i_id_emplazamiento INT, i_cif VARCHAR2, salidaEsperada BOOLEAN);

PROCEDURE eliminar (nombre_prueba VARCHAR2, e_id_pedido INT, salidaEsperada BOOLEAN);

END PRUEBAS_PEDIDO;

/
CREATE OR REPLACE PACKAGE PRUEBAS_PRODUCTO AS PROCEDURE inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2, i_nombre VARCHAR2, i_descripcion VARCHAR2, i_categoria VARCHAR2, i_precioProducto INT, i_iva INT, salidaEsperada BOOLEAN);

PROCEDURE actualizar (nombre_prueba VARCHAR2, a_id_producto INT , a_descripcion VARCHAR2, a_precioProducto INT, a_iva INT, salidaEsperada BOOLEAN);

PROCEDURE eliminar (nombre_prueba VARCHAR2, e_id_producto INT, salidaEsperada BOOLEAN);

END PRUEBAS_PRODUCTO;

/
CREATE OR REPLACE PACKAGE PRUEBAS_VENTA AS PROCEDURE inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2, i_precioVenta Number, i_fecha DATE, i_dni VARCHAR2, salidaEsperada BOOLEAN);

PROCEDURE eliminar (nombre_prueba VARCHAR2, e_id_venta INT, salidaEsperada BOOLEAN);

PROCEDURE descuento (nombre_prueba VARCHAR2, v_id_venta int,v_preciototal number,v_dni_socio varchar2, salidaEsperada BOOLEAN);

END PRUEBAS_VENTA;

/
CREATE OR REPLACE PACKAGE PRUEBAS_SOLICITUD_TRASPASO AS PROCEDURE inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2, i_fechaSolicitud DATE, i_id_emplazamientoSalida INT, i_id_emplazamientoEntrada INT, salidaEsperada BOOLEAN);

PROCEDURE eliminar (nombre_prueba VARCHAR2, e_id_solicitudTraspaso INT, salidaEsperada BOOLEAN);

END PRUEBAS_SOLICITUD_TRASPASO;

/
CREATE OR REPLACE PACKAGE PRUEBAS_FACTURA AS PROCEDURE inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2, i_precioTotal INT, i_fechaDeExpedicion DATE, i_devuelto VARCHAR2, i_id_venta INT, i_id_emplazamiento INT, salidaEsperada BOOLEAN);

PROCEDURE actualizar (nombre_prueba VARCHAR2, a_id_factura INT,a_devuelto VARCHAR2, salidaEsperada BOOLEAN);

PROCEDURE eliminar (nombre_prueba VARCHAR2, e_id_factura INT, salidaEsperada BOOLEAN);

END PRUEBAS_FACTURA;

/
CREATE OR REPLACE PACKAGE PRUEBAS_TRASPASO AS PROCEDURE inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2, i_fechaTraspaso DATE, i_id_emplazamientoSalida INT, i_id_emplazamientoEntrada INT, salidaEsperada BOOLEAN);

PROCEDURE eliminar (nombre_prueba VARCHAR2, e_id_Traspaso INT, salidaEsperada BOOLEAN);

END PRUEBAS_TRASPASO;

/
CREATE OR REPLACE PACKAGE PRUEBAS_A_VENTA_PRODUCTO AS PROCEDURE inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2, i_id_venta INT, i_id_producto INT, i_cantidad NUMBER, i_precioVenta NUMBER, i_ivaVenta NUMBER, i_precioLinea NUMBER, salidaEsperada BOOLEAN);

PROCEDURE eliminar (nombre_prueba VARCHAR2, e_id_venta INT, e_id_producto INT, salidaEsperada BOOLEAN);

END PRUEBAS_A_VENTA_PRODUCTO;

/
CREATE OR REPLACE PACKAGE PRUEBA_STOCK AS PROCEDURE inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2, i_id_emplazamiento INT, i_id_producto INT, i_cantidad INT, salidaEsperada BOOLEAN);

PROCEDURE actualizar (nombre_prueba VARCHAR2, a_id_emplazamiento INT, a_id_producto INT, a_cantidad INT, salidaEsperada BOOLEAN);

PROCEDURE eliminar (nombre_prueba VARCHAR2, e_id_emplazamiento INT, e_id_producto INT, salidaEsperada BOOLEAN);

PROCEDURE stock_correcto (nombre_prueba VARCHAR2, e_id_emplazamiento INT, e_id_producto INT,stock_previo int, cantidad INT, salidaEsperada BOOLEAN);

PROCEDURE stock_correcto_p (nombre_prueba VARCHAR2, e_id_emplazamiento INT, e_id_producto INT,stock_previo int, cantidad INT, salidaEsperada BOOLEAN);

PROCEDURE stock_correcto_t (nombre_prueba VARCHAR2, e_id_emplazamiento_envia int, e_id_emplazamiento_recibe int, stock_previo_envia int, stock_previo_recibe int, cantidad int, e_id_producto int, salidaEsperada BOOLEAN);

END PRUEBA_STOCK;

/
CREATE OR REPLACE PACKAGE PRUEBAS_A_PRODUCTO_SOLICITUD AS PROCEDURE inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2,i_id_producto INT, i_id_Solicitud INT, i_cantidad NUMBER, salidaEsperada BOOLEAN);

PROCEDURE eliminar (nombre_prueba VARCHAR2, e_id_Solicitud INT, e_id_producto INT, salidaEsperada BOOLEAN);

END PRUEBAS_A_PRODUCTO_SOLICITUD;

/
CREATE OR REPLACE PACKAGE PRUEBAS_A_PRODUCTO_TRASPASO AS PROCEDURE inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2, i_id_producto INT, i_id_Traspaso INT, i_cantidad NUMBER, salidaEsperada BOOLEAN);

PROCEDURE eliminar (nombre_prueba VARCHAR2, e_id_Traspaso INT, e_id_producto INT, salidaEsperada BOOLEAN);

END PRUEBAS_A_PRODUCTO_TRASPASO;

/
CREATE OR REPLACE PACKAGE PRUEBAS_A_PEDIDO_PRODUCTO AS PROCEDURE inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2, i_id_pedido INT, i_id_producto INT, i_cantidad NUMBER, i_precioCompra INT, i_iva INT, i_precioLinea INT, salidaEsperada BOOLEAN);

PROCEDURE eliminar (nombre_prueba VARCHAR2, e_id_pedido INT, e_id_producto INT, salidaEsperada BOOLEAN);

END PRUEBAS_A_PEDIDO_PRODUCTO;

/ /* CUERPOS DE PRUEBAS */ --de socio

CREATE OR REPLACE PACKAGE BODY PRUEBAS_SOCIO AS PROCEDURE inicializar AS BEGIN
DELETE
FROM SOCIO; END inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2, i_nombre VARCHAR2, i_apellidos VARCHAR2, i_DNI VARCHAR2, i_direccion VARCHAR2, i_nacimiento DATE, i_email VARCHAR2 ,salidaEsperada BOOLEAN) AS salida BOOLEAN := TRUE;

actual socio%ROWTYPE;

BEGIN
INSERT INTO socio
VALUES (i_nombre,
        i_apellidos,
        i_direccion,
        i_nacimiento,
        i_email,
        i_DNI);


SELECT * INTO actual
FROM SOCIO
WHERE DNI = i_DNI;

IF (actual.nombre<>i_nombre)
OR (actual.apellidos<>i_apellidos)
OR (actual.DNI<>i_DNI)
OR (actual.direccion<>i_direccion)
OR (actual.fechadenacimiento<>i_nacimiento)
OR (actual.email<>i_email) THEN salida := FALSE;

END IF;

PRINTR(nombre_prueba, salida, salidaEsperada);


EXCEPTION WHEN OTHERS THEN PRINTR(nombre_prueba, FALSE, salidaEsperada);


ROLLBACK;

END insertar;

PROCEDURE actualizar (nombre_prueba VARCHAR2, a_DNI VARCHAR2, a_direccion VARCHAR2, a_email VARCHAR2, salidaEsperada BOOLEAN) AS salida BOOLEAN := TRUE;

actual socio%ROWTYPE;

BEGIN
UPDATE SOCIO
SET DIRECCION = a_direccion,
    EMAIL = a_email
WHERE DNI = a_DNI;


SELECT * INTO actual
FROM SOCIO
WHERE DNI = a_DNI;

IF (actual.direccion<>a_direccion)
OR (actual.email<>a_email) THEN salida := FALSE;

END IF;

PRINTR(nombre_prueba, salida, salidaEsperada);


EXCEPTION WHEN OTHERS THEN PRINTR(nombre_prueba, FALSE, salidaEsperada);


ROLLBACK;

END actualizar;

PROCEDURE eliminar (nombre_prueba VARCHAR2, e_DNI VARCHAR2, salidaEsperada BOOLEAN) AS salida BOOLEAN := TRUE;

cantidad INT;

BEGIN
DELETE
FROM SOCIO
WHERE DNI = e_DNI;


SELECT COUNT(*) INTO cantidad
FROM SOCIO
WHERE DNI = e_DNI;

IF (cantidad<>0) THEN salida := FALSE;

END IF;

PRINTR(nombre_prueba, salida, salidaEsperada);


EXCEPTION WHEN OTHERS THEN PRINTR(nombre_prueba, FALSE, salidaEsperada);


ROLLBACK;

END eliminar;

END PRUEBAS_SOCIO;

/ --paquete de proveedor

CREATE OR REPLACE PACKAGE BODY PRUEBAS_PROVEEDOR AS PROCEDURE inicializar AS BEGIN
DELETE
FROM PROVEEDOR; END inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2, i_CIF VARCHAR2, i_nombre VARCHAR2, i_telefono INT, i_email VARCHAR2, salidaEsperada BOOLEAN) AS salida BOOLEAN := TRUE;

actual proveedor%ROWTYPE;

BEGIN
INSERT INTO PROVEEDOR
VALUES (i_CIF,
        i_nombre,
        i_telefono,
        i_email);


SELECT * INTO actual
FROM PROVEEDOR
WHERE CIF = i_CIF;

IF (actual.nombre<>i_nombre)
OR (actual.telefono<>i_telefono)
OR (actual.CIF<>i_CIF)
OR (actual.email<>i_email) THEN salida := FALSE;

END IF;

PRINTR(nombre_prueba, salida, salidaEsperada);


EXCEPTION WHEN OTHERS THEN PRINTR(nombre_prueba, FALSE, salidaEsperada);


ROLLBACK;

END insertar;

PROCEDURE actualizar (nombre_prueba VARCHAR2, a_cif VARCHAR2, a_nombre VARCHAR2, a_telefono INT, a_email VARCHAR2, salidaEsperada BOOLEAN) AS salida BOOLEAN := TRUE;

actual proveedor%ROWTYPE;

BEGIN
UPDATE PROVEEDOR
SET NOMBRE = a_nombre,
    TELEFONO = a_telefono,
    EMAIL = a_email
WHERE CIF = a_cif;


SELECT * INTO actual
FROM PROVEEDOR
WHERE CIF = a_cif;

IF (actual.nombre<>a_nombre)
OR (actual.telefono<>a_telefono)
OR (actual.email<>a_email) THEN salida := FALSE;

END IF;

PRINTR(nombre_prueba, salida, salidaEsperada);


EXCEPTION WHEN OTHERS THEN PRINTR(nombre_prueba, FALSE, salidaEsperada);


ROLLBACK;

END actualizar;

PROCEDURE eliminar (nombre_prueba VARCHAR2, e_CIF VARCHAR2, salidaEsperada BOOLEAN) AS salida BOOLEAN := TRUE;

cantidad INT;

BEGIN
DELETE
FROM PROVEEDOR
WHERE CIF = e_CIF;


SELECT COUNT(*) INTO cantidad
FROM PROVEEDOR
WHERE CIF = e_cif;

IF (cantidad<>0) THEN salida := FALSE;

END IF;

PRINTR(nombre_prueba, salida, salidaEsperada);


EXCEPTION WHEN OTHERS THEN PRINTR(nombre_prueba, FALSE, salidaEsperada);


ROLLBACK;

END eliminar;

END PRUEBAS_PROVEEDOR;

/ --de emplazamiento

CREATE OR REPLACE PACKAGE BODY PRUEBAS_EMPLAZAMIENTO AS PROCEDURE inicializar AS BEGIN
DELETE
FROM EMPLAZAMIENTO; END inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2, i_direccion VARCHAR2, i_telefono INT, i_tipo VARCHAR2, salidaEsperada BOOLEAN) AS salida BOOLEAN := TRUE;

actual emplazamiento%ROWTYPE;

w_ID_Emplazamiento INT;

BEGIN
INSERT INTO emplazamiento
VALUES(NULL,
       i_direccion,
       i_telefono,
       i_tipo);

w_ID_Emplazamiento := S_ID_Emplazamiento.currval;


SELECT * INTO actual
FROM EMPLAZAMIENTO
WHERE ID_EMPLAZAMIENTO = w_ID_Emplazamiento;

IF (actual.direccion<>i_direccion)
OR (actual.telefono<>i_telefono)
OR (actual.tipo<>i_tipo) THEN salida := FALSE;

END IF;

PRINTR(nombre_prueba, salida, salidaEsperada);


EXCEPTION WHEN OTHERS THEN PRINTR(nombre_prueba, FALSE, salidaEsperada);


ROLLBACK;

END insertar;

PROCEDURE actualizar (nombre_prueba VARCHAR2, a_id_emplazamiento INT, a_direccion VARCHAR2, a_telefono INT, salidaEsperada BOOLEAN)AS salida BOOLEAN := TRUE;

actual emplazamiento%ROWTYPE;

BEGIN
UPDATE emplazamiento
SET DIRECCION = a_direccion,
    TELEFONO = a_telefono
WHERE ID_EMPLAZAMIENTO = a_id_emplazamiento;


SELECT * INTO actual
FROM EMPLAZAMIENTO
WHERE ID_EMPLAZAMIENTO = a_id_emplazamiento;

IF (actual.direccion<>a_direccion)
OR (actual.telefono<>a_telefono) THEN salida := FALSE;

END IF;

PRINTR(nombre_prueba, salida, salidaEsperada);


EXCEPTION WHEN OTHERS THEN PRINTR(nombre_prueba, FALSE, salidaEsperada);


ROLLBACK;

END actualizar;

PROCEDURE eliminar (nombre_prueba VARCHAR2, e_id_emplazamiento INT, salidaEsperada BOOLEAN) AS salida BOOLEAN := TRUE;

cantidad INT;

BEGIN
DELETE
FROM EMPLAZAMIENTO
WHERE ID_EMPLAZAMIENTO = e_id_emplazamiento;


SELECT COUNT(*) INTO cantidad
FROM EMPLAZAMIENTO
WHERE ID_EMPLAZAMIENTO = e_id_emplazamiento;

IF (cantidad<>0) THEN salida := FALSE;

END IF;

PRINTR(nombre_prueba, salida, salidaEsperada);


EXCEPTION WHEN OTHERS THEN PRINTR(nombre_prueba, FALSE, salidaEsperada);


ROLLBACK;

END eliminar;

END PRUEBAS_EMPLAZAMIENTO;

/ --de producto

CREATE OR REPLACE PACKAGE BODY PRUEBAS_PRODUCTO AS PROCEDURE inicializar AS BEGIN
DELETE
FROM PRODUCTO; END inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2, i_nombre VARCHAR2, i_descripcion VARCHAR2, i_categoria VARCHAR2, i_precioProducto INT, i_iva INT, salidaEsperada BOOLEAN) AS salida BOOLEAN := TRUE;

actual producto%ROWTYPE;

w_ID_Producto INT;

BEGIN
INSERT INTO producto
VALUES(NULL,
       i_nombre,
       i_descripcion,
       i_categoria,
       i_precioProducto,
       i_iva);

w_ID_Producto := S_ID_Producto.currval;


SELECT * INTO actual
FROM PRODUCTO
WHERE ID_Producto = w_ID_Producto;

IF (actual.nombre<>i_nombre)
OR (actual.descripcion<>i_descripcion)
OR (actual.categoria<>i_categoria)
OR (actual.precioProducto<>i_precioProducto)
OR (actual.iva<>i_iva)THEN salida := FALSE;

END IF;

PRINTR(nombre_prueba, salida, salidaEsperada);


EXCEPTION WHEN OTHERS THEN PRINTR(nombre_prueba, FALSE, salidaEsperada);


ROLLBACK;

END insertar;

PROCEDURE actualizar (nombre_prueba VARCHAR2, a_id_producto INT , a_descripcion VARCHAR2, a_precioProducto INT, a_iva INT, salidaEsperada BOOLEAN)AS salida BOOLEAN := TRUE;

actual producto%ROWTYPE;

BEGIN
UPDATE producto
SET DESCRIPCION = a_descripcion,
    PRECIOPRODUCTO = a_precioProducto,
    IVA = a_iva
WHERE ID_Producto = a_id_producto;


SELECT * INTO actual
FROM PRODUCTO
WHERE ID_Producto = a_id_producto;

IF (actual.descripcion<>a_descripcion)
OR (actual.precioProducto<>a_precioProducto)
OR (actual.iva<>a_iva) THEN salida := FALSE;

END IF;

PRINTR(nombre_prueba, salida, salidaEsperada);


EXCEPTION WHEN OTHERS THEN PRINTR(nombre_prueba, FALSE, salidaEsperada);


ROLLBACK;

END actualizar;

PROCEDURE eliminar (nombre_prueba VARCHAR2, e_id_producto INT, salidaEsperada BOOLEAN) AS salida BOOLEAN := TRUE;

cantidad INT;

BEGIN
DELETE
FROM PRODUCTO
WHERE ID_Producto = e_id_producto;


SELECT COUNT(*) INTO cantidad
FROM PRODUCTO
WHERE ID_Producto = e_id_producto;

IF (cantidad<>0) THEN salida := FALSE;

END IF;

PRINTR(nombre_prueba, salida, salidaEsperada);


EXCEPTION WHEN OTHERS THEN PRINTR(nombre_prueba, FALSE, salidaEsperada);


ROLLBACK;

END eliminar;

END PRUEBAS_PRODUCTO;

/ --de factura

CREATE OR REPLACE PACKAGE BODY PRUEBAS_FACTURA AS PROCEDURE inicializar AS BEGIN
DELETE
FROM FACTURA; END inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2, i_precioTotal INT, i_fechaDeExpedicion DATE, i_devuelto VARCHAR2, i_id_venta INT, i_id_emplazamiento INT, salidaEsperada BOOLEAN) AS salida BOOLEAN := TRUE;

actual factura%ROWTYPE;

w_ID_factura INT;

BEGIN
INSERT INTO factura
VALUES(NULL,
       i_precioTotal,
       i_fechaDeExpedicion,
       i_devuelto,
       i_id_venta,
       i_id_emplazamiento);

w_ID_factura := S_ID_Factura.currval;


SELECT * INTO actual
FROM factura
WHERE ID_factura = w_ID_factura;

IF (actual.precioTotal<>i_precioTotal)
OR (actual.fechaDeExpedicion<>i_fechaDeExpedicion)
OR (actual.devuelto<>i_devuelto)
OR (actual.id_venta<>i_id_venta)
OR (actual.id_emplazamiento<>i_id_emplazamiento)THEN salida := FALSE;

END IF;

PRINTR(nombre_prueba, salida, salidaEsperada);


EXCEPTION WHEN OTHERS THEN PRINTR(nombre_prueba, FALSE, salidaEsperada);


ROLLBACK;

END insertar;

PROCEDURE actualizar (nombre_prueba VARCHAR2, a_id_factura INT,a_devuelto VARCHAR2, salidaEsperada BOOLEAN)AS salida BOOLEAN := TRUE;

actual factura%ROWTYPE;

BEGIN
UPDATE factura
SET DEVUELTO = a_devuelto
WHERE ID_factura = a_id_factura;


SELECT * INTO actual
FROM factura
WHERE ID_factura = a_id_factura;

IF (actual.devuelto<>a_devuelto) THEN salida := FALSE;

END IF;

PRINTR(nombre_prueba, salida, salidaEsperada);


EXCEPTION WHEN OTHERS THEN PRINTR(nombre_prueba, FALSE, salidaEsperada);


ROLLBACK;

END actualizar;

PROCEDURE eliminar (nombre_prueba VARCHAR2, e_id_factura INT, salidaEsperada BOOLEAN) AS salida BOOLEAN := TRUE;

cantidad INT;

BEGIN
DELETE
FROM factura
WHERE ID_factura = e_id_factura;


SELECT COUNT(*) INTO cantidad
FROM factura
WHERE ID_factura = e_id_factura;

IF (cantidad<>0) THEN salida := FALSE;

END IF;

PRINTR(nombre_prueba, salida, salidaEsperada);


EXCEPTION WHEN OTHERS THEN PRINTR(nombre_prueba, FALSE, salidaEsperada);


ROLLBACK;

END eliminar;

END PRUEBAS_factura;

/ --de stock

CREATE OR REPLACE PACKAGE BODY PRUEBA_STOCK AS PROCEDURE inicializar AS BEGIN
DELETE
FROM stock; END inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2, i_id_emplazamiento INT, i_id_producto INT, i_cantidad INT, salidaEsperada BOOLEAN) AS salida BOOLEAN := TRUE;

actual stock%ROWTYPE;

BEGIN
INSERT INTO stock
VALUES(i_id_emplazamiento,
       i_id_producto,
       i_cantidad);


SELECT * INTO actual
FROM stock
WHERE ID_Emplazamiento = i_id_emplazamiento
    AND ID_Producto = i_id_producto;

IF (actual.id_emplazamiento<>i_id_emplazamiento)
OR (actual.id_producto<>i_id_producto)
OR (actual.cantidad<>i_cantidad) THEN salida := FALSE;

END IF;

PRINTR(nombre_prueba, salida, salidaEsperada);


EXCEPTION WHEN OTHERS THEN PRINTR(nombre_prueba, FALSE, salidaEsperada);


ROLLBACK;

END insertar;

PROCEDURE actualizar (nombre_prueba VARCHAR2, a_id_emplazamiento INT, a_id_producto INT, a_cantidad INT, salidaEsperada BOOLEAN) AS salida BOOLEAN := TRUE;

actual stock%ROWTYPE;

BEGIN
UPDATE stock
SET CANTIDAD = a_cantidad
WHERE ID_Emplazamiento = a_id_emplazamiento
    AND ID_Producto = a_id_producto;


SELECT * INTO actual
FROM stock
WHERE ID_Emplazamiento = a_id_emplazamiento
    AND ID_Producto = a_id_producto;

IF (actual.cantidad<>a_cantidad) THEN salida := FALSE;

END IF;

PRINTR(nombre_prueba, salida, salidaEsperada);


EXCEPTION WHEN OTHERS THEN PRINTR(nombre_prueba, FALSE, salidaEsperada);


ROLLBACK;

END actualizar;

PROCEDURE eliminar (nombre_prueba VARCHAR2, e_id_emplazamiento INT, e_id_producto INT, salidaEsperada BOOLEAN) AS salida BOOLEAN := TRUE;

cantidad INT;

BEGIN
DELETE
FROM stock
WHERE ID_Emplazamiento = e_id_emplazamiento
    AND ID_Producto = e_id_producto;


SELECT COUNT(*) INTO cantidad
FROM stock
WHERE ID_Emplazamiento = e_id_emplazamiento
    AND ID_Producto = e_id_producto;

IF (cantidad<>0) THEN salida := FALSE;

END IF;

PRINTR(nombre_prueba, salida, salidaEsperada);


EXCEPTION WHEN OTHERS THEN PRINTR(nombre_prueba, FALSE, salidaEsperada);


ROLLBACK;

END eliminar;

PROCEDURE stock_correcto (nombre_prueba VARCHAR2, e_id_emplazamiento INT, e_id_producto INT,stock_previo int, cantidad INT, salidaEsperada BOOLEAN) AS salida BOOLEAN := TRUE;

stock_nuevo int;

BEGIN
SELECT cantidad INTO stock_nuevo
FROM stock
WHERE id_emplazamiento = e_id_emplazamiento
    AND id_producto= e_id_producto;

if(stock_previo-cantidad)<> stock_nuevo THEN salida := FALSE;

END IF;

PRINTR(nombre_prueba, salida, salidaEsperada);


EXCEPTION WHEN OTHERS THEN PRINTR(nombre_prueba, FALSE, salidaEsperada);


ROLLBACK;

END stock_correcto;

PROCEDURE stock_correcto_p (nombre_prueba VARCHAR2, e_id_emplazamiento INT, e_id_producto INT,stock_previo int, cantidad INT, salidaEsperada BOOLEAN) AS salida BOOLEAN := TRUE;

stock_nuevo int;

BEGIN
SELECT cantidad INTO stock_nuevo
FROM stock
WHERE id_emplazamiento = e_id_emplazamiento
    AND id_producto= e_id_producto;

if(stock_previo+cantidad)<> stock_nuevo THEN salida := FALSE;

END IF;

PRINTR(nombre_prueba, salida, salidaEsperada);


EXCEPTION WHEN OTHERS THEN PRINTR(nombre_prueba, FALSE, salidaEsperada);


ROLLBACK;

END stock_correcto_p;

PROCEDURE stock_correcto_t (nombre_prueba VARCHAR2, e_id_emplazamiento_envia int, e_id_emplazamiento_recibe int, stock_previo_envia int, stock_previo_recibe int, cantidad int, e_id_producto int, salidaEsperada BOOLEAN) AS salida BOOLEAN := TRUE;

stock_nuevo_envia int;

stock_nuevo_recibe int;

BEGIN
SELECT cantidad INTO stock_nuevo_envia
FROM stock
WHERE id_emplazamiento = e_id_emplazamiento_envia
    AND id_producto = e_id_producto;


SELECT cantidad INTO stock_nuevo_recibe
FROM stock
WHERE id_emplazamiento = e_id_emplazamiento_recibe
    AND id_producto = e_id_producto;

if(stock_previo_envia-cantidad)<>stock_nuevo_envia
OR (stock_previo_recibe+cantidad)<>stock_nuevo_recibe THEN salida := FALSE;

END IF;

PRINTR(nombre_prueba, salida, salidaEsperada);


EXCEPTION WHEN OTHERS THEN PRINTR(nombre_prueba, FALSE, salidaEsperada);


ROLLBACK;

END stock_correcto_t;

END PRUEBA_STOCK;

/ --de venta

CREATE OR REPLACE PACKAGE BODY PRUEBAS_VENTA AS PROCEDURE inicializar AS BEGIN
DELETE
FROM VENTA; END inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2, i_precioventa number,i_fecha DATE, i_dni VARCHAR2, salidaEsperada BOOLEAN) AS salida BOOLEAN := TRUE;

actual venta%ROWTYPE;

w_ID_Venta INT;

BEGIN
INSERT INTO venta
VALUES(NULL,
       i_precioventa,
       i_fecha,
       i_dni);

w_ID_Venta := S_ID_Venta.currval;


SELECT * INTO actual
FROM venta
WHERE ID_Venta = w_ID_Venta;

IF (actual.PrecioTotal<>i_PrecioVenta)
OR (actual.fechaVenta<>i_fecha)
OR (actual.dni<>i_dni) THEN salida := FALSE;

END IF;

PRINTR(nombre_prueba, salida, salidaEsperada);


EXCEPTION WHEN OTHERS THEN PRINTR(nombre_prueba, FALSE, salidaEsperada);


ROLLBACK;

END insertar;

PROCEDURE eliminar (nombre_prueba VARCHAR2, e_id_venta INT, salidaEsperada BOOLEAN) AS salida BOOLEAN := TRUE;

cantidad INT;

BEGIN
DELETE
FROM venta
WHERE ID_Venta = e_id_venta;


SELECT COUNT(*) INTO cantidad
FROM venta
WHERE ID_Venta = e_id_venta;

IF (cantidad<>0) THEN salida := FALSE;

END IF;

PRINTR(nombre_prueba, salida, salidaEsperada);


EXCEPTION WHEN OTHERS THEN PRINTR(nombre_prueba, FALSE, salidaEsperada);


ROLLBACK;

END eliminar;

PROCEDURE descuento (nombre_prueba VARCHAR2, v_id_venta int,v_preciototal number,v_dni_socio varchar2, salidaEsperada BOOLEAN) AS salida BOOLEAN := TRUE;

p_preciototal number;

BEGIN
SELECT preciototal INTO p_preciototal
FROM venta
WHERE id_venta = v_id_venta;

IF (v_dni_socio<>NULL) THEN if(v_preciototal * 0.95 <> p_preciototal) THEN salida := FALSE;

END IF;

END IF;

printr(nombre_prueba, salida, salidaEsperada);


EXCEPTION WHEN OTHERS THEN PRINTR(nombre_prueba, FALSE, salidaEsperada);


ROLLBACK;

END descuento;

END PRUEBAS_VENTA;

/ --de pedido

CREATE OR REPLACE PACKAGE BODY PRUEBAS_PEDIDO AS PROCEDURE inicializar AS BEGIN
DELETE
FROM pedido; END inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2, i_fecha DATE, i_precio NUMBER, i_id_emplazamiento INT, i_cif VARCHAR2, salidaEsperada BOOLEAN) AS salida BOOLEAN := TRUE;

actual pedido%ROWTYPE;

w_ID_pedido INT;

BEGIN
INSERT INTO pedido
VALUES(NULL,
       i_fecha,
       i_precio,
       i_id_emplazamiento,
       i_cif);

w_ID_pedido := S_ID_Pedido.currval;


SELECT * INTO actual
FROM pedido
WHERE ID_Pedido = w_ID_pedido;

IF (actual.fechaPedido<>i_fecha)
OR (actual.precioTotal<>i_precio)
OR (actual.id_emplazamiento<>i_id_emplazamiento)
OR (actual.cif<>i_cif) THEN salida := FALSE;

END IF;

PRINTR(nombre_prueba, salida, salidaEsperada);


EXCEPTION WHEN OTHERS THEN PRINTR(nombre_prueba, FALSE, salidaEsperada);


ROLLBACK;

END insertar;

PROCEDURE eliminar (nombre_prueba VARCHAR2, e_id_pedido INT, salidaEsperada BOOLEAN) AS salida BOOLEAN := TRUE;

cantidad INT;

BEGIN
DELETE
FROM pedido
WHERE ID_Pedido = e_id_pedido;


SELECT COUNT(*) INTO cantidad
FROM pedido
WHERE ID_Pedido = e_id_pedido;

IF (cantidad<>0) THEN salida := FALSE;

END IF;

PRINTR(nombre_prueba, salida, salidaEsperada);


EXCEPTION WHEN OTHERS THEN PRINTR(nombre_prueba, FALSE, salidaEsperada);


ROLLBACK;

END eliminar;

END PRUEBAS_PEDIDO;

/ --de traspaso

CREATE OR REPLACE PACKAGE BODY PRUEBAS_TRASPASO AS PROCEDURE inicializar AS BEGIN
DELETE
FROM traspaso; END inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2, i_fechaTraspaso DATE, i_id_emplazamientoSalida INT, i_id_emplazamientoEntrada INT, salidaEsperada BOOLEAN) AS salida BOOLEAN := TRUE;

actual traspaso%ROWTYPE;

w_ID_traspaso INT;

BEGIN
INSERT INTO traspaso
VALUES(NULL,
       i_fechatraspaso,
       i_id_emplazamientoSalida,
       i_id_emplazamientoEntrada);

w_ID_traspaso := S_ID_traspaso.currval;


SELECT * INTO actual
FROM traspaso
WHERE ID_traspaso = w_ID_traspaso;

IF (actual.fechaTraspaso<>i_fechaTraspaso)
OR (actual.id_emplazamientoSalida<>i_id_emplazamientoSalida)
OR (actual.id_emplazamientoEntrada<>i_id_emplazamientoEntrada) THEN salida := FALSE;

END IF;

PRINTR(nombre_prueba, salida, salidaEsperada);


EXCEPTION WHEN OTHERS THEN PRINTR(nombre_prueba, FALSE, salidaEsperada);


ROLLBACK;

END insertar;

PROCEDURE eliminar (nombre_prueba VARCHAR2, e_id_Traspaso INT, salidaEsperada BOOLEAN) AS salida BOOLEAN := TRUE;

cantidad INT;

BEGIN
DELETE
FROM traspaso
WHERE ID_traspaso = e_id_traspaso;


SELECT COUNT(*) INTO cantidad
FROM traspaso
WHERE ID_traspaso = e_id_traspaso;

IF (cantidad<>0) THEN salida := FALSE;

END IF;

PRINTR(nombre_prueba, salida, salidaEsperada);


EXCEPTION WHEN OTHERS THEN PRINTR(nombre_prueba, FALSE, salidaEsperada);


ROLLBACK;

END eliminar;

END PRUEBAS_TRASPASO;

/ --de solicitud

CREATE OR REPLACE PACKAGE BODY PRUEBAS_Solicitud_Traspaso AS PROCEDURE inicializar AS BEGIN
DELETE
FROM Solicitud_Traspaso; END inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2, i_fechaSolicitud DATE, i_id_emplazamientoSalida INT, i_id_emplazamientoEntrada INT, salidaEsperada BOOLEAN) AS salida BOOLEAN := TRUE;

actual Solicitud_Traspaso%ROWTYPE;

w_ID_Solicitud INT;

BEGIN
INSERT INTO Solicitud_Traspaso
VALUES(NULL,
       i_fechaSolicitud,
       i_id_emplazamientoSalida,
       i_id_emplazamientoEntrada);

w_ID_Solicitud := S_ID_Solicitud.currval;


SELECT * INTO actual
FROM Solicitud_Traspaso
WHERE ID_Solicitud = w_ID_Solicitud;

IF (actual.fechaSolicitud<>i_fechaSolicitud)
OR (actual.id_emplazamientoSalida<>i_id_emplazamientoSalida)
OR (actual.id_emplazamientoEntrada<>i_id_emplazamientoEntrada) THEN salida := FALSE;

END IF;

PRINTR(nombre_prueba, salida, salidaEsperada);


EXCEPTION WHEN OTHERS THEN PRINTR(nombre_prueba, FALSE, salidaEsperada);


ROLLBACK;

END insertar;

PROCEDURE eliminar (nombre_prueba VARCHAR2, e_id_solicitudTraspaso INT, salidaEsperada BOOLEAN) AS salida BOOLEAN := TRUE;

cantidad INT;

BEGIN
DELETE
FROM Solicitud_Traspaso
WHERE ID_Solicitud = e_id_solicitudTraspaso;


SELECT COUNT(*) INTO cantidad
FROM Solicitud_Traspaso
WHERE ID_Solicitud = e_id_solicitudTraspaso;

IF (cantidad<>0) THEN salida := FALSE;

END IF;

PRINTR(nombre_prueba, salida, salidaEsperada);


EXCEPTION WHEN OTHERS THEN PRINTR(nombre_prueba, FALSE, salidaEsperada);


ROLLBACK;

END eliminar;

END PRUEBAS_Solicitud_Traspaso;

/ --de Albaran

CREATE OR REPLACE PACKAGE BODY PRUEBAS_Albaran AS PROCEDURE inicializar AS BEGIN
DELETE
FROM Albaran; END inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2, i_fecha DATE, i_precio NUMBER, i_id_pedido INT, salidaEsperada BOOLEAN) AS salida BOOLEAN := TRUE;

actual Albaran%ROWTYPE;

w_ID_Albaran INT;

BEGIN
INSERT INTO Albaran
VALUES(NULL,
       i_fecha,
       i_precio,
       i_id_pedido);

w_ID_Albaran := S_ID_Albaran.currval;


SELECT * INTO actual
FROM Albaran
WHERE ID_Albaran = w_ID_Albaran;

IF (actual.fechaFirma<>i_fecha)
OR (actual.id_pedido<>i_id_pedido) THEN salida := FALSE;

END IF;

PRINTR(nombre_prueba, salida, salidaEsperada);


EXCEPTION WHEN OTHERS THEN PRINTR(nombre_prueba, FALSE, salidaEsperada);


ROLLBACK;

END insertar;

PROCEDURE eliminar (nombre_prueba VARCHAR2, e_id_albaran INT, salidaEsperada BOOLEAN) AS salida BOOLEAN := TRUE;

cantidad INT;

BEGIN
DELETE
FROM Albaran
WHERE ID_Albaran = e_id_albaran;


SELECT COUNT(*) INTO cantidad
FROM Albaran
WHERE ID_Albaran = e_id_albaran;

IF (cantidad<>0) THEN salida := FALSE;

END IF;

PRINTR(nombre_prueba, salida, salidaEsperada);


EXCEPTION WHEN OTHERS THEN PRINTR(nombre_prueba, FALSE, salidaEsperada);


ROLLBACK;

END eliminar;

END PRUEBAS_Albaran;

/ --de A_producto_traspaso

CREATE OR REPLACE PACKAGE BODY PRUEBAS_A_PRODUCTO_TRASPASO AS PROCEDURE inicializar AS BEGIN
DELETE
FROM asociacion_Producto_traspaso; END inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2, i_id_producto INT, i_id_Traspaso INT, i_cantidad NUMBER, salidaEsperada BOOLEAN) AS salida BOOLEAN := TRUE;

actual asociacion_Producto_traspaso%ROWTYPE;

BEGIN
INSERT INTO asociacion_Producto_traspaso
VALUES(i_id_Traspaso,
       i_id_producto,
       i_cantidad);


SELECT * INTO actual
FROM asociacion_Producto_traspaso
WHERE ID_Producto = i_id_producto
    AND ID_Traspaso = i_id_Traspaso;

IF (actual.id_producto<>i_id_producto)
OR (actual.id_Traspaso<>i_id_Traspaso)
OR (actual.cantidad<>i_cantidad) THEN salida := FALSE;

END IF;

PRINTR(nombre_prueba, salida, salidaEsperada);


EXCEPTION WHEN OTHERS THEN PRINTR(nombre_prueba, FALSE, salidaEsperada);


ROLLBACK;

END insertar;

PROCEDURE eliminar (nombre_prueba VARCHAR2, e_id_Traspaso INT, e_id_producto INT, salidaEsperada BOOLEAN) AS salida BOOLEAN := TRUE;

cantidad INT;

BEGIN
DELETE
FROM asociacion_Producto_traspaso
WHERE ID_Producto = e_id_producto
    AND ID_Traspaso = e_id_Traspaso;


SELECT COUNT(*) INTO cantidad
FROM asociacion_Producto_traspaso
WHERE ID_Producto = e_id_producto
    AND ID_Traspaso = e_id_Traspaso;

IF (cantidad<>0) THEN salida := FALSE;

END IF;

PRINTR(nombre_prueba, salida, salidaEsperada);


EXCEPTION WHEN OTHERS THEN PRINTR(nombre_prueba, FALSE, salidaEsperada);


ROLLBACK;

END eliminar;

END PRUEBAS_A_PRODUCTO_TRASPASO;

/ --de A_producto_solicitud

CREATE OR REPLACE PACKAGE BODY PRUEBAS_A_PRODUCTO_SOLICITUD AS PROCEDURE inicializar AS BEGIN
DELETE
FROM asociacion_Producto_Solicitud; END inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2,i_id_producto INT, i_id_Solicitud INT, i_cantidad NUMBER, salidaEsperada BOOLEAN) AS salida BOOLEAN := TRUE;

actual asociacion_Producto_Solicitud%ROWTYPE;

BEGIN
INSERT INTO asociacion_Producto_Solicitud
VALUES(i_id_Solicitud,
       i_id_producto,
       i_cantidad);


SELECT * INTO actual
FROM asociacion_Producto_Solicitud
WHERE ID_Producto = i_id_producto
    AND ID_Solicitud = i_id_Solicitud;

IF (actual.id_producto<>i_id_producto)
OR (actual.id_Solicitud<>i_id_Solicitud)
OR (actual.cantidad<>i_cantidad) THEN salida := FALSE;

END IF;

PRINTR(nombre_prueba, salida, salidaEsperada);


EXCEPTION WHEN OTHERS THEN PRINTR(nombre_prueba, FALSE, salidaEsperada);


ROLLBACK;

END insertar;

PROCEDURE eliminar (nombre_prueba VARCHAR2, e_id_Solicitud INT, e_id_producto INT, salidaEsperada BOOLEAN) AS salida BOOLEAN := TRUE;

cantidad INT;

BEGIN
DELETE
FROM asociacion_Producto_Solicitud
WHERE ID_Producto = e_id_producto
    AND ID_Solicitud = e_id_Solicitud;


SELECT COUNT(*) INTO cantidad
FROM asociacion_Producto_Solicitud
WHERE ID_Producto = e_id_producto
    AND ID_Solicitud = e_id_Solicitud;

IF (cantidad<>0) THEN salida := FALSE;

END IF;

PRINTR(nombre_prueba, salida, salidaEsperada);


EXCEPTION WHEN OTHERS THEN PRINTR(nombre_prueba, FALSE, salidaEsperada);


ROLLBACK;

END eliminar;

END PRUEBAS_A_PRODUCTO_SOLICITUD;

/ --de A_pedido_producto

CREATE OR REPLACE PACKAGE BODY PRUEBAS_A_PEDIDO_PRODUCTO AS PROCEDURE inicializar AS BEGIN
DELETE
FROM asociacion_Pedido_Producto; END inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2, i_id_pedido INT, i_id_producto INT, i_cantidad NUMBER, i_precioCompra INT, i_iva INT, i_precioLinea INT, salidaEsperada BOOLEAN) AS salida BOOLEAN := TRUE;

actual asociacion_Pedido_Producto%ROWTYPE;

BEGIN
INSERT INTO asociacion_Pedido_Producto
VALUES(i_id_pedido,
       i_id_producto,
       i_cantidad,
       i_precioCompra,
       i_iva,
       i_precioLinea);


SELECT * INTO actual
FROM asociacion_Pedido_Producto
WHERE ID_pedido = i_id_pedido
    AND ID_producto = i_id_producto;

IF (actual.id_pedido<>i_id_pedido)
OR (actual.id_producto<>i_id_producto)
OR (actual.cantidad<>i_cantidad)
OR (actual.precioCompra<>i_precioCompra)
OR (actual.iva<>i_iva) THEN salida := FALSE;

END IF;

PRINTR(nombre_prueba, salida, salidaEsperada);


EXCEPTION WHEN OTHERS THEN PRINTR(nombre_prueba, FALSE, salidaEsperada);


ROLLBACK;

END insertar;

PROCEDURE eliminar (nombre_prueba VARCHAR2, e_id_pedido INT, e_id_producto INT, salidaEsperada BOOLEAN) AS salida BOOLEAN := TRUE;

cantidad INT;

BEGIN
DELETE
FROM asociacion_Pedido_Producto
WHERE ID_pedido = e_id_pedido
    AND ID_producto = e_id_producto;


SELECT COUNT(*) INTO cantidad
FROM asociacion_Pedido_Producto
WHERE ID_pedido = e_id_pedido
    AND ID_producto = e_id_producto;

IF (cantidad<>0) THEN salida := FALSE;

END IF;

PRINTR(nombre_prueba, salida, salidaEsperada);


EXCEPTION WHEN OTHERS THEN PRINTR(nombre_prueba, FALSE, salidaEsperada);


ROLLBACK;

END eliminar;

END PRUEBAS_A_PEDIDO_PRODUCTO;

/ --de A_venta_producto

CREATE OR REPLACE PACKAGE BODY PRUEBAS_A_VENTA_PRODUCTO AS PROCEDURE inicializar AS BEGIN
DELETE
FROM asociacion_Venta_Producto; END inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2, i_id_venta INT, i_id_producto INT, i_cantidad NUMBER, i_precioVenta NUMBER, i_ivaVenta NUMBER, i_precioLinea NUMBER, salidaEsperada BOOLEAN) AS salida BOOLEAN := TRUE;

actual asociacion_Venta_Producto%ROWTYPE;

BEGIN
INSERT INTO asociacion_Venta_Producto
VALUES(i_id_venta,
       i_id_producto,
       i_cantidad,
       i_precioVenta,
       i_ivaVenta,
       i_precioLinea);


SELECT * INTO actual
FROM asociacion_Venta_Producto
WHERE ID_Venta = i_id_venta
    AND ID_producto = i_id_producto;

IF (actual.id_Venta<>i_id_Venta)
OR (actual.id_producto<>i_id_producto)
OR (actual.cantidad<>i_cantidad)
OR (actual.precioVenta<>i_precioVenta)
OR (actual.ivaVenta<>i_ivaVenta)
OR (actual.precioLinea<>i_precioLinea) THEN salida := FALSE;

END IF;

PRINTR(nombre_prueba, salida, salidaEsperada);


EXCEPTION WHEN OTHERS THEN PRINTR(nombre_prueba, FALSE, salidaEsperada);


ROLLBACK;

END insertar;

PROCEDURE eliminar (nombre_prueba VARCHAR2, e_id_venta INT, e_id_producto INT, salidaEsperada BOOLEAN) AS salida BOOLEAN := TRUE;

cantidad INT;

BEGIN
DELETE
FROM asociacion_Venta_Producto
WHERE ID_Venta = e_id_venta
    AND ID_producto = e_id_producto;


SELECT COUNT(*) INTO cantidad
FROM asociacion_Venta_Producto
WHERE ID_Venta = e_id_venta
    AND ID_producto = e_id_producto;

IF (cantidad<>0) THEN salida := FALSE;

END IF;

PRINTR(nombre_prueba, salida, salidaEsperada);


EXCEPTION WHEN OTHERS THEN PRINTR(nombre_prueba, FALSE, salidaEsperada);


ROLLBACK;

END eliminar;

END PRUEBAS_A_VENTA_PRODUCTO;

/ /* EXECUTE DE PRUEBAS */ -- InicializaciÃ³n
EXECUTE pruebas_albaran.inicializar();

EXECUTE PRUEBAS_A_PRODUCTO_TRASPASO.inicializar();

EXECUTE PRUEBAS_A_PRODUCTO_SOLICITUD.inicializar();

EXECUTE PRUEBAS_A_PEDIDO_PRODUCTO.inicializar();

EXECUTE PRUEBAS_A_VENTA_PRODUCTO.inicializar();

EXECUTE PRUEBAS_FACTURA.inicializar();

EXECUTE pruebas_venta.inicializar();

EXECUTE pruebas_pedido.inicializar();

EXECUTE pruebas_proveedor.inicializar();

EXECUTE PRUEBA_STOCK.inicializar();

EXECUTE pruebas_producto.inicializar();

EXECUTE PRUEBAS_TRASPASO.inicializar();

EXECUTE PRUEBAS_SOLICITUD_TRASPASO.inicializar();

EXECUTE PRUEBAS_SOCIO.inicializar();

EXECUTE pruebas_emplazamiento.inicializar();

--BASICAS SOCIO
EXECUTE PRUEBAS_SOCIO.inicializar();

EXECUTE PRUEBAS_SOCIO.insertar('Socio Insertar', 'Daniel', 'Gonzalez', '54148787G', 'Avenida del pepinillo', TO_DATE('10102015','DDMMYYYY'), 'dani@us.es', TRUE);

EXECUTE PRUEBAS_SOCIO.insertar('Socio Insertar', 'JosÃ© Luis', 'MÃ¡rmol Romero', '29613400A', 'Calle Virgen', TO_DATE('10101996','DDMMYYYY'), 'jlmr@us.es', TRUE);

EXECUTE PRUEBAS_SOCIO.actualizar('Socio Actualizar', '54148787G', 'Avenida del pepinillo234', 'dani@us.es', TRUE);

EXECUTE PRUEBAS_SOCIO.eliminar('Socio Eliminar', '54148787G', TRUE);

--BASICAS PROVEEDOR
EXECUTE PRUEBAS_PROVEEDOR.inicializar();

EXECUTE PRUEBAS_PROVEEDOR.insertar('Proveedor Insertar', 'B54120214', 'Pimex', 954852320, 'pimex@pi.es', TRUE);

EXECUTE PRUEBAS_PROVEEDOR.insertar('Proveedor Insertar', 'B54129999', 'Pimex34', 954896666, 'pimex34@pi.es', TRUE);

EXECUTE PRUEBAS_PROVEEDOR.actualizar('Proveedor Actualizar', 'B54120214', 'Piexs', 111111111, 'a@pi.es', TRUE);

EXECUTE PRUEBAS_PROVEEDOR.eliminar('Proveedor Eliminar', 'B54120214', TRUE);

--BASICAS PRODUCTO
EXECUTE PRUEBAS_PRODUCTO.inicializar();

EXECUTE PRUEBAS_PRODUCTO.insertar('Producto insercion','zapatos cutres','unos zaparos cutres pero calentitos','Calzado',12.5,21,TRUE);

EXECUTE PRUEBAS_PRODUCTO.insertar('Producto insercion','ID producto 1+ que zapatos','ya lo harÃ¡ jesÃºs1','Calzado',5.95,21,TRUE);

EXECUTE PRUEBAS_PRODUCTO.insertar('Producto insercion','ID producto 2+ que zapatos','ya lo harÃ¡ jesÃºs2','Calzado',6.95,21,TRUE);

EXECUTE PRUEBAS_PRODUCTO.insertar('Producto insercion','ID producto 2+ que zapatos','ya lo harÃ¡ jesÃºs3','Calzado',7.95,21,TRUE);

EXECUTE PRUEBAS_PRODUCTO.insertar('Producto insercion','chupa de cuero','gran imitacion de la chupa de han solo','Calzado',500,21,TRUE);

EXECUTE PRUEBAS_PRODUCTO.insertar('Producto insercion','Chaleco de lana','por una gran diseÃ±adora','Jerseys',46.95,21,TRUE);

EXECUTE PRUEBAS_PRODUCTO.insertar('Producto insercion','sobrero de paja','el gran sombrero de mugiwara','Accesorios',20,21,TRUE);

EXECUTE PRUEBAS_PRODUCTO.actualizar('Producto actualizacion',S_ID_Producto.currval-2,'unos zaparos cutres pero calentitos, PD tienen un boquete D:',10.5,21,TRUE);

EXECUTE PRUEBAS_PRODUCTO.eliminar('Producto elminar',S_ID_Producto.currval,TRUE);

--BASICAS EMPLAZAMIENTO
EXECUTE PRUEBAS_EMPLAZAMIENTO.inicializar();

EXECUTE PRUEBAS_EMPLAZAMIENTO.insertar('Insercion', 'Calle de la piruleta', 954147741,'TIENDA', TRUE);

EXECUTE PRUEBAS_EMPLAZAMIENTO.insertar('Insercion', 'Avenida Reina Mercedes', 958632147,'TIENDA', TRUE);

EXECUTE PRUEBAS_EMPLAZAMIENTO.insertar('Insercion', 'Calle de la piruleta 24', 958632147,'TIENDA', TRUE);

EXECUTE PRUEBAS_EMPLAZAMIENTO.insertar('Insercion', 'Calle de la piruleta 25', 958632666,'ALMACEN', TRUE);

EXECUTE PRUEBAS_EMPLAZAMIENTO.actualizar('Actualizacion',S_ID_Emplazamiento.currval-2,'Avenida del pepinillo2', 954147871, TRUE);

EXECUTE PRUEBAS_EMPLAZAMIENTO.eliminar('Eliminar', S_ID_Emplazamiento.currval, TRUE);

--BASICAS STOCK
EXECUTE PRUEBA_STOCK.inicializar();

EXECUTE PRUEBA_STOCK.insertar('Stock insercion',S_ID_Emplazamiento.currval-2,S_ID_Producto.currval -1,10,TRUE);

EXECUTE PRUEBA_STOCK.insertar('Stock insercion',S_ID_Emplazamiento.currval-2,S_ID_Producto.currval -2,20,TRUE);

EXECUTE PRUEBA_STOCK.insertar('Stock insercion',S_ID_Emplazamiento.currval-2,S_ID_Producto.currval -3,30,TRUE);

EXECUTE PRUEBA_STOCK.insertar('Stock insercion',S_ID_Emplazamiento.currval-1,S_ID_Producto.currval -1,11,TRUE);

EXECUTE PRUEBA_STOCK.insertar('Stock insercion',S_ID_Emplazamiento.currval-1,S_ID_Producto.currval -2,22,TRUE);

EXECUTE PRUEBA_STOCK.insertar('Stock insercion',S_ID_Emplazamiento.currval-1,S_ID_Producto.currval -3,33,TRUE);

EXECUTE PRUEBA_STOCK.actualizar('Stock actualizacion',S_ID_Emplazamiento.currval-2,S_ID_Producto.currval -2,30,TRUE);

EXECUTE PRUEBA_STOCK.eliminar('Stock eliminar',S_ID_Emplazamiento.currval-2,S_ID_Producto.currval-3,TRUE);

-- Basicas venta
EXECUTE pruebas_venta.inicializar();

EXECUTE pruebas_venta.insertar('Venta inserciÃ³n',0,sysdate,'29613400A',TRUE);

EXECUTE pruebas_venta.insertar('Venta inserciÃ³n',0,sysdate,NULL,TRUE);

EXECUTE pruebas_venta.insertar('Venta inserciÃ³n',0,sysdate,NULL,TRUE);

EXECUTE pruebas_venta.eliminar('Venta eliminar',S_ID_venta.currval,TRUE);

-- Basicas asoc_venta_producto
EXECUTE PRUEBAS_A_VENTA_PRODUCTO.inicializar();

EXECUTE PRUEBAS_A_VENTA_PRODUCTO.insertar('Venta-Producto inserciÃ³n',s_id_venta.currval-1,s_id_producto.currval-2,3,10.5,21,31.5,TRUE);

EXECUTE Pruebas_A_venta_producto.insertar('Venta-Producto inserciÃ³n',s_id_venta.currval-1,s_id_producto.currval-1,2,46.95,21,93.9,TRUE);

EXECUTE PRUEBAS_A_VENTA_PRODUCTO.insertar('Venta-Producto inserciÃ³n',s_id_venta.currval-2,s_id_producto.currval-2,3,10.5,21,31.5,TRUE);

EXECUTE Pruebas_A_venta_producto.insertar('Venta-Producto inserciÃ³n',s_id_venta.currval-2,s_id_producto.currval-1,2,46.95,21,93.9,TRUE);

EXECUTE PRUEBAS_factura.inicializar();

EXECUTE Pruebas_factura.insertar('Factura inserciÃ³n',119.13,sysdate,'F',s_id_venta.currval-2,S_ID_Emplazamiento.currval-1,TRUE);

EXECUTE Pruebas_factura.insertar('Factura inserciÃ³n',125.4,sysdate,'F',s_id_venta.currval-1,S_ID_Emplazamiento.currval-2,TRUE);

EXECUTE Pruebas_factura.actualizar('Factura actualizar',s_id_factura.currval,'T',TRUE);

EXECUTE Pruebas_venta.descuento('Descuento factura-venta',s_id_venta.currval-2,125.4,'29613400A',TRUE);

EXECUTE Pruebas_venta.descuento('Descuento factura-venta',s_id_venta.currval-1,125.4,NULL,TRUE);

EXECUTE Prueba_stock.stock_correcto('Actualizacion de stock tras venta',s_id_emplazamiento.currval-1,s_id_producto.currval-2,22,3,TRUE);

EXECUTE Prueba_stock.stock_correcto('Actualizacion de stock tras venta',s_id_emplazamiento.currval-1,s_id_producto.currval-2,21,3,FALSE);

EXECUTE Prueba_stock.stock_correcto('Actualizacion de stock tras venta',s_id_emplazamiento.currval-1,s_id_producto.currval-1,11,2,TRUE);

--BASICAS PEDIDO
EXECUTE PRUEBAS_PEDIDO.inicializar();

EXECUTE PRUEBAS_PEDIDO.insertar('Pedido inserciÃ³n',sysdate,0,S_ID_Emplazamiento.currval-1,'B54129999',TRUE);

EXECUTE PRUEBAS_PEDIDO.insertar('Pedido inserciÃ³n',sysdate,0,S_ID_Emplazamiento.currval-2,'B54129999',TRUE);

EXECUTE PRUEBAS_PEDIDO.insertar('Pedido inserciÃ³n',sysdate,0,S_ID_Emplazamiento.currval-2,'B54129999',TRUE);

EXECUTE PRUEBAS_PEDIDO.eliminar('Pedido eliminar',S_ID_Pedido.currval,TRUE);

--BASICA PEDIDO_PRODUCTO
EXECUTE PRUEBAS_A_PEDIDO_PRODUCTO.inicializar();

EXECUTE PRUEBAS_A_PEDIDO_PRODUCTO.insertar('PEDIDO_PRODUCTO inserciÃ³n',S_ID_Pedido.currval-1,s_id_producto.currval-1,21,10.5,21,220.5,TRUE);

EXECUTE PRUEBAS_A_PEDIDO_PRODUCTO.insertar('PEDIDO_PRODUCTO inserciÃ³n',S_ID_Pedido.currval-2,s_id_producto.currval-1,22,46.95,21,0,TRUE);

EXECUTE PRUEBAS_A_PEDIDO_PRODUCTO.insertar('PEDIDO_PRODUCTO inserciÃ³n',S_ID_Pedido.currval-1,s_id_producto.currval-2,22,46.95,21,0,TRUE);

--BASICA ALBARAN
 EXECUTE PRUEBAS_ALBARAN.inicializar();

EXECUTE PRUEBAS_ALBARAN.insertar('Albaran inserciÃ³n',sysdate,0,S_ID_Pedido.currval-1,TRUE);

EXECUTE PRUEBA_STOCK.stock_correcto_p('Actualizacion de stock tras comprar',s_ID_emplazamiento.currval-2,s_ID_producto.currval-1,8,21,TRUE);

EXECUTE PRUEBA_STOCK.stock_correcto_p('Actualizacion de stock tras comprar',s_ID_emplazamiento.currval-2,s_ID_producto.currval-1,8,15,FALSE);

EXECUTE PRUEBAS_ALBARAN.insertar('Albaran inserciÃ³n',sysdate,0,S_ID_Pedido.currval-2,TRUE);

EXECUTE PRUEBAS_ALBARAN.eliminar('Albaran eliminaxion',S_ID_Albaran.currval,TRUE);

--BASICAS SOLICITUD_TRASPASO
EXECUTE PRUEBAS_SOLICITUD_TRASPASO.inicializar();

EXECUTE PRUEBAS_SOLICITUD_TRASPASO.insertar('Solicitud traspaso Insertar', sysdate, S_ID_Emplazamiento.currval-1, S_ID_Emplazamiento.currval-2, TRUE);

EXECUTE PRUEBAS_SOLICITUD_TRASPASO.eliminar('Solicitud traspaso Eliminar', S_ID_Solicitud.currval, TRUE);

EXECUTE PRUEBAS_SOLICITUD_TRASPASO.insertar('Solicitud traspaso Insertar', sysdate, S_ID_Emplazamiento.currval-1, S_ID_Emplazamiento.currval-2, TRUE);

--BASICAS A_PRODUCTO_SOLICITUD
EXECUTE PRUEBAS_A_PRODUCTO_SOLICITUD.inicializar();

EXECUTE PRUEBAS_A_PRODUCTO_SOLICITUD.insertar('A-Producto-Solicitud Insertar', S_ID_Producto.currval-1, S_ID_Solicitud.currval, 3, TRUE);

EXECUTE PRUEBAS_A_PRODUCTO_SOLICITUD.eliminar('A-Producto-Solicitud Eliminar', S_ID_Solicitud.currval, S_ID_Producto.currval-1, TRUE);

--BASICAS TRASPASO
EXECUTE PRUEBAS_TRASPASO.inicializar();

EXECUTE PRUEBAS_TRASPASO.insertar('Traspaso insercion',sysdate,S_ID_Emplazamiento.currval-1, S_ID_Emplazamiento.currval-2,TRUE);

EXECUTE PRUEBAS_TRASPASO.insertar('Traspaso insercion',sysdate,S_ID_Emplazamiento.currval-1, S_ID_Emplazamiento.currval-3,TRUE);

EXECUTE PRUEBAS_TRASPASO.eliminar('Traspaso eliminar',S_ID_traspaso.currval,TRUE);

--BASICAS A_PRODUCTO_TRASPASO
EXECUTE PRUEBAS_A_PRODUCTO_TRASPASO.inicializar();

EXECUTE PRUEBAS_A_PRODUCTO_TRASPASO.insertar('A-Producto-Traspaso Insertar', S_ID_Producto.currval-1, S_ID_traspaso.currval-1, 4, TRUE);

EXECUTE PRUEBA_STOCK.STOCK_CORRECTO_T('Actualizaci�n de stock tras traspaso',s_ID_emplazamiento.currval-1, s_ID_emplazamiento.currval-2,31,29,4,s_ID_producto.currval-1,TRUE);

EXECUTE PRUEBAS_A_PRODUCTO_TRASPASO.eliminar('A-Producto-Traspaso Actualizar', S_ID_traspaso.currval-1, S_ID_Producto.currval-1, TRUE);

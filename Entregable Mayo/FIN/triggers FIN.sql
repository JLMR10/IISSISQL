/*TRIGGER*/ --trigger pedido minimo

CREATE OR REPLACE TRIGGER pedido_minimo
BEFORE
INSERT
OR
UPDATE ON ASOCIACION_PEDIDO_PRODUCTO
FOR EACH ROW BEGIN IF :NEW.cantidad < 20 THEN raise_application_error(-20600, :NEW.cantidad || 'No se pueden pedir menos de 20 unidades de un producto'); END IF; END;

/ --trigger descuento socio

CREATE OR REPLACE TRIGGER descuento_socio
BEFORE
INSERT ON factura
FOR EACH ROW DECLARE v_preciototal VENTA.PRECIOTOTAL%TYPE; v_DNI VENTA.dni%TYPE; BEGIN
SELECT preciototal INTO v_preciototal
FROM venta
WHERE id_Venta = :NEW.id_venta;
    SELECT dni INTO v_dni
FROM venta
WHERE id_venta = :NEW.id_Venta; IF v_DNI IS NOT NULL THEN
    UPDATE venta
    SET preciototal = v_preciototal * 0.95
    WHERE id_Venta = :NEW.id_venta; :New.preciototal := v_preciototal * 0.95; ELSE
        UPDATE venta
        SET preciototal = v_preciototal WHERE id_venta = :NEW.id_venta; END IF; END; / --stock minimo

CREATE OR REPLACE TRIGGER stock_minimo AFTER
INSERT
OR
UPDATE ON stock -- cuidado con lo de after

FOR EACH ROW BEGIN IF :NEW.cantidad <=0 THEN raise_application_error(-20601, :NEW.cantidad || 'No se puede realizar esta operaci�n'); END IF; END; / --stock minimo
 /*
-- devolucion
CREATE OR REPLACE TRIGGER DEVOLUCION
  BEFORE UPDATE ON FACTURA
  FOR EACH ROW
  DECLARE f_fecha venta.fechaventa%type;
  BEGIN
  select fechaventa into f_fecha from venta;
  IF ((sysdate+1) - f_fecha) > 30
  THEN raise_application_error(-20603,'La devoluci�n est� fuera de fecha, no se puede realizar');
  END IF;
END devolucion;
*/ --comprobar si se inicializa a 0 los pedisos y ventas

CREATE OR REPLACE TRIGGER Inicializa_nueva_Venta
BEFORE
INSERT ON VENTA
FOR EACH ROW BEGIN :NEW.PrecioTotal := 0; :NEW.FechaVenta := SYSDATE; END Comprueba_Venta; /
CREATE OR REPLACE TRIGGER Inicializa_nuevo_Pedido
BEFORE
INSERT ON PEDIDO
FOR EACH ROW BEGIN :NEW.PrecioTotal := 0; :NEW.FechaPedido := SYSDATE; END Comprueba_Pedido; /
CREATE OR REPLACE TRIGGER Inicializa_nueva_Factura
BEFORE
INSERT ON Factura
FOR EACH ROW BEGIN :NEW.FechaDeExpedicion := SYSDATE; END Inicializa_nueva_Factura; /
CREATE OR REPLACE TRIGGER modifica_stock_venta
BEFORE
INSERT ON FACTURA
FOR EACH ROW DECLARE e_ID_Emplazamiento Emplazamiento.ID_Emplazamiento%TYPE; v_ID_Venta Venta.ID_VENTA%TYPE;
CURSOR all_prods IS
SELECT id_venta,
       id_producto,
       cantidad
FROM ASOCIACION_VENTA_PRODUCTO
ORDER BY ID_producto; m_id_venta ASOCIACION_VENTA_PRODUCTO.id_venta%TYPE; m_id_producto Producto.id_producto%TYPE; m_cantidad ASOCIACION_VENTA_PRODUCTO.cantidad%TYPE; BEGIN
SELECT ID_Emplazamiento INTO e_ID_Emplazamiento
FROM Emplazamiento
WHERE ID_Emplazamiento = :NEW.ID_Emplazamiento;
    SELECT ID_Venta INTO v_ID_Venta
FROM Venta
WHERE ID_Venta = :New.ID_Venta; OPEN all_prods; LOOP FETCH all_prods INTO m_id_venta,
                                                                          m_id_producto,
                                                                          m_cantidad; EXIT WHEN all_prods%NOTFOUND; IF m_id_venta = v_id_Venta THEN
UPDATE stock
SET cantidad = cantidad-m_cantidad
WHERE id_emplazamiento = e_ID_Emplazamiento
    AND id_producto =m_ID_Producto; END IF; END LOOP; CLOSE all_prods; END modifica_stock_venta; /
CREATE OR REPLACE TRIGGER inicializa_preciolinea_alv
BEFORE
INSERT
OR
UPDATE ON ASOCIACION_VENTA_PRODUCTO
FOR EACH ROW BEGIN :NEW.preciolinea := :New.cantidad * :New.precioVenta; END inicializa_preciolinea_alv; /
CREATE OR REPLACE TRIGGER inicializa_preciototal_venta
BEFORE
INSERT
OR
UPDATE ON ASOCIACION_VENTA_PRODUCTO
FOR EACH ROW BEGIN
UPDATE venta
SET preciototal = PRECIOTOTAL + (:New.cantidad * :New.precioVenta)
WHERE id_venta = :New.id_venta; END inicializa_preciototal_venta; /
CREATE OR REPLACE TRIGGER modifica_stock_pedido
BEFORE
INSERT
OR
UPDATE ON ALBARAN
FOR EACH ROW DECLARE e_ID_Emplazamiento Emplazamiento.ID_Emplazamiento%TYPE; p_ID_PEDIDO PEDIDO.ID_PEDIDO%TYPE;
CURSOR all_prods IS
SELECT id_pedido,
       id_producto,
       cantidad
FROM ASOCIACION_PEDIDO_PRODUCTO
ORDER BY ID_producto; m_id_pedido ASOCIACION_PEDIDO_PRODUCTO.id_pedido%TYPE; m_id_producto Producto.id_producto%TYPE; m_cantidad ASOCIACION_PEDIDO_PRODUCTO.cantidad%TYPE; BEGIN
SELECT ID_Emplazamiento INTO e_ID_Emplazamiento
FROM pedido
WHERE ID_pedido = :NEW.ID_Pedido;
    SELECT ID_PEDIDO INTO p_id_pedido
FROM pedido
WHERE ID_pedido = :NEW.ID_Pedido; OPEN all_prods; LOOP FETCH all_prods INTO m_id_pedido,
                                                                            m_id_producto,
                                                                            m_cantidad; EXIT WHEN all_prods%NOTFOUND; IF m_id_pedido = p_id_pedido THEN
UPDATE stock
SET cantidad = cantidad+m_cantidad
WHERE id_emplazamiento = e_ID_Emplazamiento
    AND id_producto =m_ID_Producto; END IF; END LOOP; CLOSE all_prods; END modifica_stock_pedido; /
CREATE OR REPLACE TRIGGER modifica_stock_traspaso
BEFORE
INSERT
OR
UPDATE ON ASOCIACION_PRODUCTO_TRASPASO
FOR EACH ROW DECLARE e_ID_Emplazamiento_salida Emplazamiento.ID_Emplazamiento%TYPE; e_ID_Emplazamiento_entrada Emplazamiento.ID_Emplazamiento%TYPE; t_ID_traspaso traspaso.ID_traspaso%TYPE; BEGIN
SELECT ID_Emplazamientosalida INTO e_ID_Emplazamiento_salida
FROM traspaso
WHERE ID_traspaso = :NEW.ID_traspaso;
    SELECT ID_Emplazamientoentrada INTO e_ID_Emplazamiento_entrada
FROM traspaso
WHERE ID_traspaso = :NEW.ID_traspaso;
    SELECT ID_traspaso INTO t_id_traspaso
FROM traspaso
WHERE ID_traspaso = :NEW.ID_traspaso;
    UPDATE stock
    SET cantidad = (cantidad- :NEW.cantidad) WHERE id_emplazamiento = e_ID_Emplazamiento_salida
    AND id_producto = :NEW.id_producto;
    UPDATE stock
    SET cantidad = (cantidad+ :NEW.cantidad) WHERE id_emplazamiento = e_ID_Emplazamiento_entrada
    AND id_producto = :NEW.id_producto; END modifica_stock_traspaso; /
CREATE OR REPLACE TRIGGER Inicializa_Nuevo_Pedido
BEFORE
INSERT ON Pedido
FOR EACH ROW BEGIN :NEW.PrecioTotal := 0; :NEW.FechaPedido := SYSDATE; END Inicializa_Nuevo_Pedido; /
CREATE OR REPLACE TRIGGER Inicializa_Nueva_ST
BEFORE
INSERT ON Solicitud_Traspaso
FOR EACH ROW BEGIN :NEW.FechaSolicitud := SYSDATE; END Inicializa_Nueva_ST; /
CREATE OR REPLACE TRIGGER Inicializa_Nuevo_Traspaso
BEFORE
INSERT ON Traspaso
FOR EACH ROW BEGIN :NEW.FechaTraspaso := SYSDATE; END Inicializa_Nuevo_Traspaso; /
CREATE OR REPLACE TRIGGER solicitud_stock_minimo
BEFORE
INSERT ON asociacion_producto_solicitud
FOR EACH ROW DECLARE e_id_emplazamientoentrada SOLICITUD_TRASPASO.ID_EMPLAZAMIENTOENTRADA%TYPE; e_cantidad Stock.cantidad%TYPE; BEGIN
SELECT id_emplazamientoentrada INTO e_id_emplazamientoentrada
FROM solicitud_traspaso
WHERE id_solicitud = :NEW.id_solicitud;
    SELECT cantidad INTO e_cantidad
FROM stock
WHERE id_emplazamiento = e_id_emplazamientoentrada
    AND id_producto = :NEW.id_producto; IF (e_cantidad - :NEW.cantidad) <=5 THEN raise_application_error(-20601, :NEW.cantidad || 'No se permite la solicitud, el otro emplazamiento alcanzar� su stock m�nimo'); END IF; END; /
CREATE OR REPLACE TRIGGER inicializa_preciolinea_alp
BEFORE
INSERT
OR
UPDATE ON ASOCIACION_PEDIDO_PRODUCTO
FOR EACH ROW BEGIN :NEW.preciolinea := :New.cantidad * :New.preciocompra; END inicializa_preciolinea_alp; /
CREATE OR REPLACE TRIGGER inicializa_preciototal_albaran
BEFORE
INSERT
OR
UPDATE ON Albaran
FOR EACH ROW DECLARE p_preciototal pedido.preciototal%TYPE; BEGIN
SELECT preciototal INTO p_preciototal
FROM pedido
WHERE id_pedido = :New.id_pedido; :New.preciototal := p_preciototal; END inicializa_preciototal_albaran; /
CREATE OR REPLACE TRIGGER inicializa_preciototal_pedido
BEFORE
INSERT
OR
UPDATE ON ASOCIACION_pedido_producto
FOR EACH ROW BEGIN
UPDATE pedido
SET preciototal = PRECIOTOTAL + (:New.cantidad * :New.preciocompra)
WHERE id_pedido = :New.id_pedido; END inicializa_preciototal_pedido; /
CREATE OR REPLACE TRIGGER inicializa_precioventa_apv
BEFORE
INSERT ON asociacion_venta_producto
FOR EACH ROW DECLARE p_precio producto.precioproducto%TYPE; BEGIN
SELECT precioproducto INTO p_precio
FROM producto
WHERE id_producto = :New.id_producto; :NEW.precioventa := p_precio; END inicializa_precioventa_apv; /
CREATE OR REPLACE TRIGGER inicializa_IVA_apv
BEFORE
INSERT ON asociacion_venta_producto
FOR EACH ROW DECLARE p_IVA PRODUCTO.IVA%TYPE; BEGIN
SELECT Iva INTO p_IVA
FROM producto
WHERE id_producto = :New.id_producto; :NEW.IVAVENTA := p_IVA; END inicializa_IVA_apv; /
CREATE OR REPLACE TRIGGER inicializa_IVA_APP
BEFORE
INSERT ON asociacion_pedido_producto
FOR EACH ROW DECLARE p_IVA PRODUCTO.IVA%TYPE; BEGIN
SELECT IVA INTO p_IVA
FROM producto
WHERE id_producto = :New.id_producto; :NEW.IVA := p_IVA; END inicializa_IVA_APP; /

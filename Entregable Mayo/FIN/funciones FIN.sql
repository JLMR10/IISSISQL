/*FUNCIONES*/ --autocalculo precio de venta_producto

CREATE OR REPLACE FUNCTION precio_A_Venta_producto (f_ID_Venta IN ASOCIACION_VENTA_PRODUCTO.ID_Venta%TYPE, f_Cantidad IN ASOCIACION_VENTA_PRODUCTO.Cantidad%TYPE, f_PrecioVenta IN ASOCIACION_VENTA_PRODUCTO.PrecioVenta%TYPE) RETURN NUMBER IS f_PrecioLinea ASOCIACION_VENTA_PRODUCTO.PRECIOLINEA%TYPE;

BEGIN f_PrecioLinea := f_PrecioVenta * f_Cantidad;

RETURN(f_PrecioLinea);

END precio_A_Venta_producto;

/ --autocalculo de venta

CREATE OR REPLACE FUNCTION precio_Venta (f_ID_Venta IN VENTA.ID_Venta%TYPE) RETURN NUMBER IS f_PrecioTotal VENTA.PRECIOTOTAL%TYPE;

BEGIN
SELECT SUM(precioLinea) INTO f_PrecioTotal
FROM ASOCIACION_VENTA_PRODUCTO
WHERE ID_Venta = f_ID_Venta;

RETURN(f_PrecioTotal);

END precio_Venta;

/ --autocalculo pedido-producto

CREATE OR REPLACE FUNCTION precio_A_Pedido_producto (f_ID_Pedido IN ASOCIACION_PEDIDO_PRODUCTO.ID_Pedido%TYPE, f_Cantidad IN ASOCIACION_PEDIDO_PRODUCTO.Cantidad%TYPE, f_PrecioCompra IN ASOCIACION_PEDIDO_PRODUCTO.PrecioCompra%TYPE) RETURN NUMBER IS f_PrecioLinea ASOCIACION_PEDIDO_PRODUCTO.PrecioLinea%TYPE;

BEGIN f_PrecioLinea := f_PrecioCompra * f_Cantidad;

RETURN(f_PrecioLinea);

END precio_A_Pedido_producto;

/ --autocalculo pedido

CREATE OR REPLACE FUNCTION precio_Pedido (f_ID_Pedido IN PEDIDO.ID_Pedido%TYPE) RETURN NUMBER IS f_PrecioTotal PEDIDO.PRECIOTOTAL%TYPE;

BEGIN
SELECT SUM(PrecioLinea) INTO f_PrecioTotal
FROM ASOCIACION_PEDIDO_PRODUCTO
WHERE ID_Pedido = f_ID_Pedido;

RETURN(f_PrecioTotal);

END precio_Pedido;

/
CREATE OR REPLACE FUNCTION ganancias_mensuales(fechainicio IN factura.fechadeexpedicion%TYPE,fechafin IN factura.fechadeexpedicion%TYPE) RETURN number IS f_preciototal factura.preciototal%TYPE;

v_preciototal factura.preciototal%TYPE;

p_preciototal albaran.preciototal%TYPE;

BEGIN
SELECT sum(preciototal) INTO v_preciototal
FROM factura
WHERE fechadeexpedicion BETWEEN fechainicio AND fechafin;


SELECT sum(preciototal) INTO p_preciototal
FROM albaran
WHERE fechafirma BETWEEN fechainicio AND fechafin;

f_preciototal := v_preciototal - p_preciototal;

RETURN (f_preciototal);

END ganancias_mensuales;

/

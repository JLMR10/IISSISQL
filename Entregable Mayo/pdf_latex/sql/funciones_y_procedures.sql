CREATE OR REPLACE PROCEDURE Socio_Nuevo (
  p_Nombre IN SOCIO.Nombre%TYPE,
  p_Apellidos IN SOCIO.Apellidos%TYPE,
  p_Direccion IN SOCIO.Direccion%TYPE,
  p_FechaDeNacimiento IN SOCIO.FechaDeNacimiento%TYPE,
  p_Email IN SOCIO.Email%TYPE,
  p_DNI IN SOCIO.DNI%TYPE)
 IS BEGIN
  INSERT INTO SOCIO
  VALUES (p_Nombre, p_Apellidos, p_Direccion, p_FechaDeNacimiento,
          p_Email,p_DNI);
END Socio_Nuevo;

/

CREATE OR REPLACE PROCEDURE Producto_Nuevo(
  P_ID_Producto IN PRODUCTO.ID_Producto%TYPE,
  P_Nombre IN PRODUCTO.Nombre%TYPE,
  P_Descripcion IN PRODUCTO.Descripcion%TYPE,
  P_Categoria IN PRODUCTO.Categoria%TYPE,
  P_PrecioProducto IN PRODUCTO.PrecioProducto%TYPE,
  P_IVA IN PRODUCTO.IVA%TYPE)
  IS BEGIN
  INSERT INTO PRODUCTO
    VALUES(P_ID_Producto,P_Nombre,P_Descripcion,P_Categoria,
           P_PrecioProducto, P_IVA);
END Producto_Nuevo;

/

CREATE OR REPLACE PROCEDURE Stock_Nuevo (
    P_ID_Emplazamiento IN STOCK.ID_Emplazamiento%TYPE,
    P_ID_Producto IN STOCK.ID_Producto%TYPE,
    P_Cantidad IN STOCK.Cantidad%TYPE)
    IS BEGIN
    INSERT INTO STOCK
    VALUES (P_ID_Emplazamiento, P_ID_Producto, P_Cantidad);
END Stock_Nuevo;

/

CREATE OR REPLACE PROCEDURE PRODUCTO_TRASPASO_Nuevo (
    p_ID_Traspaso IN ASOCIACION_PRODUCTO_TRASPASO.ID_Traspaso%TYPE,
    p_ID_Producto IN ASOCIACION_PRODUCTO_TRASPASO.ID_Producto%TYPE,
    p_Cantidad IN ASOCIACION_PRODUCTO_TRASPASO.Cantidad%TYPE)
    IS BEGIN
    INSERT INTO ASOCIACION_PRODUCTO_TRASPASO
    VALUES(p_ID_Traspaso,p_ID_Producto,p_Cantidad);
END PRODUCTO_TRASPASO_Nuevo;

/

CREATE OR REPLACE PROCEDURE PRODUCTO_SOLICITUD_Nuevo (
    p_ID_Solicitud IN ASOCIACION_PRODUCTO_SOLICITUD.ID_Solicitud%TYPE,
    p_ID_Producto IN ASOCIACION_PRODUCTO_SOLICITUD.ID_Producto%TYPE,
    p_Cantidad IN ASOCIACION_PRODUCTO_SOLICITUD.Cantidad%TYPE)
    IS BEGIN
    INSERT INTO ASOCIACION_PRODUCTO_SOLICITUD
    VALUES(p_ID_Solicitud,p_ID_Producto,p_Cantidad);
END PRODUCTO_SOLICITUD_Nuevo;

/

CREATE OR REPLACE PROCEDURE TRASPASO_Nuevo (
    p_ID_Traspaso IN TRASPASO.ID_Traspaso%TYPE,
    p_FechaTraspaso IN TRASPASO.FechaTraspaso%TYPE,
    p_ID_EmplazamientoSalida IN TRASPASO.ID_EmplazamientoSalida%TYPE,
    p_ID_EmplazamientoEntrada IN TRASPASO.ID_EmplazamientoEntrada%TYPE)
    IS BEGIN
    INSERT INTO TRASPASO
    VALUES(p_ID_Traspaso, p_FechaTraspaso, p_ID_EmplazamientoSalida,
           p_ID_EmplazamientoEntrada);
END TRASPASO_Nuevo;

/

CREATE OR REPLACE PROCEDURE SOLICITUD_Nuevo (
    p_ID_Solicitud IN SOLICITUD_TRASPASO.ID_Solicitud%TYPE,
    p_FechaSolicitud IN SOLICITUD_TRASPASO.FechaSolicitud%TYPE,
    p_ID_EmplazamientoSalida IN SOLICITUD_TRASPASO.ID_EmplazamientoSalida%TYPE,
    p_ID_EmplazamientoEntrada IN SOLICITUD_TRASPASO.ID_EmplazamientoEntrada%TYPE)
    IS BEGIN
    INSERT INTO SOLICITUD_TRASPASO
    VALUES(p_ID_Solicitud, p_FechaSolicitud, p_ID_EmplazamientoSalida,
           p_ID_EmplazamientoEntrada);
END SOLICITUD_Nuevo;

/



CREATE OR REPLACE PROCEDURE Emplazamiento_Nuevo(
  P_ID_Emplazamiento IN EMPLAZAMIENTO.ID_Emplazamiento%TYPE,
  P_Direccion IN EMPLAZAMIENTO.Direccion%TYPE,
  P_Telefono IN EMPLAZAMIENTO.Telefono%TYPE,
  P_Tipo IN EMPLAZAMIENTO.Tipo%TYPE)
  IS BEGIN
  INSERT INTO EMPLAZAMIENTO
    VALUES(P_ID_Emplazamiento,P_Direccion,P_Telefono,P_Tipo);
END Emplazamiento_Nuevo;

/

CREATE OR REPLACE PROCEDURE Factura_Nueva(
    p_ID IN FACTURA.ID_FACTURA%TYPE,
    p_PrecioTotal IN FACTURA.PrecioTotal%TYPE,
    p_FechaDeExpedicion IN FACTURA.FechaDeExpedicion%TYPE,
    p_Devuelto IN FACTURA.Devuelto%TYPE,
    p_ID_Venta IN FACTURA.ID_Venta%TYPE,
    p_ID_Emplazamiento IN FACTURA.ID_Emplazamiento%TYPE
)
IS BEGIN
    INSERT INTO FACTURA VALUES(
        p_ID, p_PrecioTotal, p_FechaDeExpedicion, p_Devuelto, p_ID_Venta,
        p_ID_Emplazamiento);
END Factura_Nueva;

/

CREATE OR REPLACE PROCEDURE PROVEEDOR_Nuevo (
  p_CIF IN PROVEEDOR.CIF%TYPE,
  p_Nombre IN PROVEEDOR.Nombre%TYPE,
  p_Telefono IN PROVEEDOR.Telefono%TYPE,
  p_Email IN PROVEEDOR.Email%TYPE
  )IS BEGIN
  INSERT INTO PROVEEDOR
  VALUES (p_CIF, p_Nombre, p_Telefono, p_Email);
END PROVEEDOR_Nuevo;

/

CREATE OR REPLACE PROCEDURE ALBARAN_Nuevo (
  p_ID_Albaran IN ALBARAN.ID_Albaran%TYPE,
  p_FechaFirma IN ALBARAN.FechaFirma%TYPE,
  p_PrecioTotal IN ALBARAN.PrecioTotal%TYPE,
  p_ID_Pedido IN ALBARAN.ID_PEDIDO%TYPE
  )IS BEGIN
  INSERT INTO ALBARAN
  VALUES ( p_ID_Albaran, p_FechaFirma, p_PrecioTotal, p_ID_Pedido);
END ALBARAN_Nuevo;

/

CREATE OR REPLACE PROCEDURE PEDIDO_Nuevo (
  p_ID_Pedido IN PEDIDO.ID_Pedido%TYPE,
  p_FechaPedido IN PEDIDO.FechaPedido%TYPE,
  p_PrecioTotal IN PEDIDO.PrecioTotal%TYPE,
  p_ID_Emplazamiento IN PEDIDO.ID_Emplazamiento%TYPE,
  p_CIF IN PEDIDO.CIF%TYPE
  )IS BEGIN
  INSERT INTO PEDIDO
  VALUES ( p_ID_Pedido ,p_FechaPedido , p_PrecioTotal ,
           p_ID_Emplazamiento, p_CIF);
END PEDIDO_Nuevo;

/

CREATE OR REPLACE PROCEDURE PEDIDO_PRODUCTO_Nuevo (
    p_ID_Producto IN ASOCIACION_PEDIDO_PRODUCTO.ID_Producto%TYPE,
    p_ID_Pedido IN ASOCIACION_PEDIDO_PRODUCTO.ID_Pedido%TYPE,
    p_Cantidad IN ASOCIACION_PEDIDO_PRODUCTO.Cantidad%TYPE,
    p_PrecioCompra IN ASOCIACION_PEDIDO_PRODUCTO.PrecioCompra%TYPE,
    p_IVA IN ASOCIACION_PEDIDO_PRODUCTO.IVA%TYPE,
    p_PrecioLinea IN ASOCIACION_PEDIDO_PRODUCTO.preciolinea%TYPE)IS
    BEGIN

    INSERT INTO ASOCIACION_PEDIDO_PRODUCTO
    VALUES (p_ID_Producto, p_ID_Pedido , p_Cantidad , p_PrecioCompra,
            p_IVA, p_PrecioLinea);
END PEDIDO_PRODUCTO_Nuevo;

/


CREATE OR REPLACE PROCEDURE Venta_Nueva(
  P_ID_Venta IN VENTA.ID_Venta%TYPE,
  P_PrecioTotal IN VENTA.PrecioTotal%TYPE,
  P_FechaVenta IN VENTA.FechaVenta%TYPE,
  P_DNI IN VENTA.DNI%TYPE)
  IS BEGIN
  INSERT INTO VENTA
    VALUES(P_ID_Venta, P_PrecioTotal, P_FechaVenta, P_DNI);
END Venta_Nueva;

/

CREATE OR REPLACE PROCEDURE VENTA_PRODUCTO_Nueva(
    P_ID_Venta IN ASOCIACION_VENTA_PRODUCTO.ID_Venta%TYPE,
    P_ID_Producto IN ASOCIACION_VENTA_PRODUCTO.ID_Producto%TYPE,
    P_Cantidad IN ASOCIACION_VENTA_PRODUCTO.Cantidad%TYPE,
    P_PrecioVenta IN ASOCIACION_VENTA_PRODUCTO.PrecioVenta%TYPE,
    P_IvaVenta IN ASOCIACION_VENTA_PRODUCTO.IvaVenta%TYPE,
    P_PrecioLinea IN ASOCIACION_VENTA_PRODUCTO.PrecioLinea%TYPE
    )
    IS
    BEGIN
    INSERT INTO ASOCIACION_VENTA_PRODUCTO
        VALUES(P_ID_Venta, P_ID_Producto,P_Cantidad,P_PrecioVenta,P_IvaVenta,P_PrecioLinea);
END VENTA_PRODUCTO_Nueva;

/

CREATE OR REPLACE PROCEDURE MODIFICA_PROVEEDOR_NOMBRE
(p_CIF IN PROVEEDOR.CIF%TYPE,
p_Nombre IN PROVEEDOR.Nombre%TYPE) IS
BEGIN
UPDATE PROVEEDOR SET Nombre = p_Nombre WHERE p_CIF = CIF;
END MODIFICA_PROVEEDOR_NOMBRE;

/

CREATE OR REPLACE PROCEDURE MODIFICA_PROVEEDOR_Telefono
(p_CIF IN PROVEEDOR.CIF%TYPE,
p_Telefono IN PROVEEDOR.Telefono%TYPE) IS
BEGIN
UPDATE PROVEEDOR SET Telefono = p_Telefono WHERE p_CIF = CIF;
END MODIFICA_PROVEEDOR_Telefono;

/

CREATE OR REPLACE PROCEDURE MODIFICA_PROVEEDOR_EMAIL
(p_CIF IN PROVEEDOR.CIF%TYPE,
p_Email IN PROVEEDOR.Email%TYPE) IS
BEGIN
UPDATE PROVEEDOR SET Email = p_Email WHERE p_CIF = CIF;
END MODIFICA_PROVEEDOR_EMAIL;

/

CREATE OR REPLACE PROCEDURE MODIFICA_PRODUCTO_DESCRIPCION (
    p_ID_Producto IN PRODUCTO.ID_Producto%TYPE,
    p_Nombre IN PRODUCTO.Nombre%TYPE,
    p_Descripcion IN PRODUCTO.Descripcion%TYPE,
    p_Categoria IN PRODUCTO.Categoria%TYPE,
    p_PrecioProducto IN PRODUCTO.PrecioProducto%TYPE,
    p_IVA IN PRODUCTO.IVA%TYPE)
    IS BEGIN
    UPDATE PRODUCTO SET Descripcion = p_Descripcion WHERE p_ID_Producto = ID_Producto;
END MODIFICA_PRODUCTO_DESCRIPCION;

/

CREATE OR REPLACE PROCEDURE MODIFICA_PRODUCTO_PRECIO (
    p_ID_Producto IN PRODUCTO.ID_Producto%TYPE,
    p_Nombre IN PRODUCTO.Nombre%TYPE,
    p_Descripcion IN PRODUCTO.Descripcion%TYPE,
    p_Categoria IN PRODUCTO.Categoria%TYPE,
    p_PrecioProducto IN PRODUCTO.PrecioProducto%TYPE,
    p_IVA IN PRODUCTO.IVA%TYPE)
    IS BEGIN
    UPDATE PRODUCTO SET PrecioProducto = p_PrecioProducto WHERE p_ID_Producto = ID_Producto;
END MODIFICA_PRODUCTO_PRECIO;

/

CREATE OR REPLACE PROCEDURE MODIFICA_PRODUCTO_IVA (
    p_ID_Producto IN PRODUCTO.ID_Producto%TYPE,
    p_Nombre IN PRODUCTO.Nombre%TYPE,
    p_Descripcion IN PRODUCTO.Descripcion%TYPE,
    p_Categoria IN PRODUCTO.Categoria%TYPE,
    p_PrecioProducto IN PRODUCTO.PrecioProducto%TYPE,
    p_IVA IN PRODUCTO.IVA%TYPE)
    IS BEGIN
    UPDATE PRODUCTO SET IVA = p_IVA
    WHERE p_ID_Producto = ID_Producto;
END MODIFICA_PRODUCTO_IVA;

/

CREATE OR REPLACE PROCEDURE MODIFICA_STOCK_CANTIDAD
  (p_ID_Emplazamiento IN STOCK.ID_Emplazamiento%TYPE,
  p_ID_Producto IN STOCK.ID_Producto%TYPE,
  p_Cantidad IN STOCK.Cantidad%TYPE)
  IS BEGIN
  UPDATE STOCK SET Cantidad = p_Cantidad
  WHERE p_ID_Emplazamiento = ID_Emplazamiento AND p_ID_PRODUCTO = ID_PRODUCTO;
END MODIFICA_STOCK_CANTIDAD;

/

create or replace PROCEDURE MODIFICA_SOCIO_DIRECCION(
    m_DNI IN SOCIO.DNI%TYPE,
    m_DIRECCION IN SOCIO.DIRECCION%TYPE)
    IS BEGIN
    UPDATE SOCIO SET DIRECCION = m_DIRECCION where m_DNI = DNI;
    COMMIT WORK;
END MODIFICA_SOCIO_DIRECCION;

/

create or replace PROCEDURE MODIFICA_SOCIO_EMAIL(m_DNI IN SOCIO.DNI%TYPE,m_email IN SOCIO.EMAIL%TYPE)
  IS BEGIN
  UPDATE SOCIO SET EMAIL = m_email where m_DNI = DNI;
  COMMIT WORK;
END MODIFICA_SOCIO_EMAIL;

/

CREATE OR REPLACE PROCEDURE MODIFICA_EMPLAZAMIENTO_DIR(
    m_ID IN EMPLAZAMIENTO.ID_Emplazamiento%TYPE, m_Direccion IN EMPLAZAMIENTO.Direccion%TYPE)
IS BEGIN
    UPDATE EMPLAZAMIENTO SET Direccion = m_Direccion where m_ID = ID_Emplazamiento;
END MODIFICA_EMPLAZAMIENTO_DIR;

/

CREATE OR REPLACE PROCEDURE MODIFICA_EMPLAZAMIENTO_TEL(
    m_ID IN EMPLAZAMIENTO.ID_Emplazamiento%TYPE, m_Telefono IN EMPLAZAMIENTO.Telefono%TYPE)
    IS BEGIN
    UPDATE EMPLAZAMIENTO SET Telefono = m_Telefono where m_ID = ID_Emplazamiento;

END MODIFICA_EMPLAZAMIENTO_TEL;

/

CREATE OR REPLACE PROCEDURE MODIFICA_FACTURA_DEVUELTO
(m_ID_FACTURA IN FACTURA.ID_FACTURA%TYPE,m_Devuelto IN FACTURA.Devuelto%TYPE)
  IS BEGIN
  UPDATE FACTURA SET Devuelto = m_Devuelto where m_ID_FACTURA = ID_FACTURA;
END MODIFICA_FACTURA_DEVUELTO;

/

CREATE OR REPLACE PROCEDURE ELIMINA_PROVEEDOR(p_CIF IN PROVEEDOR.CIF%TYPE)
  IS BEGIN
  DELETE FROM PROVEEDOR WHERE p_CIF = CIF;
END ELIMINA_PROVEEDOR;

/

CREATE OR REPLACE PROCEDURE ELIMINA_PRODUCTO(p_ID_Producto IN PRODUCTO.ID_Producto%TYPE)
  IS BEGIN
  DELETE FROM PRODUCTO WHERE ID_Producto =  p_ID_Producto;
END ELIMINA_PRODUCTO;

/

CREATE OR REPLACE PROCEDURE ELIMINA_EMPLAZAMIENTO(p_ID_Emplazamiento IN EMPLAZAMIENTO.ID_Emplazamiento%TYPE)
  IS BEGIN
  DELETE FROM EMPLAZAMIENTO WHERE ID_Emplazamiento =  p_ID_Emplazamiento;
END ELIMINA_EMPLAZAMIENTO;

/

CREATE OR REPLACE PROCEDURE ELIMINA_SOCIO(p_DNI IN SOCIO.DNI%TYPE)
  IS BEGIN
  DELETE FROM SOCIO WHERE DNI =  p_DNI;
END ELIMINA_SOCIO;

/

/*FUNCIONES*/

CREATE OR REPLACE FUNCTION precio_A_Venta_producto
(f_ID_Venta IN ASOCIACION_VENTA_PRODUCTO.ID_Venta%TYPE,
f_Cantidad IN ASOCIACION_VENTA_PRODUCTO.Cantidad%TYPE,
f_PrecioVenta IN ASOCIACION_VENTA_PRODUCTO.PrecioVenta%TYPE)
RETURN NUMBER is f_PrecioLinea ASOCIACION_VENTA_PRODUCTO.PRECIOLINEA%TYPE;
BEGIN
f_PrecioLinea := f_PrecioVenta * f_Cantidad;
RETURN(f_PrecioLinea);
END precio_A_Venta_producto;

/

CREATE OR REPLACE FUNCTION precio_Venta
(f_ID_Venta IN VENTA.ID_Venta%TYPE)
RETURN NUMBER is f_PrecioTotal VENTA.PRECIOTOTAL%TYPE;
BEGIN
select SUM(precioLinea) into f_PrecioTotal from ASOCIACION_VENTA_PRODUCTO
where ID_Venta = f_ID_Venta;
RETURN(f_PrecioTotal);
END precio_Venta;

/

CREATE OR REPLACE FUNCTION precio_A_Pedido_producto
(f_ID_Pedido IN ASOCIACION_PEDIDO_PRODUCTO.ID_Pedido%TYPE,
f_Cantidad IN ASOCIACION_PEDIDO_PRODUCTO.Cantidad%TYPE,
f_PrecioCompra IN ASOCIACION_PEDIDO_PRODUCTO.PrecioCompra%TYPE)
RETURN NUMBER is f_PrecioLinea ASOCIACION_PEDIDO_PRODUCTO.PrecioLinea%TYPE;
BEGIN
f_PrecioLinea := f_PrecioCompra * f_Cantidad;
RETURN(f_PrecioLinea);
END precio_A_Pedido_producto;

/

CREATE OR REPLACE FUNCTION precio_Pedido
(f_ID_Pedido IN PEDIDO.ID_Pedido%TYPE)
RETURN NUMBER is f_PrecioTotal PEDIDO.PRECIOTOTAL%TYPE;
BEGIN
select SUM(PrecioLinea) into f_PrecioTotal from ASOCIACION_PEDIDO_PRODUCTO
where ID_Pedido = f_ID_Pedido;
RETURN(f_PrecioTotal);
END precio_Pedido;

/

CREATE OR REPLACE FUNCTION ganancias_mensuales(fechainicio IN factura.fechadeexpedicion%TYPE,fechafin IN factura.fechadeexpedicion%TYPE )
return number is f_preciototal factura.preciototal%TYPE;
v_preciototal factura.preciototal%TYPE;
p_preciototal albaran.preciototal%TYPE;
begin
select sum(preciototal) into v_preciototal from factura where fechadeexpedicion between fechainicio and fechafin;
select sum(preciototal) into p_preciototal from albaran where fechafirma between fechainicio and fechafin;
f_preciototal := v_preciototal - p_preciototal;
return (f_preciototal);
end ganancias_mensuales;

/

/* TRIGGERS */

CREATE OR REPLACE TRIGGER descuento_socio
  BEFORE INSERT ON factura
  FOR EACH ROW
  declare v_preciototal VENTA.PRECIOTOTAL%TYPE;
  v_DNI VENTA.dni%TYPE;
BEGIN
  select preciototal into v_preciototal from venta where id_Venta = :NEW.id_venta;
  select dni into v_dni from venta where id_venta = :NEW.id_Venta;
  IF v_DNI IS NOT NULL then
  UPDATE venta set preciototal = v_preciototal * 0.95 where id_Venta = :NEW.id_venta;
  :New.preciototal := v_preciototal * 0.95;
  else
  update venta set preciototal = v_preciototal where id_venta = :NEW.id_venta;
  END IF;
END;

/
/*
CREATE OR REPLACE TRIGGER stock_minimo
  AFTER INSERT OR UPDATE ON stock
  FOR EACH ROW
BEGIN
  IF :NEW.cantidad <0
  THEN
  raise_application_error(-20601, :NEW.cantidad || 'No se puede realizar esta operacion');
  END IF;
END;

/
*/
CREATE OR REPLACE TRIGGER Inicializa_nueva_Venta
BEFORE INSERT ON VENTA
FOR EACH ROW
BEGIN
:NEW.PrecioTotal := 0;
:NEW.FechaVenta := SYSDATE;
END Comprueba_Venta;

/

CREATE OR REPLACE TRIGGER Inicializa_nuevo_Pedido
BEFORE INSERT ON PEDIDO
FOR EACH ROW
BEGIN
:NEW.PrecioTotal := 0;
:NEW.FechaPedido := SYSDATE;
END Comprueba_Pedido;

/

CREATE OR REPLACE TRIGGER Inicializa_nueva_Factura
BEFORE INSERT ON Factura
FOR EACH ROW
BEGIN
:NEW.FechaDeExpedicion := SYSDATE;
END Inicializa_nueva_Factura;


/

CREATE OR REPLACE TRIGGER modifica_stock_venta
BEFORE INSERT ON FACTURA
FOR EACH ROW
DECLARE
e_ID_Emplazamiento Emplazamiento.ID_Emplazamiento%TYPE;
v_ID_Venta Venta.ID_VENTA%TYPE;

 CURSOR all_prods
 IS
 SELECT id_venta,id_producto,cantidad
 FROM ASOCIACION_VENTA_PRODUCTO
 ORDER BY ID_producto;

 m_id_venta ASOCIACION_VENTA_PRODUCTO.id_venta%TYPE;
 m_id_producto Producto.id_producto%type;
 m_cantidad ASOCIACION_VENTA_PRODUCTO.cantidad%TYPE;

BEGIN
select ID_Emplazamiento into e_ID_Emplazamiento from Emplazamiento where ID_Emplazamiento = :NEW.ID_Emplazamiento;
select ID_Venta into v_ID_Venta from Venta where ID_Venta = :New.ID_Venta;

OPEN all_prods;
LOOP
    Fetch all_prods INTO m_id_venta,m_id_producto,m_cantidad;
    EXIT WHEN all_prods%NOTFOUND;
    if m_id_venta = v_id_Venta
    THEN
    update stock set cantidad = cantidad-m_cantidad where id_emplazamiento = e_ID_Emplazamiento AND id_producto =m_ID_Producto;
    END IF;
  END LOOP;
  CLOSE all_prods;
END modifica_stock_venta;

/
/*
CREATE OR REPLACE TRIGGER inicializa_preciolinea_alv
  BEFORE INSERT OR UPDATE ON ASOCIACION_VENTA_PRODUCTO
  FOR EACH ROW
  BEGIN
  :NEW.preciolinea := :New.cantidad * :New.precioVenta;
END inicializa_preciolinea_alv;

/
*/
CREATE OR REPLACE TRIGGER inicializa_preciototal_venta
  BEFORE INSERT OR UPDATE ON ASOCIACION_VENTA_PRODUCTO
  for each row
  begin
  UPDATE venta set preciototal = PRECIOTOTAL + (:New.cantidad * :New.precioVenta) where id_venta = :New.id_venta;
END inicializa_preciototal_venta;

/


CREATE OR REPLACE TRIGGER modifica_stock_pedido
BEFORE INSERT OR UPDATE ON ALBARAN
FOR EACH ROW
DECLARE
e_ID_Emplazamiento Emplazamiento.ID_Emplazamiento%TYPE;
p_ID_PEDIDO PEDIDO.ID_PEDIDO%TYPE;

 CURSOR all_prods
 IS
 SELECT id_pedido,id_producto,cantidad
 FROM ASOCIACION_PEDIDO_PRODUCTO
 ORDER BY ID_producto;

 m_id_pedido ASOCIACION_PEDIDO_PRODUCTO.id_pedido%TYPE;
 m_id_producto Producto.id_producto%type;
 m_cantidad ASOCIACION_PEDIDO_PRODUCTO.cantidad%TYPE;

BEGIN

select ID_Emplazamiento into e_ID_Emplazamiento from pedido where ID_pedido = :NEW.ID_Pedido;
select ID_PEDIDO into p_id_pedido from pedido where ID_pedido = :NEW.ID_Pedido;
OPEN all_prods;
LOOP
    Fetch all_prods INTO m_id_pedido,m_id_producto,m_cantidad;
    EXIT WHEN all_prods%NOTFOUND;
    if m_id_pedido = p_id_pedido
    THEN
    update stock set cantidad = cantidad+m_cantidad where id_emplazamiento = e_ID_Emplazamiento AND id_producto =m_ID_Producto;
    END IF;
  END LOOP;
  CLOSE all_prods;
END modifica_stock_pedido;

/

CREATE OR REPLACE TRIGGER modifica_stock_traspaso
BEFORE INSERT OR UPDATE ON ASOCIACION_PRODUCTO_TRASPASO
FOR EACH ROW
DECLARE
e_ID_Emplazamiento_salida Emplazamiento.ID_Emplazamiento%TYPE;
e_ID_Emplazamiento_entrada Emplazamiento.ID_Emplazamiento%TYPE;
t_ID_traspaso traspaso.ID_traspaso%TYPE;

BEGIN
select ID_Emplazamientosalida into e_ID_Emplazamiento_salida from traspaso where ID_traspaso = :NEW.ID_traspaso;
select ID_Emplazamientoentrada into e_ID_Emplazamiento_entrada from traspaso where ID_traspaso = :NEW.ID_traspaso;
select ID_traspaso into t_id_traspaso from traspaso where ID_traspaso = :NEW.ID_traspaso;
update stock set cantidad = (cantidad- :NEW.cantidad) where id_emplazamiento = e_ID_Emplazamiento_salida AND id_producto = :NEW.id_producto;
update stock set cantidad = (cantidad+ :NEW.cantidad) where id_emplazamiento = e_ID_Emplazamiento_entrada AND id_producto = :NEW.id_producto;

END modifica_stock_traspaso;
/
CREATE OR REPLACE TRIGGER Inicializa_Nuevo_Pedido
BEFORE INSERT ON Pedido
FOR EACH ROW
BEGIN
:NEW.PrecioTotal := 0;
:NEW.FechaPedido := SYSDATE;
END Inicializa_Nuevo_Pedido;

/


CREATE OR REPLACE TRIGGER Inicializa_Nueva_ST
BEFORE INSERT ON Solicitud_Traspaso
FOR EACH ROW
BEGIN
:NEW.FechaSolicitud := SYSDATE;
END Inicializa_Nueva_ST;

/

CREATE OR REPLACE TRIGGER Inicializa_Nuevo_Traspaso
BEFORE INSERT ON Traspaso
FOR EACH ROW
BEGIN
:NEW.FechaTraspaso := SYSDATE;
END Inicializa_Nuevo_Traspaso;

/

create or replace TRIGGER solicitud_stock_minimo
BEFORE INSERT ON asociacion_producto_solicitud
FOR EACH ROW
DECLARE
e_id_emplazamientoentrada SOLICITUD_TRASPASO.ID_EMPLAZAMIENTOENTRADA%TYPE;
e_cantidad Stock.cantidad%TYPE;

BEGIN
  SELECT id_emplazamientoentrada into e_id_emplazamientoentrada from solicitud_traspaso where id_solicitud = :NEW.id_solicitud;
  select cantidad into e_cantidad from stock where id_emplazamiento = e_id_emplazamientoentrada and id_producto = :NEW.id_producto;
  if (e_cantidad - :NEW.cantidad) <=5
  THEN raise_application_error(-20601, :NEW.cantidad || 'No se permite la solicitud, el otro emplazamiento alcanzara su stock minimo');
  END IF;
END;

/
/*
create or replace TRIGGER inicializa_preciolinea_alp
  BEFORE INSERT OR UPDATE ON ASOCIACION_PEDIDO_PRODUCTO
  FOR EACH ROW
  BEGIN
  :NEW.preciolinea := :New.cantidad * :New.preciocompra;
END inicializa_preciolinea_alp;
/
*/
create or replace TRIGGER inicializa_preciototal_albaran
  BEFORE INSERT OR UPDATE ON Albaran
  for each row
  DECLARE
  p_preciototal pedido.preciototal%TYPE;
  begin
  select preciototal into p_preciototal from pedido where id_pedido = :New.id_pedido;
  :New.preciototal := p_preciototal;
END inicializa_preciototal_albaran;

/

create or replace TRIGGER inicializa_preciototal_pedido
  BEFORE INSERT OR UPDATE ON ASOCIACION_pedido_producto
  for each row
  begin
  UPDATE pedido set preciototal = PRECIOTOTAL + (:New.cantidad * :New.preciocompra) where id_pedido = :New.id_pedido;
END inicializa_preciototal_pedido;

/

create or replace trigger inicializa_precioventa_apv
  before insert on asociacion_venta_producto
  for each row
  declare
  p_precio producto.precioproducto%TYPE;
  begin
  select precioproducto into p_precio from producto where id_producto = :New.id_producto;
  :NEW.precioventa := p_precio;
END inicializa_precioventa_apv;

/

create or replace trigger inicializa_IVA_apv
  before insert on asociacion_venta_producto
  for each row
  declare
  p_IVA PRODUCTO.IVA%TYPE;
  begin
  select Iva into p_IVA from producto where id_producto = :New.id_producto;
  :NEW.IVAVENTA := p_IVA;
END inicializa_IVA_apv;

/

create or replace trigger inicializa_IVA_APP
  before insert on asociacion_pedido_producto
  for each row
  declare
  p_IVA PRODUCTO.IVA%TYPE;
  begin
  select IVA into p_IVA from producto where id_producto = :New.id_producto;
  :NEW.IVA := p_IVA;
END inicializa_IVA_APP;

/

create or replace trigger devolucion
before update on factura
for each row 
begin 
  if(sysdate - :old.fechadeexpedicion)>30 then 
  raise_application_error(-20601, :NEW.fechadeexpedicion || 'No se permite la devolución, han pasado más de 30 días');
  END IF;
END devolucion;
/
/*
create or replace trigger mensaje
before update of cantidad on stock
for each row
DECLARE 
   lines dbms_output.chararr; 
   num_lines number; 
BEGIN 
  
    if (:old.cantidad - :new.cantidad)<5 then
   -- enable the buffer with default size 20000 
   dbms_output.enable; 
   
   dbms_output.put_line('Hello Reader!'); 
   dbms_output.put_line('Hope you have enjoyed the tutorials!'); 
   dbms_output.put_line('Have a great time exploring pl/sql!'); 
  
   num_lines := 3; 
  
   dbms_output.get_lines(lines, num_lines); 
  
   FOR i IN 1..num_lines LOOP 
      dbms_output.put_line(lines(i)); 
   END LOOP; 
   end IF;
END mensaje; 
/  
*/
--CLIENTES
--VISTA PARA BUSCAR CLIENTES ACTIVOS
create view VW_Buscar_Clientes AS select nombre, apellido, dni, direccion, localidad, telefono, mail from Clientes where estado = 1
select * from VW_Buscar_Clientes

--AGREGAR CLIENTE
CREATE PROCEDURE SP_InsertarCliente
(@nombre varchar(30), @apellido varchar(30), @dni varchar(10), @direccion varchar(15), @localidad varchar(15), @telefono varchar(10), @mail varchar(50), @estado bit)
AS
BEGIN
INSERT INTO Clientes VALUES (@nombre, @apellido, @dni, @direccion, @localidad, @telefono, @mail, 1)
END

--MODIFICAR CLIENTE
CREATE PROCEDURE SP_ModificarCliente(
    @nombre varchar(30), 
    @apellido varchar(30), 
    @dni varchar(10), 
    @direccion varchar(15), 
    @localidad varchar(15), 
    @telefono varchar(10), 
    @mail varchar(50), 
    @estado bit
)
AS
BEGIN
UPDATE CLIENTES SET nombre = @nombre, apellido = @apellido, dni = @dni, direccion = @direccion, localidad = @localidad, telefono = @telefono, mail = @mail , ESTADO = 1
where dni = @dni
END

--VALIDAR DNI
CREATE PROCEDURE SP_BuscarDNI(
    @DNI VARCHAR(10)
)
AS
BEGIN
Select id, dni, estado from Clientes where dni = @dni and estado = 1
END

select * from CLIENTES

--DAR DE BAJA CLIENTE
CREATE TRIGGER TR_BajaClientes
on CLIENTES
INSTEAD OF DELETE
AS
BEGIN
    declare @ID int
    select @ID = ID from deleted
    update CLIENTES set ESTADO = 0 where ID = @ID
END


CREATE VIEW VW_Reparaciones_EnReparacion
AS
--REPARACIONES ENTRADAS (listaRep1)
SELECT R.ORDEN, CLI.NOMBRE, CLI.APELLIDO, CLI.TELEFONO, EQ.MARCA, EQ.MODELO, R.PROBLEMA, R.FECHA_ENTRADA 
FROM REPARACIONES AS R 
INNER JOIN CLIENTES AS CLI ON R.IDCLIENTE = CLI.ID 
INNER JOIN ESTADOS_REPARACION AS ER ON R.IDESTADO = ER.ID 
INNER JOIN EQUIPOS AS EQ ON R.IDEQUIPO = EQ.ID 
WHERE ER.ID = 1

SELECT * FROM VW_Reparaciones_EnReparacion



CREATE VIEW VW_Reparaciones_FinalizadoATiempo as
--REPARACIONES FINALIZADAS (listaRep2)
SELECT R.ORDEN, CLI.NOMBRE, CLI.APELLIDO, CLI.TELEFONO, EQ.MARCA, EQ.MODELO, R.PROBLEMA, R.INFORME, R.FECHA_ENTRADA, R.FECHA_SALIDA 
FROM REPARACIONES AS R 
INNER JOIN CLIENTES AS CLI ON R.IDCLIENTE = CLI.ID 
INNER JOIN ESTADOS_REPARACION AS ER ON R.IDESTADO = ER.ID 
INNER JOIN EQUIPOS AS EQ ON R.IDEQUIPO = EQ.ID 
WHERE ER.ID = 2


CREATE PROCEDURE SP_FinalizarReparacion(
    @informe VARCHAR(MAX),
    @precio MONEY,
    @fecha_salida SMALLDATETIME,
	@fecha_entrada SMALLDATETIME,
    @id INT
	
)
AS
BEGIN
--update reparaciones set idestado = 2, informe = @informe, precio = @precio, fecha_salida = @fecha_salida where id = @aux

        IF(DATEDIFF(DAY,@FECHA_ENTRADA, @FECHA_SALIDA) <= 4)
			UPDATE REPARACIONES SET IDESTADO = 2, INFORME = @informe, PRECIO = @precio, FECHA_SALIDA = @fecha_salida WHERE ID = @id
        ELSE IF (DATEDIFF(DAY,@FECHA_ENTRADA, @FECHA_SALIDA) > 4)
            UPDATE REPARACIONES SET IDESTADO = 4, INFORME = @informe, PRECIO = @precio, FECHA_SALIDA = @fecha_salida WHERE ID = @id
        IF(@PRECIO = 0)
        UPDATE REPARACIONES SET IDESTADO = 5, INFORME = @informe, PRECIO = @precio, FECHA_SALIDA = @fecha_salida WHERE ID = @id

END









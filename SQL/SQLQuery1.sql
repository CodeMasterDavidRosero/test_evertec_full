--Creamos la base de datos
create database almacenados

use almacenados

--Creamos una tabla llamada Personas con algunos campos
create table personas
(
Id int primary key identity(1,1) NOT NULL, 
Nombre nvarchar(50) NOT NULL,
Telefono nvarchar(30),
Fecha_Nacimiento nvarchar(50)
);

--Insersertamos la Data de la tabla 5 ejemplos para iniciar
insert into personas
(Nombre, Telefono, Fecha_Nacimiento)
values('David Fernando Rosero Guerrero', '3178444099', '1984/07/01');

insert into personas
(Nombre, Telefono, Fecha_Nacimiento)
values('Lorena Patricia Collazos Narvaez', '3105080853', '1986/02/01');

insert into personas
(Nombre, Telefono, Fecha_Nacimiento)
values('Oscar Ivan Paz Ramirez', '3101024853', '1984/12/09');

insert into personas
(Nombre, Telefono, Fecha_Nacimiento)
values('Gabriel Fernando Montenegro', '3142485391', '1992/02/22');

insert into personas
(Nombre, Telefono, Fecha_Nacimiento)
values('Valentina Rosero Collazos', '3105835916', '2010/05/12');

--Opcional creamos un Type eb caso de consultar por ID
create type id_personas as table(Id int);

--Creamos el SP para insertar en la tabla personas
go
create procedure personasInsertar
@Nombre nvarchar (50),
@Telefono nvarchar (30),
@Fecha_Nacimiento datetime

as
begin	
	Insert Into personas (Nombre, Telefono, Fecha_Nacimiento)
	values(@Nombre, @Telefono, @Fecha_Nacimiento);
End

--Creamos el SP para Actualizar en la tabla personas
go
create procedure personasActualizar
@Id int,
@Nombre nvarchar(50),
@Telefono nvarchar(30),
@Fecha_Nacimiento datetime

as
begin
	update personas
	set Nombre = @Nombre,
		Telefono = @Telefono,
		Fecha_Nacimiento = @Fecha_Nacimiento
	Where Id=@Id
end

--Ingresamos algún datos llamando el SP respectivo

exec personasActualizar 3, 'Oscar Ivan Leal Ramirez', '3114992125', '1984/08/12'


--Creamos el SP en la tabla Personas para borrar un registro de la tabla
go
create procedure personasBorrar
@Id int
as
begin
	delete from personas where Id=@Id
end

--Probamos si efectivamente borra el registro según el ID

exec personasBorrar 5

--Creamos el SP en la tabla Personas para mostrar los datos
go
create procedure PersonasLeer
@Id int
as
begin
	select * from personas
	where Id=@Id
end

--Verificamos que la SP LEER funciona

exec personasMostrar 




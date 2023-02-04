-- Preguntas práctica --


select 
	keepcodingvehiculos.grupos."nombre_grupo" as "Grupo Empresarial",
	keepcodingvehiculos.marcas."id_marca" as "Marca",
	keepcodingvehiculos.modelos."id_modelo" as "Modelo",
	keepcodingvehiculos.colores."id_color" as "Color",
	keepcodingvehiculos.aseguradoras."id_aseguradora" as "Aseguradora",
	keepcodingvehiculos.polizas."id_poliza" as "Nº de poliza",
	keepcodingvehiculos.vehiculos.fecha_compra,
	keepcodingvehiculos.vehiculos.kms_total,
	keepcodingvehiculos.vehiculos.matricula,
	keepcodingvehiculos.vehiculos.fecha_baja
	
from keepcodingvehiculos.vehiculos
inner join  keepcodingvehiculos.modelos  
			on keepcodingvehiculos.modelos.id_modelo = keepcodingvehiculos.vehiculos.id_modelo
		
inner join keepcodingvehiculos.marcas
			on keepcodingvehiculos.modelos.id_marca = keepcodingvehiculos.marcas.id_marca 
		
inner join keepcodingvehiculos.grupos 
			on keepcodingvehiculos.grupos.id_grupo = keepcodingvehiculos.marcas.id_grupo
		
inner join keepcodingvehiculos.colores 
			on keepcodingvehiculos.colores.id_color = keepcodingvehiculos.vehiculos.id_color
		
inner join keepcodingvehiculos.aseguradoras 
			on keepcodingvehiculos.vehiculos.id_aseguradora  = keepcodingvehiculos.aseguradoras.id_aseguradora
		
inner join keepcodingvehiculos.polizas  
			on keepcodingvehiculos.aseguradoras.id_poliza = keepcodingvehiculos.polizas.id_poliza
where keepcodingvehiculos.vehiculos.fecha_baja is null; --Cuando sale null el coche es activo(Si quieres ver todos los coches comenta esta última línea)
		



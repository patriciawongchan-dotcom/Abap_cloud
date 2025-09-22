@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'asoc renta'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view entity zcds_as_rent_pwc as select from ZCDS_CARS_PWC as Cars

association[1] to zcds_RESTANTES_DAY_PWC as _DiasRestantes on Cars.Matricula = _DiasRestantes.Matricula
association[0..*] to ZCDS_MARCAS_PWC as _Marca on Cars.Marca = _Marca.Marca
association[0..*] to ZCDS_D_CLIENTE_PWC as _DetCustomer on Cars.Matricula = _DetCustomer.Matricula
{
  key Matricula,
  Marca,
  Modelo,
  Color,
  Motor,
  Potencia,
  UndPotencia,
  Combustible,
  Consumo,
  Puertas,
  @Semantics.amount.currencyCode: 'Moneda'
  Precio,
  Moneda,
  Alquilado,
  AlqDesde,
  AlqHasta,
  
case

when _DiasRestantes.Dias <= 0 then 0
when _DiasRestantes.Dias between 1 and 30 then 1
when _DiasRestantes.Dias between 31 and 100 then 2
when _DiasRestantes.Dias > 100 then 3
else 0

end as DiasRestantes,

// 0 neutral frey
// 1 negative red
//2 critical yellow
// 3 positive green



_Marca.Url,
_DetCustomer
}

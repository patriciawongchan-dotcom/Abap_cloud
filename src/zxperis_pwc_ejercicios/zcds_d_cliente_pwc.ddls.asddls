@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CLIENTE'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view entity ZCDS_D_CLIENTE_PWC as select from ztab_custom_pwc
{
    key doc_id as DocId,
    key matricula as Matricula,
    fecha_inicio as FechaInicio,
    fecha_fin as FechaFin,
    nombres as Nombres,
    apellidos as Apellidos,
    email as Email,
    cntr_type as CntrType
}

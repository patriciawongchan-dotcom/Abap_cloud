@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'DIAS RESTANTES'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zcds_RESTANTES_DAY_PWC as select from ztab_rentcar_pwc
{
 key   matricula as Matricula,
        marca  as Marca,
       dats_days_between( cast($session.system_date as abap.dats), alq_hasta) as Dias
}

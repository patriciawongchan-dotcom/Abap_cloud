@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS INFORMACION DE SESION'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zcds_inf_sesion_pwc as select from /dmo/customer
{
    key customer_id as CustomerID,
    $session.client as CLientField,
    $session.system_date as SystemDate,
    $session.system_language as SystemLanguage,
    $session.user_date as UserDate,
    $session.user_timezone as UserTz
}

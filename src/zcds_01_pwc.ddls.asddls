@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS01'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #B,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZCDS_01_PWC as select from /dmo/flight
{
    key carrier_id as AirlineID,                //para comentarios
    key connection_id as ConnectionID,
    key flight_date as FlightDate,
    @Semantics.amount.currencyCode: 'Currency'
    @EndUserText.label: 'Price'
    price as Price,
    currency_code as Currency
}

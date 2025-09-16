@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS02'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #B,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZCDS_CASTING_PWC as select from /dmo/flight
{
    key carrier_id as AirlineID,                //para comentarios
    key connection_id as ConnectionID,          // lo q esta a la derecha del as es un alias
    key flight_date as FlightDate,
    @Semantics.amount.currencyCode: 'Currency'
    @EndUserText.label: 'Price'
    price as Price,
    currency_code as Currency,
    
    'USD' as CurrencyDocument,
    '20300101' as DataString,
    
    cast( '20300101' as abap.dats ) as DataDate,
    
    1.2 as FloatingPointElement,
    
    fltp_to_dec(1.2 as abap.dec(4,2)) as DecimalElement,
    
    cast( 'E' as abap.lang ) as LanguageElement
    
    
    
    
    
}

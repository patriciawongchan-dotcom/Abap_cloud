@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS JOIN'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZCDS_JOIN_PWC 
as select from /dmo/travel as TRAVEL
inner join /dmo/booking as BOOKING on BOOKING.travel_id = TRAVEL.travel_id

{
    key TRAVEL.travel_id as TravelID,
    key BOOKING.booking_id as BookingID,
    
    
    BOOKING.booking_date as BookingDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
  
    BOOKING.flight_price as FlightPrice,
    BOOKING.currency_code as CurrencyCode,
    
    TRAVEL.agency_id as AgencyId,
    
    TRAVEL.begin_date as BeginDate,
    TRAVEL.end_date as EndDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    TRAVEL.total_price as TotalPrice
    
}

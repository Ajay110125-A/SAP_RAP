@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Interface view managed'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_BOOKING_AY_M
  as select from zay_booking_m
  composition [0..*] of ZI_BOOKSUPP_AY_M as _BookingSuppl
  association        to parent ZI_TRAVEL_AY_M    as _Travel     on  $projection.TravelId = _Travel.TravelId
  association [0..1] to /DMO/I_Carrier           as _Carrier    on  $projection.CarrierId = _Carrier.AirlineID
  association [0..1] to /DMO/I_Customer          as _Customer   on  $projection.CustomerId = _Customer.CustomerID
  association [0..1] to /DMO/I_Connection        as _Connection on  $projection.CarrierId    = _Connection.AirlineID
                                                                and $projection.ConnectionId = _Connection.ConnectionID
  association [1..1] to /DMO/I_Overall_Status_VH as _Status     on  $projection.BookingStatus = _Status.OverallStatus
{
  key travel_id       as TravelId,
  key booking_id      as BookingId,
      booking_date    as BookingDate,
      customer_id     as CustomerId,
      carrier_id      as CarrierId,
      connection_id   as ConnectionId,
      flight_date     as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price    as FlightPrice,
      currency_code   as CurrencyCode,
      booking_status  as BookingStatus,
      last_changed_at as LastChangedAt,
      
      //Parent 
      _Travel,
      
      //Compostion
      _BookingSuppl,

      // Associations
      _Carrier,
      _Customer,
      _Connection,
      _Status


}

@EndUserText.label: 'Booking Projection View'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity zc_booking_ay_m
  //provider contract transactional_query
  as projection on ZI_BOOKING_AY_M
{
  key TravelId,
  key BookingId,
      BookingDate,
      CustomerId,
      CarrierId,
      ConnectionId,
      FlightDate,
      FlightPrice,
      CurrencyCode,
      BookingStatus,
      LastChangedAt,
      /* Associations */
      _BookingSuppl : redirected to composition child ZC_BOOKSUPP_AY_M,
      _Carrier,
      _Connection,
      _Customer,
      _Status,
      _Travel       : redirected to parent zc_travel_ay_m
}

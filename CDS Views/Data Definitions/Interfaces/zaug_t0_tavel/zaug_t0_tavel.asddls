@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDSEntity for Travel August Challenge T0'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZAUG_T0_TAVEL
  as select from zaug_t1_travel
  association [1..1] to /DMO/I_Overall_Status_VH as _Status on $projection.Status = _Status.OverallStatus
{
  key travel_id     as TravelId,
      description   as Description,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price   as TotalPrice,
      currency_code as CurrencyCode,
      concat_with_space( cast(total_price as abap.char(20)), currency_code, 2) as TotalPriceCurrency,
      @ObjectModel.text.element: [ 'OverAllStatusText' ]
      status        as Status,
      _Status._Text.Text as OverAllStatusText,
      
      //Association
      _Status
}

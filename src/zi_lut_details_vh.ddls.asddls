@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'balue help for lut details'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_LUT_DETAILS_VH as select from I_BillingDocument
{
    key YY1_LUTNO2_BDH as LutNo
}
where YY1_LUTNO2_BDH is not initial
group by YY1_LUTNO2_BDH

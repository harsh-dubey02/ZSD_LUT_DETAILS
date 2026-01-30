@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'interface for lut details'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZI_LUT_DETAILS as select from ztb_lut_details
{
     key uuid as Uuid,
    key lut_no as LutNo,
    lut_descripton as LutDescripton
}

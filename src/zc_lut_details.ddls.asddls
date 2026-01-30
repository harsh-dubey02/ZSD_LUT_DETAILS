@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'consumption for lut details'
@Metadata.allowExtensions: true
define root view entity ZC_LUT_DETAILS as projection on ZI_LUT_DETAILS
{

    key Uuid as Uuid,
   @Consumption.valueHelpDefinition: [{
    entity: { name: 'ZI_LUT_DETAILS_VH', element: 'LutNo' }
  }]
  key LutNo,
    LutDescripton
}

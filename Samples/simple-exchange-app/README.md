## Quick Instructions

1. First, configure Xcode to save generated binaries local to project directories. To do this, in Xcode, go to 'Xcode > Preferences...' and click 'Locations' (at the far right). For 'Derived Data', click the 'Advanced' button, and choose 'Custom > Relative to Workspace'. Make sure Products go in 'Build/Products' and Intermediates in 'Build/Intermediates'.<br>
This sample app assumes built products are stored locally to project directories.
2. Clone the ADALiOS repo at the same position in your file system as this repo.
3. Open sdk-objectivec/office365_odata_base/office365_odata_base.xcodeproj and build for simulator. <br />
   (NB: If you want to build for device, you'll need to point this sample app at the built frameworks for a device.)
4. Open sdk-objectivec/office365_exchange_sdk/office365_exchange_sdk.xcodeproj and build for simulator. <br />
   (NB: Same note as above: if building for device, fix references in sample app).
5. Build or run Samples/simple-exchange-sample/simple-exchange-sample.app.

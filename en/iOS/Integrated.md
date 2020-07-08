# Integrate SDK

The recommended way to include the SDK in your iOS project is to use CocoaPods, but you can also download the SDK and manually configure your project to use it.

## SDK

### LPMusicKit SDK

Linkplay Music Kit is the app side SDK for Linkplay Home Audio solution；you can use it to implement our solution into your product.

MusicKit mainly solves 2 issues:

- Maintain the commnunication protocol with our firmware so that your app could interact with the device without concerning the comlexity of the lower layers.

- Wrapper the complexity of cloud services (includes music services and voice services etc.) so that you can intergtate them rapidly and don't bother the details.

[Download LPMusicKit SDK](https://github.com/linkplayapp/LPMusicKitiOS)

The following are the main functions of LPMusicKit SDK:

- Device discovery
```
[[LPDeviceManager sharedInstance] search:@""];
```
- Device online and offline delegate
```
[[LPDeviceManager sharedInstance] addObserver:self];
// delegate
onLPDeviceOnline
onLPDeviceOffline
onLPDeviceUpdate
```

- Device playback control:
    Through LPDevicePlayer to realize the playback processing of the device


- Device information display: Display device information through LPDeviceInfo and LPDeviceStatus


- Device media information display: display device media information through LPMediaInfo


- The device's preset, alarm clock, timed sleep function

- OTA function of the device

### LPBLESetup SDK

LPBLESetup is the app side SDK for Linkplay BLE Setup solution；you can quickly connect our device to the router.

LPBLESetup mainly provides two functions：

- Connect the device to the router through BLE, so that the related functions of the device and the network can be used normally.

- It encapsulates the way of communicating information with the device through BLE, so that you can easily send information to the device.

[Download LPBLESetup SDK](https://github.com/linkplayapp/LPBLESetupiOS)

LPBLESetupiOS is mainly used with LPMusicKitSDK, the main steps are as follows:
- The device enters the distribution mode (at this time, the SDK can discover the device through BLE)
- Call the interface of LPBLESetupiOS startScan and implement the delegate of LPBLEManager
- Call the connectBLE method to connect the device. After the connection is successful, you can communicate with the device through BLE
- Call the getWLANList method to get the Wi-Fi list around the device
- Call the connectWLAN method and send the selected Wi-Fi name and password to the device to complete the network configuration

Only after the device completes the network configuration can the functions after network connection be used.


### LPAlexaKit SDK

LPAlexaKitiOS is the app side SDK for Linkplay Alexa operation solution；you can use it to implement the device's Alexa login and Alexa information settings.

LPAlexaKit mainly provides two functions：

- Device Alexa login and logout.

- Device Alexa information settings, such as language, prompt tone, etc.

[Download LPAlexaKit SDK](https://github.com/linkplayapp/LPAlexaKitiOS)

For the Alexa login process:
- Use getAlexaStatus to determine whether the device is logged in to Alexa
- Initialize LPAlexaSplashView and display Splash webpage (device not logged in)
- Initialize LPAlexaLoginView to display the Alexa login page
- loginSuccess 代理触发后，调用 setAuthcodeWithDeivce 完成设备 Alexa 登录

After the loginSuccess delegate method is triggered, use setAuthcodeWithDeivce to complete the device Alexa login


### LPMSMediaLibrary SDK 

LPMSMediaLibrary is the app side SDK for Linkplay iPhone media library access solution；you can use it to quickly play music from iPhone media library to your products.

LPMSMediaLibrary mainly provides two functions：

- Show music in iPhone media library.

- Play music from iPhone media library to your product.

[Download LPMSMediaLibrary SDK](https://github.com/linkplayapp/LPMSMediaLibraryiOS)

### LPMSNAS SDK 

LPMSNAS is the app side SDK for Linkplay NAS access solution；you can use it to quickly play music from NAS devices to your products.

LPMSNAS mainly provides two functions：

- Show music from NAS devices.

- Play music from NAS device to your product.

[Download LPMSNAS SDK](https://github.com/linkplayapp/LPMSNASiOS)

### LPMDPKit SDK 

LPMDPKit SDK is an intermediate plug-in SDK for data format conversion, because the data format of the device SDK LPMusicKit interface interaction is LinkPlay's custom XML. The XML level is very complicated. If users try to parse and splice XML, it will be very troublesome and later Upgrading and maintaining XML is not user friendly. <br>
Therefore, a set of standard data format models is defined and this plug-in SDK is developed. After you obtain XML from the device SDK LPMusicKit interface, call the corresponding interface provided by the middle-tier plug-in SDK to get the standard model data .

Alarm clock, preset and other functions in LPMusicKit SDK also need to use LPMDPKit SDK for data conversion processing

[Download LPMDPKit SDK](https://github.com/linkplayapp/LPMDPKitiOS)


## SDK Demo 

### Use CocosPods to configure the demo of the project

- [LPMusicKitPodsDemo](https://github.com/linkplayapp/LPMusicKitPodsDemo)

### Import SDK demo manually

- [LPMusicKitDemo](https://github.com/linkplayapp/LPMusicKitDemo)

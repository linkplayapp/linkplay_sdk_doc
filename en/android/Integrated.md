# Integrate SDK

The recommended way to include the SDK in your iOS project is to use CocoaPods, but you can also download the SDK and manually configure your project to use it.

## SDK

### LPMusicKit SDK

Linkplay Music Kit is the app side SDK for Linkplay Home Audio solution；you can use it to implement our solution into your product.

MusicKit mainly solves 2 issues:

- Maintain the commnunication protocol with our firmware so that your app could interact with the device without concerning the comlexity of the lower layers.

- Wrapper the complexity of cloud services (includes music services and voice services etc.) so that you can intergtate them rapidly and don't bother the details.

[Download LPMusicKit SDK](https://github.com/linkplayapp/LPMusicKitAndroid)

The following are the main functions of LPMusicKit SDK:

- Device discovery
```
LPDeviceManager.getInstance().search(null);
```
- Device online and offline delegate
```ObjectiveC
LPDeviceManager.getInstance().addObserver(LPDeviceManagerObserver observer)
// delegate
LPDeviceOnline
LPDeviceRemove
LPDeviceUpdate
```

- Device playback control:
    Through LPDevicePlayer to realize the playback processing of the device


- Device information display: Display device information through LPDeviceInfo and LPDeviceStatus


- Device media information display: display device media information through LPMediaInfo


- The device's preset, alarm clock, timed sleep function

- OTA function of the device
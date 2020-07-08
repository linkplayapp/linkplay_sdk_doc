# 集成 SDK

建议您使用CocosPods 集成SDK，当然您也可以下载SDK并手动配置项目以使用它。

## SDK

### LPMusicKit SDK

LPMusicKit SDK 是Linkplay Home Audio方案的app端SDK；通过它，您可以快速的将我们的解决方案实现到您的产品里。

MusicKit SDK 主要解决了两方面的问题：

- 维护与固件的通讯协议，使您可以简洁的与设备进行交互而不必关心琐碎的通讯技术问题

- 封装了网络服务（音乐服务、智能语音服务等）的复杂度，使您可以快速接入它们而不必关心实现细节

[下载 LPMusicKit SDK](https://github.com/linkplayapp/LPMusicKitiOS)

以下是 LPMusicKit SDK 的主要功能:

- 设备发现
```
[[LPDeviceManager sharedInstance] search:@""];
```
- 设备上线和下线代理
```ObjectiveC
[[LPDeviceManager sharedInstance] addObserver:self];
// delegate
onLPDeviceOnline
onLPDeviceOffline
onLPDeviceUpdate
```

- 设备的播控设置 ：
 通过 LPDevicePlayer 实现设备的播放处理


- 设备信息展示： 通过 LPDeviceInfo 和 LPDeviceStatus 展示设备的信息


- 设备媒体信息展示 ： 通过 LPMediaInfo 展示设备媒体信息


- 设备的预置、闹钟、定时休眠功能

- 设备的OTA功能

### LPBLESetup SDK

LPBLESetup SDK 是Linkplay BLE 配网方案的app端SDK；通过它，您可以快速的将我们的设备连接到路由器上。

LPBLESetup SDK 主要提供了两个功能：

- 通过BLE的方式，将设备连接到路由器上，从而使设备和网络相关的功能正常使用

- 封装了和设备之间通过BLE交互信息的方式，使得你可以方便的发送信息给设备

[下载 LPBLESetup SDK](https://github.com/linkplayapp/LPBLESetupiOS)

LPBLESetupiOS 主要是配合 LPMusicKitSDK 来使用, 主要的步骤如下：
- 设备进入配网模式（此时SDK才可以通过BLE发现设备）
- 调用 LPBLESetupiOS startScan 的接口，并实现 LPBLEManager 的 delegate
- 调用 connectBLE 方法连接设备，连接成功后，可以通过BLE跟设备进行数据交互
- 调用 getWLANList 方法 获取设备周边的Wi-Fi列表
- 调用 connectWLAN 方法，发送选中Wi-Fi的名称和密码给设备，从而完成配网

设备完成配网后，才可以使用联网后的功能。


### LPAlexaKit SDK

LPAlexaKit SKD 是Linkplay Alexa操作方案的app端SDK；通过它，您可以实现设备Alexa的登录以及Alexa信息的设置。

LPAlexaKit SKD 主要提供了两个功能：

- 设备Alexa登录、登出

- 设备Alexa信息设置，如语言、提示音等

[下载 LPAlexaKit SDK](https://github.com/linkplayapp/LPAlexaKitiOS)

对于Alexa 登录流程:
- 调用 getAlexaStatus 判断设备是否登录 Alexa
- 初始化 LPAlexaSplashView，展示 Splash 网页 （设备未登录）
- 初始化 LPAlexaLoginView 展示 Alexa 登录页面
- loginSuccess 代理触发后，调用 setAuthcodeWithDeivce 完成设备 Alexa 登录

完成设备 Alexa 登录后，可以调用 LPAlexaManager 中的方法，设置设备Alexa 语言、提示音等属性


### LPMSMediaLibrary SDK 

LPMSMediaLibrary SDK 是Linkplay iPhone媒体库接入方案的app端SDK；通过它，您可以快速的将iPhone媒体库的音乐播放到您的产品里。

LPMSMediaLibrary SDK 主要解决了两方面的问题：

展示iPhone媒体库中的音乐

播放iPhone媒体库中的音乐到您的产品里

[下载 LPMSMediaLibrary SDK](https://github.com/linkplayapp/LPMSMediaLibraryiOS)

### LPMSNAS SDK 

LPMSNAS SDK 是Linkplay NAS接入方案的app端SDK；通过它，您可以快速的将NAS设备的音乐播放到您的产品里。

LPMSNAS SDK 主要提供了两个功能：

展示NAS设备中的音乐

播放NAS设备中的音乐到您的产品里

[下载 LPMSNAS SDK](https://github.com/linkplayapp/LPMSNASiOS)

### LPMDPKit SDK 

LPMDPKit SDK 是一个数据格式转换的中间插件SDK，因为设备SDK LPMusicKit 接口交互的数据格式为LinkPlay自定义的XML，XML的层级很复杂，如果使用者去尝试解析、拼接XML将会非常麻烦，以及后期升级维护XML，这对用户来说不友好。 所以，定义了一套标准的数据格式的模型，并开发了这个插件SDK.<br>
同时，LinkPlay所提供的音源，如：本地音乐，TuneIn. 它们的API接口返回的数据格式都是基于标准模型的数据封装的，当你需要播放音乐的时候：
- 调用中间层插件转化为设备SDKLPMusicKitiOS需要的XML,
- 把此XML传给设备SDKLPMusicKitiOS的接口.
通过 LPMDPKit SDK 的数据转换，可以轻松的完成播放功能。<br>

LPMusicKit SDK 中的闹钟、预置等功能，同样需要使用 LPMDPKit SDK 做数据转换处理

[下载 LPMDPKit SDK](https://github.com/linkplayapp/LPMDPKitiOS)


## SDK Demo 

### 使用CocosPods配置工程的demo

- [LPMusicKitPodsDemo](https://github.com/linkplayapp/LPMusicKitPodsDemo)

### 手动导入SDK的demo

- [LPMusicKitDemo](https://github.com/linkplayapp/LPMusicKitDemo)

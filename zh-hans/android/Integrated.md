# 集成 SDK

建议您使用远程依赖集成SDK，后续方便更新.

## SDK

### LPMusicKit SDK

LPMusicKit SDK 是Linkplay Home Audio方案的app端SDK；通过它，您可以快速的将我们的解决方案实现到您的产品里。

MusicKit SDK 主要解决了两方面的问题：

- 维护与固件的通讯协议，使您可以简洁的与设备进行交互而不必关心琐碎的通讯技术问题

- 封装了网络服务（音乐服务、智能语音服务等）的复杂度，使您可以快速接入它们而不必关心实现细节

[下载 LPMusicKit SDK](https://github.com/linkplayapp/LPMusicKitAndroid)

以下是 LPMusicKit SDK 的主要功能:

- 设备发现
```
LPDeviceManager.getInstance().search(null);
```
- 设备上线和下线代理
```ObjectiveC
LPDeviceManager.getInstance().addObserver(LPDeviceManagerObserver observer)
// delegate
LPDeviceOnline
LPDeviceRemove
LPDeviceUpdate
```

- 设备的播控设置 ：
 通过 LPDevicePlayer 实现设备的播放处理


- 设备信息展示： 通过 LPDeviceInfo 和 LPDeviceStatus 展示设备的信息


- 设备媒体信息展示 ： 通过 LPMediaInfo 展示设备媒体信息


- 设备的预置、闹钟、定时休眠功能

- 设备的OTA功能
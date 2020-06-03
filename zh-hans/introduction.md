Linkplay Music Kit
=================
Linkplay Music Kit是Linkplay Home Audio方案的app端SDK；通过它，您可以快速的将我们的解决方案实现到您的产品里。

![introduction](./images/introduction-1.png)

MusicKit主要解决了两方面的问题：
1. 维护与固件的通讯协议，使您可以简洁的与设备进行交互而不必关心琐碎的通讯技术问题
2. 封装了网络服务（音乐服务、智能语音服务等）的复杂度，使您可以快速接入它们而不必关心实现细节

# 设备管理
即app发现周围的设备，包括OOBE与日常设备发现。
![introduction](./images/introduction-discover.png)

## OOBE
Out-of-box experience，用户首次将产品买回家之后的开箱流程。这个流程的体验需要尽可能简单与健壮。
可以看到，设置的流程是由下网上，由硬件向软件，由底层服务向高层服务的：

| 步骤                    | 分层                                                  |
| :--------               | :---------------------------------------------------- |
| Wi-Fi Setup             | 链路层                                                |
| First OTA               | 固件系统                                              |
| Initial Device Settings | 系统软件设置，例如时区、语言等                        |
| Service Setup           | 应用层服务设置，各种软件服务的设置                    |

- Wi-Fi Setup

  第一步是将设备连接到互联网上。目前我们提供了如下配网方式，请根据自己的情况选择：

| 名称                                            | 说明                                                  |
| :--------                                       | :---------------------------------------------------- |
| [BLE配网](./iOS/DeviceSetup.md#ble-配网模式)    | 如果您的模组有BLE模块，则可以使用此种配网方式         |
| [直连配网](./iOS/DeviceSetup.md#wi-fi-配网模式) | 如果您的模组没有BLE模块，可以使用此种方式             |

- [First OTA](./iOS/Device.md#固件升级)

  用户将产品买回家的时候，距离产品量产可能已经有了新的OTA版本。为了能提供给用户最好的产品服务，第一次OTA检测是必须的。

- Initial Device Settings

  当硬件、固件都处于最新状态之后，就需要给设备进行一些本地化、个性化设置了，这包括：
  - 语言
  - 时区
  - 静默升级时间段

- Service Setup

  再之后，就需要提供之上的应用层服务了：
  - 音乐服务，例如Tunein, Amazon Music
  - 语音服务，例如[Alexa](./iOS/Alexa.md)

## 设备管理
   发现设备是控制设备的前提：[Device Management](./iOS/Device_SDK.md)

# 设备交互
1. 


# 网络服务
![introduction](./images/introduction-3.png)

## 音源服务
## 智能音源服务





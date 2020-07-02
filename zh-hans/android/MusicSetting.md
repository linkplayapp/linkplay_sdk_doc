# 设备播放音乐设置

# 简介

对设备播放音乐的信息设置，如声道、播放模式、进度等信息。

#### 播放进度

- 接口说明

    ``` Java
    setProgress(int progress, LPDevicePlayerListener listener)
    ```

- 参数

| 名称           | 类型                     | 接口说明                                        |
| :------------- | :----------------------- | :---------------------------------------------- |
| progress       | int                      | 播放进度                                        |
| listener       | LPDevicePlayerListener   | Callback                                        |

- 返回值

    无


#### 播放声道

- 接口说明

    ``` Java
    setChannel(int channel, LPDevicePlayerListener listener)
    ```

- 参数

| 名称           | 类型                     | 接口说明                                        |
| :------------- | :----------------------- | :---------------------------------------------- |
| channel        | int                      | 播放声道                                        |
| listener       | LPDevicePlayerListener   | Callback                                        |

- 返回值

    无

#### 播放模式

- 接口说明

    ``` Java
    setMode(int mode, LPDevicePlayerListener listener)
    ```

- 参数

| 名称           | 类型                     | 接口说明                                        |
| :------------- | :----------------------- | :---------------------------------------------- |
| mode           | int                      | 播放模式                                        |
| listener       | LPDevicePlayerListener   | Callback                                        |

- 返回值

    无

#### 音量

- 接口说明

    ``` Java
    setVolume(int volume, LPDevicePlayerListener listener)
    ```

- 参数

| 名称           | 类型                     | 接口说明                                        |
| :------------- | :----------------------- | :---------------------------------------------- |
| volume         | int                      | 设备音量                                        |
| listener       | LPDevicePlayerListener   | Callback                                        |

- 返回值

    无


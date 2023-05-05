# 设备设置

# Overview 

设备对象包含了播控、设备设置、闹钟、预置、闹钟等有关设备的功能


### 播放控制

#### 获取设备播控对象

- 接口说明

    ``` Java
    getPlayer()
    ```

- 参数

    无

- 返回值

| 类型               | 接口说明                                  |
| :-----------------| :--------------------------------------- |
| LPDevicePlayer    | 设备播控对象                               |


#### 播放

- 接口说明

    ``` Java
    play(LPDevicePlayerListener listener)
    ```

- 参数

| 名称         | 类型                     | 描述                                            |
| :----------- | :----------------------- | :---------------------------------------------- |
| listener     | LPDevicePlayerListener   | Callback                                        |

- 返回值

    无

#### 暂停

- 接口说明

    ``` Java
    pause(LPDevicePlayerListener listener)
    ```

- 参数

| 名称         | 类型                     | 描述                                            |
| :----------- | :----------------------- | :---------------------------------------------- |
| listener     | LPDevicePlayerListener   | Callback                                        |

- 返回值

    无

#### 停止播放

- 接口说明

    ``` Java
    - (void)stop:(LPPlayerBlock _Nullable)completionHandler;
    ```

- 参数

| 名称         | 类型                     | 描述                                            |
| :----------- | :----------------------- | :---------------------------------------------- |
| listener     | LPDevicePlayerListener   | Callback                                        |

- 返回值

    无

#### 下一首

- 接口说明

    ``` Java
    next(LPDevicePlayerListener listener)
    ```

- 参数

| 名称         | 类型                     | 描述                                            |
| :----------- | :----------------------- | :---------------------------------------------- |
| listener     | LPDevicePlayerListener   | Callback                                        |

- 返回值

    无

#### 上一首

- 接口说明

    ``` Java
    previous(LPDevicePlayerListener listener)
    ```

- 参数

| 名称         | 类型                     | 描述                                            |
| :----------- | :----------------------- | :---------------------------------------------- |
| listener     | LPDevicePlayerListener   | Callback                                        |

- 返回值

    无

#### 播放音乐

播放音乐指的是从音源SDK中获取要播放的信息 musicDictionary, 然后传递给设备，从而让设备播放音源信息，从音源中获得 LPPlayMusicList 对象后，可以通过 LPMDPKitManager SDK 转换成接口需要的播放信息 musicDictionary

- 接口说明

    ``` Java
    playAudio(String playlist, LPDevicePlayerListener listener)
    ```

- 参数

| 名称              | 类型                      | 接口说明                                           |
| :--------------- | :----------------------- -| :----------------------------------------------  |
| playlist  | String              | 播放媒体内容                                       |

- 返回值

    无

- 示例代码

    ```Java
    currDevice.getPlayer().playAudio(playlist,
                new LPDevicePlayerListener() {
            @Override
            public void onSuccess(String result) {
 
            }
 
            @Override
            public void onFailure(Exception e) {
 
            }
        });
    ```

#### 下一首播放

选中歌曲，作为歌单中的下一首音乐播放

- 接口说明

    ``` Java
    nextPlay(String playlist, LPMediaInfo mediaItem, LPDevicePlayerListener listener)
    ```

- 参数

| 名称              | 类型                      | 接口说明                                           |
| :--------------- | :----------------------- -| :----------------------------------------------  |
| playlist         | String                    | 播放媒体内容                                       |
| mediaItem        | LPMediaInfo               | 音乐信息                                           |
| listener         | LPDevicePlayerListener    | 回调                                               |


- 返回值

    无

- 示例代码

    ``` Java
     currDevice.getPlayer().nextPlay(playlist, mediaItem,
                new LPDevicePlayerListener() {
            @Override
            public void onSuccess(String result) {
 
            }
 
            @Override
            public void onFailure(Exception e) {
 
            }
        });
    ```


#### 播放USB歌曲

- 接口说明

     ``` Java
    playUSBSongsWithIndex(int index, LPDevicePlayerListener listener);
    ```

- 参数

| 名称              | 类型                      | 接口说明                                           |
| :--------------- | :----------------------- -| :----------------------------------------------  |
| index            | int                       | 歌曲index                                         |

- 返回值

    无

- 示例代码

```Java
    currDevice.getPlayer().playUSBSongsWithIndex(index,
        new LPDevicePlayerListener() {
         @Override
        public void onSuccess(String result) {
 
         }
 
        @Override
        public void onFailure(Exception e) {
         }
    });
```

#### 播放当前正在播放歌单中的歌曲
- 接口说明
    ``` Java
    playCurrentPlayListWithIndex(int index, LPDevicePlayerListener listener)
    ```
- 参数

| Name       | Type     | Description                                                          |
| :----------| :--------| :------------------------------------------------------------------- |
| index      | int      | 当前歌单中歌曲index，可以从(queryCurrentPlayList)获取歌单                                                         |


- 返回值
    无
- 示例代码
    ``` Java
    currDevice.getPlayer().playCurrentPlayListWithIndex(index,
                new LPDevicePlayerListener() {
            @Override
            public void onSuccess(String result) {
 
            }
 
            @Override
            public void onFailure(Exception e) {
 
            }
        });
    ```

#### 删除当前播放歌单中的歌曲

从正在播放的歌单列表中，删除指定的歌曲。

- 接口说明

    ``` Java
    deleteWithIndex(int index, LPDevicePlayerListener listener)
    ```

- 参数

| 名称             | 类型                       | 接口说明                                        |
| :--------------- | :----------------------- - | :---------------------------------------------- |
| index            | int                        | 歌曲在歌单列表中的位置                          |
| listener         | LPDevicePlayerListener     | Callback                                        |

- 返回值

    无

- 示例代码

    ``` Java
    currDevice.getPlayer().delWithIndex(0,
                new LPDevicePlayerListener() {
            @Override
            public void onSuccess(String result) {
 
            }
 
            @Override
            public void onFailure(Exception e) {
 
            }
        });
    ```

### 闹钟

闹钟SDK实现了设备本地闹钟的功能。通过时间、周期、音乐的设定，来实现定时音箱闹铃功能。<br>

闹钟SDK可以设置闹铃，分为通过普通音乐和预置音乐，可以调整闹铃声音的大小，可以设置闹钟的周期。<br>

闹钟SDK可以实现编辑闹钟、新增闹钟、删除闹钟和关闭或者打开闹钟的功能。关闭或打开闹钟，指的是闹钟还存在，只是单纯的关闭或者打开闹钟功能，并不是删除闹钟。<br>

#### 闹钟列表
- 接口说明

    ``` Java
    getAlarms(final LPAlarmListener listener)
    ```

- 参数

| 名称             | 类型                       | 接口说明                                        |
| :--------------- | :----------------------- - | :---------------------------------------------- |
| listener         | LPAlarmListener       | Callback                                        |

- 返回值

    无

- 示例代码

    ``` Java
        LPDeviceAlarm lpDeviceAlarm = new LPDeviceAlarm(UIApplication.currDevice);
            lpDeviceAlarm.getAlarms(new LPAlarmListener() {
                @Override
                public void onSuccess(String result) {
                    Log.e(TAG, "getAlarms = " + result);
                }

                @Override
                public void onFail(Exception e) {
                    e.printStackTrace();
                    Log.e(TAG, "get alarms error = " + e.getMessage());
                }
            });
    ```

#### 增加新闹钟

- 接口说明
    ``` Java
    addAlarm(String content, final LPAlarmListener listener)
    ```

- 参数

| 名称             | 类型                       | 接口说明                                        |
| :--------------- | :----------------------- - | :---------------------------------------------- |
| content          | String                     | 闹钟信息                                        |
| listener         | LPAlarmListener            | Callback                                        |

- 返回值

    无

- 示例代码

    ``` Java
    String content = "";
    LPDeviceAlarm lpDeviceAlarm = new LPDeviceAlarm(UIApplication.currDevice);
    lpDeviceAlarm.addAlarm(content, new LPAlarmListener() { 
                @Override
                public void onSuccess(String result) {
                    Log.i(TAG, "alarm: " + result);
                }
                    @Override
                public void onFail(Exception e) {
                    Log.i(TAG, "alarm: e " + e);
                }
            });       
    ```

- 注意

    如果闹铃的选择为在线音乐，当选中的音乐处于异常状态时(如在线音乐 token 过期)，会使用默认的音乐代替闹铃

####  修改闹钟

- 接口说明
    ``` Java
    editAlarm(String context, final LPAlarmListener listener)
    ```

- 参数

| 名称             | 类型                       | 接口说明                                        |
| :--------------- | :----------------------- - | :---------------------------------------------- |
| context          | String                     | 闹钟信息                                        |
| listener         | LPAlarmListener            | Callback                                        |

- 返回值

    无

- 示例代码
    ``` Java
    LPDeviceAlarm lpDeviceAlarm = new LPDeviceAlarm(UIApplication.currDevice);
        lpDeviceAlarm.editAlarm(content, new LPAlarmListener() {
                    @Override
                    public void onSuccess(String result) {
                        Log.i(TAG, "alarm: " + result);
                    }

                    @Override
                    public void onFail(Exception e) {
                        Log.i(TAG, "alarm: e " + e);

                    }
                });
    ```

####  删除闹钟
- 接口说明
    ``` Java
    deleteAlarm(String alarmName, final LPAlarmListener listener)
    ```

- 参数

| 名称             | 类型                       | 接口说明                                        |
| :--------------- | :----------------------- - | :---------------------------------------------- |
| alarmName          | String                     | 闹钟名称                                        |
| listener         | LPAlarmListener            | Callback                                        |

- 返回值

    无

- 示例代码
    ``` Java
    LPDeviceAlarm lpDeviceAlarm = new LPDeviceAlarm(UIApplication.currDevice);
            lpDeviceAlarm.deleteAlarm(bean.getAlarmName(), new LPAlarmListener() {
                @Override
                public void onSuccess(String result) {
                     Log.i(TAG, "delete alarm: " + result);
                }

                @Override
                public void onFail(Exception e) {
                    e.printStackTrace();
                    Log.e(TAG, "delete error = " + e.getMessage());
                }
            });
    ```

####  打开/关闭闹钟

- 接口说明
``` Java
    setAlarmSwitchOn(String context, LPAlarmListener listener)
    ```

- 参数

| 名称             | 类型                       | 接口说明                                        |
| :--------------- | :----------------------- - | :---------------------------------------------- |
| context          | String                     | 闹钟详情                                        |
| listener         | LPAlarmListener            | Callback                                        |

- 返回值

    无

- 示例代码
    ``` Java
    LPDeviceAlarm lpDeviceAlarm = new LPDeviceAlarm(UIApplication.currDevice);
            lpDeviceAlarm.setAlarmSwitchOn(LPMDPKitManager.getInstance().setAlarmStatusWithOpen(isChecked, bean),
                    new LPAlarmListener() {
                        @Override
                        public void onSuccess(String result) {
                            Log.i(TAG, "swith result = " + result);
                        }

                        @Override
                        public void onFail(Exception e) {
                            e.printStackTrace();
                            Log.e(TAG, "swith error = " + e.getMessage());
                            alarmSwith.setChecked(!isChecked);
                        }
                    });
    ```

### 预置

预置是指将歌曲或者歌单信息保存到设备的存储空间中，可通过设备上的某些物理按键播放这些音乐，用户可以将喜爱的一些音乐通过预置保存在设备中，就可以更快速，更便捷的在设备上播放音乐。<br>

Preset SDK 提供了添加预置，删除预置，获取预置，播放预置的功能。<br>

SDK 需要配合 LPMDPKit SDK 使用，SDK返回的信息，需要传入的参数，也都是通过LPMDPKit SDK 获得。<br>

#### 预置列表

- 接口说明

    ``` Java
    getPresets(LPPresetListListener listener)
    ```

- 参数

| 名称             | 类型                       | 接口说明                                        |
| :--------------- | :----------------------- - | :---------------------------------------------- |
| listener         | LPPresetListListener       | Callback                                        |

- 返回值

    无

-   示例代码
    ```Java
    currDevice.getDevicePreset().getPresets(new LPPresetListener() {
                    @Override
                    public void onSuccess(String s) {
                       
                    }

                    @Override
                    public void onFail(Exception e) {

                    }
                });
    ```
####  设置预置

- 接口说明

    ``` Java
    setPreset(String context, LPPresetListener listener)
    ```

- 参数

| 名称            | 类型                     | 接口说明                                        |
| :-------------- | :----------------------- | :---------------------------------------------- |
| context         | String                   | 预置内容                                       |
| listener        | LPPresetListener         | 回调                                            |

- 返回值

    无

- 示例代码
    ```Java
    currDevice.getDevicePreset().setPreset(prests,
                        new LPPresetListener() {
                    @Override
                    public void onSuccess(String s) {

                    }

                    @Override
                    public void onFail(Exception e) {

                    }
                });
    ```
####  删除预置

- 接口说明

    ``` Java
    deletePreset(String context, LPPresetListener listener)
    ```

- 参数

| 名称            | 类型                     | 接口说明                                        |
| :-------------- | :----------------------- | :---------------------------------------------- |
| context     | String                     | 预置列表内容                                        |
| listener        | LPPresetListener         | 回调                                            |

- 返回值

    无

-  示例代码
    ```Java
    currDevice.getDevicePreset().deletePreset(preset,
                        new LPPresetListener() {
                            @Override
                            public void onSuccess(String s) {
                                
                            }

                            @Override
                            public void onFail(Exception e) {

                            }
                        });
    ```

####  播放预置

- 接口说明

    ``` Java
    playPreset(int index, LPPresetListener listener)
    ```

- 参数

| 名称            | 类型                     | 接口说明                                        |
| :-------------- | :----------------------- | :---------------------------------------------- |
| index           | int                      | 预置对象的索引                                  |
| listener        | LPPresetListener         | 回调                                            |

- 返回值

    无

-  示例代码
    ```Java
    currDevice.getDevicePreset().playPreset(1, new LPPresetListener() {
                    @Override
                    public void onSuccess(String s) {
                        
                    }

                    @Override
                    public void onFail(Exception e) {

                    }
                });
    ```
### 定时关机

Timer SDK 提供了设置休眠倒计时时间，获取休眠倒计时时间的API

####  设置时间

- 接口说明

    设置设备定时关机的时间

    ``` Java
    setTimer(int time, LPTimerListener listener)
    ```

- 参数

| 名称            | 类型                     | 接口说明                                        |
| :-------------- | :----------------------- | :---------------------------------------------- |
| time            | int                      | 休眠倒计时时间(s)；-1表示取消                   |
| listener        | LPTimerListener          | 回调                                            |

- 返回值

    无


####  获取设备定时关机时间

- 接口说明

    获取设备当前已经设置的timer

    ``` Java
    getTimer(LPTimerListener listener)
    ```

- 参数

    无

- 返回值

    无


### 固件升级
当固件有新版本更新的时候，可以通过OTA实现设备固件更新的功能。 <br><br>
固件升级时，设备必须连接在Wi-Fi上，且Wi-Fi必须有网络才可以开启OTA功能。你可以通过 LPDeviceInfo 中 getDeviceInternetStatus 方法来判断当前设备是否有网络。对于设备来说，正常情况下，无论设备升级成功或者失败，都会回连到升级前的Wi-Fi上，如果因为某些原因导致升级失败，你可以等待设备回连后，再次尝试升级。<br><br>
 OTA  SDK 提供了检测固件是否有升级，升级的功能，OTA SDK 会经历固件下载、设备升级、设备重启三个阶段，分别对应 MV_UP_STATUS_DOWNLOAD_START、MV_UP_STATUS_WRITE_START、MV_UP_STATUS_REBOOT三个状态，每个阶段都会有超时判断，防止卡死在OTA流程中。 <br>


- `OTAStatus` 数据模型

    OTA升级过程中所对应的状态

| 名称                            | 描述                                                         |
| ------------------------------ | -----------------------------------------------------------  |
| MV_UP_STATUS_UNKNOWN           | 未知状态                                                      |
| MV_UP_STATUS_DOWNLOAD_START    | 开始下载                                                      |
| MV_UP_STATUS_DOWNLOAD_FAILED   | 下载失败                                                      |
| MV_UP_STATUS_WRITE_START       | 开始升级                                                      |
| MV_UP_STATUS_WRITE_FINISH      | 升级结束                                                      |
| MV_UP_STATUS_WRITE_FAILED      | 升级失败                                                      |
| MV_UP_STATUS_COMPLETE          | 升级成功                                                      |
| MV_UP_STATUS_REBOOT            | 设备重启                                                      |
| MV_UP_STATUS_NOT_IN_OTA        | 设备没有处于升级状态                                            |



####  检测固件升级状态

- 接口说明

    检测设备是否有固件新版本

    ``` Java
    checkUpdate()
    ```

- 参数

    无

- 返回值

    BOOL

- 注意

    建议：配网完成后不要立即调用此接口；设备需要时间查询是否有OTA。


####  开始设备升级

- 接口说明

    ``` Java
    firmwareStartUpdate(LPOTAConfiguration config, LPOTAListener listener)
    ```

- 参数

| 名称            | 类型                     | 接口说明                                        |
| :-------------- | :----------------------- | :---------------------------------------------- |
| config          | LPOTAConfiguration       | OTA 升级过程中三个阶段所需要的时间对象          |
| listener        | LPOTAListener            | 回调                                            |

- 返回值

    无

####  设备升级监听

- 接口说明

    升级过程中返回状态、进度等属性的代理方法

    ``` Java
    otaStatusUpdated(OTAStatus status)
    ```

- 参数

| 名称            | 类型                     | 接口说明                                        |
| :-------------- | :----------------------- | :---------------------------------------------- |
| status          | OTAStatus                | 升级进度信息                                    |

- 返回值

    无

### MCU 交互

Passthrough SDK 提供了与设备建立长连接，发送透传指令，并接收设备透传指令的功能。


#### Listener

Passthrough SDK 共有两个监听，用来传递数据和标识长连接状态。

#### connectionStateChanged(boolean isConnected)

- 接口说明

    Passthrough 长连接状态监听

- 参数

| 名称            | 类型                     | 接口说明                                        |
| :-------------- | :----------------------- | :---------------------------------------------- |
| isConnected     | boolean                  | 是否连接成功                                    |

- 返回值

    无

####  passThroughMessageCome(String response)

- 接口说明

    Passthrough 数据通讯监听

- 参数

| 名称            | 类型                     | 接口说明                                        |
| :-------------- | :----------------------- | :---------------------------------------------- |
| response        | String                   | 设备发送过来的透传数据                          |

- 返回值

    无

####  建立连接

- 接口说明

    建立与MCU的透传连接。

    ``` Java
    connect()
    ```

- 参数

    无

- 返回值

    无

####  断开连接

- 接口说明

    ``` Java
    disConnect()
    ```

- 参数

    无

- 返回值

    无

#### 发送数据

- 接口说明

    ``` Java
    write(String cmd)
    ```

- 参数

| 名称      | 类型                     | 接口说明                                        |
| :-------- | :----------------------- | :---------------------------------------------- |
| cmd       | String                   | 与MCU交互的数据                                 |

- 返回值

    无

### HTTP 交互

App和设备通过HTTP接口Passthrough.

#### Passthrough 代理

- 接口说明

    设备向App发送Passthrough信息的代理方法

    ``` Java
    - void passthroughViaHTTPNotify(String strPassThrough);
    ```

- 参数

| 名称            | 类型                      | 参数说明                                     |
| :-------------- | :----------------------- | :-------------------------------------------|
| strPassThrough  | String                   | 设备发送的信息                                |

- 返回值

    无

#### HTTP发送Passthrough

- 接口说明

    App 发送Passthrough信息给设备

    ``` Java
    - void passthroughViaHTTP(String url, String method, String body_params, LPNetworkListener callback);
    ```

- 参数

| 名称            | 类型                     | 参数说明                                     |
| :-------------- | :----------------------- | :------------------------------------------|
| url             | String                   | 请求url                                     |
| method          | String                   | 请求的方法名                                  |
| body_params     | String                   | 请求参数                                     |
| callback        | LPNetworkListener        | 回调                                         |

- 返回值

    无

- 示例代码

    ``` Java

    LPDevice device = UIApplication.currDevice;
        String url = String.format("https://%s/httpapi.asp?", device.getIp());
        String parameters = "{\"command\": \"setPowerState\", \"value\":1}";

        device.getPassthroughViaHTTP().passthroughViaHTTP(url, "passthrough",
                parameters, new LPNetworkListener() {
            @Override
            public void onSuccess(LPNetworkResponseItem response) {
                super.onSuccess(response);
                Log.i(TAG, "passthroughViaHTTP success: " + response.body);
            }

            @Override
            public void onFailure(Exception e) {
                super.onFailure(e);
                Log.i(TAG, "passthroughViaHTTP failure: " + e.getLocalizedMessage());
            }
        });
    
    ```
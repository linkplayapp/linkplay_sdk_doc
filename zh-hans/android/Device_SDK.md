# 设备发现

# Overview 

设备管理包含了，设备的上线、下线、删除等操作，同时也可以通过Id来获取到对应的设备, LPDeviceManager 提供了管理设备的API

![server_error](./images/69731079.jpg)
![server_error](./images/69731080.jpg)

# API Reference 

### 设备搜索

#### 初始化
- 接口说明

    初始化管理信息

    ``` Java
    init(LPDeviceManagerParam param)
    ```

- 参数

| 名称      | 类型                     | 接口说明                                              |
| :-------- | :----------------------- | :---------------------------------------------------- |
| param     | String                   | 构造必须的信息，如:设备上下文等                       |

- 返回值

    无

- 示例代码

    ``` Java
    LPDeviceManagerParam param = new LPDeviceManagerParam();
    param.context = context;//application context

    LPDeviceManager lpDeviceManager = LPDeviceManager.getInstance();
    lpDeviceManager.init(param);
    ```

#### 搜索设备
- 接口说明

    搜索周边的设备

    ``` Java
    search(String[] key)
    ```

- 参数

| 名称      | 类型                     | 接口说明                                                      |
| :-------- | :----------------------- | :----------------------------------------------------         |
| key       | String[]                 | 默认传空，客户如有自定义组播搜索设备关键字则传入, 支持多个key |

- 返回值

    无

- 示例代码

    ``` Java
        LPDeviceManager lpDeviceManager = LPDeviceManager.getInstance();
        lpDeviceManager.init(param);
        lpDeviceManager.addObserver(this);
//        lpDeviceManager.search(new String[]{"xxxxxxx"});//custom search key
        lpDeviceManager.search(null);
    ```

#### 停止搜索设备

- 接口说明

    ``` Java
    stop()
    ```

- 参数

    无

- 示例代码

    ``` Java
    @Override
   public void onTerminate() {
       super.onTerminate();
       LPDeviceManager.getInstance().stop();
   }
    ```

### 添加代理

#### 添加观察者

- 接口说明

    ``` Java
    addObserver(LPDeviceManagerObserver observer)
    ```

- 参数

| 名称     | 类型                    | 接口说明                                             |
| -------- | ----------------------- | ---------------------------------------------------- |
| observer | LPDeviceManagerObserver | 要接收设备上下线通知的对象                           |

- 返回值

    无

- 示例代码

    ``` Java
    LPDeviceManager lpDeviceManager = LPDeviceManager.getInstance();
    lpDeviceManager.init(param);
    lpDeviceManager.addObserver(this);
//        lpDeviceManager.search(new String[]{"xxxxxxx"});//custom search key
    lpDeviceManager.search(null);
    ```

#### 移除观察者

- 接口说明

    ``` Java
    removeObserver()
    ```

- 参数

| 名称      | 类型                    | 接口说明                                          |
| -------- | ----------------------- | ----------------------------------------------  |
| observer | LPDeviceManagerObserver | 要接收设备上下线通知的对象                           |

- 返回值

    无

- 示例代码

    ``` Java
    @Override
   public void onTerminate() {
       super.onTerminate();
 
       LPDeviceManager.getInstance().stop();
       LPDeviceManager.getInstance().removeObserver();
   }
    ```

### 获取设备

#### 根据设备Id获取设备

- 接口说明

    ``` Java
    deviceForID(String UUID)
    ```

- 参数

| 名称      | 类型                     | 接口说明                                        |
| :-------- | :----------------------- | :---------------------------------------------- |
| UUID      | String                   | 设备UUID                                        |

- 返回值

| 类型               | 接口说明                                  |
| :-----------------| :--------------------------------------- |
| LPDevice          | 设备对象                                  |


- 示例代码

    ``` Java
    LPDevice lpDevice = LPDeviceManager.getInstance().deviceForID(UUID);
    ```

#### 获取主设备列表

- 接口说明

    ``` Java
    getMasterDevices()
    ```
- 参数

    无

- 返回值

| 类型               | 接口说明                                 |
| :----------------- | :--------------------------------------- |
| List<LPDevice>     | 主设备列表                               |

- 示例代码

    ``` Java
    List<LPDevice> deviceList = LPDeviceManager.getInstance().getMasterDevices();
    ```

#### 根据设备IP获取设备

- 接口说明

    ``` Java
    deviceForIP(String IP)
    ```

- 参数

| 名称      | 类型                     | 接口说明                                        |
| :-------- | :----------------------- | :---------------------------------------------- |
| IP        | String                   | 设备IP                                          |

- 返回值

| 类型               | 接口说明                                 |
| :----------------- | :--------------------------------------- |
| LPDevice           | 设备对象                                 |


- 示例代码

    ``` Java
    LPDevice device = LPDeviceManager.getInstance().deviceForIP(ip);
    ```

#### 根据设备MAC获取设备

- 接口说明

    ``` Java
    deviceForMac(String MAC)
    ```

- 参数

| 名称      | 类型                     | 接口说明                                        |
| :-------- | :----------------------- | :---------------------------------------------- |
| MAC       | String                   | 设备MAC                                         |


- 返回值

| 类型               | 接口说明                                  |
| :-----------------| :--------------------------------------- |
| LPDevice          | 设备对象                                  |

- 示例代码

    ``` Java
    LPDevice device = LPDeviceManager.getInstance().deviceForMac(MAC);
    ```

#### 根据主设备Id获取子设备列表

- 接口说明

    ``` Java
    getSlaveDevices(String uuid)
    ```

- 参数

| 名称      | 类型                     | 接口说明                                        |
| :-------- | :----------------------- | :---------------------------------------------- |
| UUID      | String                   | 设备UUID                                        |


- 返回值

| 类型               | 接口说明                                 |
| :----------------- | :--------------------------------------- |
| List<LPDevice>     | 子设备列表                               |

- 示例代码

    ``` Java
    List<LPDevice> allSlaveDevices = LPDeviceManager.getInstance()
               .getSlaveDevices(lpDevice.getDeviceStatus().getUUID());
    ```

#### 子设备获取其主设备

- 接口说明

    ``` Java
    getMasterDeviceWithSlaveDevice(LPDevice slaveDevice)
    ```

- 参数

| 名称      | 类型                     | 接口说明                                        |
| :-------- | :----------------------- | :---------------------------------------------- |
| device    | LPDevice                 | 设备                                            |

- 返回值

| 类型               | 接口说明                                 |
| :----------------- | :--------------------------------------- |
| LPDevice           | 设备对象                                 |

- 示例代码

    ``` Java
    LPDevice masterDevice = LPDeviceManager.getInstance().getMasterDeviceWithSlaveDevice(slaveDevice);
    ```

#### App Log输出开关

- 接口说明

    ``` Java
    debugSwitch(BOOL switch)
    ```

- 参数

| 名称      | 类型                     | 接口说明                                        |
| :-------- | :----------------------- | :---------------------------------------------- |
| logOn     | BOOL                     | log开关                                         |


- 返回值

    无

### 设备上下线代理

- LPDeviceManagerObserver

| 名称                | 类型      | 接口说明                       |
| :----------------- | :-------- | :--------------------------- |
| onLPDeviceOnline   | LPDevice  | 设备上线                       |
| onLPDeviceOffline  | LPDevice  | 设备下线                       |
| onLPDeviceUpdate   | LPDevice  | 设备更新                       |


#### getPlayer()

- 接口说明

    Get Device's player.

- 参数

    无

- 返回值

| 类型           | 接口说明   |
| -------------- | ------------- |
| LPDevicePlayer | Player object |

#### getPreset()

- 接口说明

    Get Preset object

- 参数

    无

- 返回值

| 类型           | 接口说明   |
| -------------- | ------------- |
| LPDevicePreset | Preset object |

#### getAlarm()

- 接口说明

    Get alarm object

- 参数

    无

- 返回值

| 类型          | 接口说明  |
| ------------- | ------------ |
| LPDeviceAlarm | Alarm object |

#### getTimer()

- 接口说明

    Get shutdown timer object

- 参数

    无

- 返回值

| 类型          | 接口说明           |
| ------------- | --------------------- |
| LPDeviceTimer | Shutdown timer object |

#### getPassThrough()

- 接口说明

    Get pass through object

- 参数

    无

- 返回值

| 名称 | 类型          | 接口说明         |
| ---- | ------------- | ------------------- |
| mcu  | LPPassThrough | Pass through object |

#### getOTA()

- 接口说明

    Get OTA object

- 参数

    无

- 返回值

| 类型        | 接口说明 |
| ----------- | ----------- |
| LPDeviceOTA | OTA object  |

#### Property

| 名称       | 类型           | 接口说明          |
| ---------- | -------------- | -------------------- |
| player     | LPDevicePlayer | Player object        |
| preset     | LPDevicePreset | Preset object        |
| status     | LPDeviceStatus | Device status object |
| alarm      | LPDeviceAlarm  | Alarm object         |
| timer      | LPDeviceTimer  | Timer object         |
| mediaInfo  | LPMediaInfo    | Media info object    |
| deviceInfo | LPDeviceInfo   | Device info object   |

## LPMediaInfo

### Function 

    无

### Property 

| 名称   | 类型     | 接口说明    |
| ------ | -------- | ----------- |
| title  | String   | Title       |
| artist | String   | Artist      |
| album  | String   | Album       |
| ...    | ...      | ...         |

## LPDeviceInfo 

### Property 

| 名称        | 类型     | 接口说明            |
| ----------- | -------- | ------------------- |
| playStatus  | String   | Current play status |
| playMode    | int      | Play mode           |
| mediaType   | String   | Media Type          |
| trackSource | String   | Track source        |
| ...         | ...      | ...                 |


## LPDeviceStatus 

### Function 

    无

### Property 

| 名称         | 类型     | 接口说明               |
| ------------ | -------- | ---------------------- |
| UUID         | String   | UUID                   |
| IP           | int      | IP                     |
| WiFiStrength | float    | Wi-Fi signal strength  |
| MAC          | String   | MAC                    |
| SSID         | String   | SSID                   |
| friendlyName | String   | Device's friendly name |
| version      | String   | Firmware version       |
| language     | int      | Prompt tone language   |
| release      | String   | Compiled date          |

## Other Definitions

### LPPlayMode

| 类型             | 接口说明    |
| ---------------- | -------------- |
| LP_LISTREPEAT    | Loop playback  |
| LP_SINGLEREPEAT  | Single cycle   |
| LP_SHUFFLE       | Shuffle        |
| LP_SHUFFLEREPEAT | Shuffle repeat |
| LP_DEFAULT       | Default        |

### LPSpotifyPlayMode

| 类型                             | 接口说明           |
| -------------------------------- | --------------------- |
| LP_SPOTIFY_LISTREPEAT            | Loop playback         |
| LP_SPOTIFY_SINGLEREPEAT          | Single cycle          |
| LP_SPOTIFY_SHUFFLEREPEAT         | Shuffle repeat        |
| LP_SPOTIFY_SHUFFLE               | Shuffle               |
| LP_SPOTIFY_DEFAULT               | Default               |
| LP_SPOTIFY_SINGLE_REPEAT_SHUFFLE | Shuffle single repeat |


### LPDeviceChannel

| 类型             | 接口说明   |
| ---------------- | ------------- |
| LPChannel_stereo | Stereo        |
| LPChannel_left   | Left channel  |
| LPChannel_right  | Right channel |


### LPPlayStatus

| 类型                             | 接口说明      |
| -------------------------------- | ---------------- |
| LP_PLAYER_STATE_PLAYING          | Playing          |
| LP_PLAYER_STATE_STOPPED          | Stop             |
| LP_PLAYER_STATE_PAUSED_PLAYBACK  | Pause            |
| LP_PLAYER_STATE_TRANSITIONING    | Transitioning    |
| LP_PLAYER_STATE_NO_MEDIA_PRESENT | No media present |


### LPRoomState

| 类型           | 接口说明    |
| -------------- | -------------- |
| LP_ROOM_MASTER | Master speaker |
| LP_ROOM_SLAVE  | Slave speaker  |


### LPMediaObj

| 类型        | 接口说明 |
| ----------- | ----------- |
| title       | 名称        |
| mediaID     | Server ID   |
| serverIndex | index       |


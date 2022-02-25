# Device Discover

# Overview 

This sdk implements the functions that discover devices in the same LAN, includes device online/offline, get device object through device uuid and so on.

![server_error](./images/69731079.jpg)
![server_error](./images/69731080.jpg)

# API Reference 

### Device Discover

#### Device Discover
- Description

    Search devices in the same LAN
    
    ``` ObjectiveC
    - (void)start:(NSString *)searchKey;
    ```

- Parameter

| Name      | Type                     | Description                                               |
| :-------- | :----------------------- | :----------------------------------------------------     |
| key       | NSString                 | The key to search device, you can ignore this by default. |

- Response

    N/A

- Sample Code

    ``` ObjectiveC
    [[LPDeviceManager sharedInstance] search:@""];
    ```

#### Stop Search

- Description

    ``` ObjectiveC
    - (void)stop;
    ```

- Parameter

    N/A

### Observer

#### Add Observer

- Description

    ``` ObjectiveC
    - (void)addObserver:(id<LPDeviceManagerObserver>)observer;
    ```

- Parameter

| Name     | Type                    | Description                                          |
| -------- | ----------------------- | ---------------------------------------------------- |
| observer | LPDeviceManagerObserver | The observer to receive online/offline notify        |

- Response

    N/A

- Sample Code

    ``` ObjectiveC
    [[LPDeviceManager sharedInstance] addObserver:self];
    ```

#### Remove Observer

- Description

    ``` ObjectiveC
    - (void)removeObserver:(id<LPDeviceManagerObserver>)observer;
    ```

- Parameter

| Name     | Type                    | Description                                    |
| -------- | ----------------------- | ---------------------------------------------- |
| observer | LPDeviceManagerObserver | The observer to receive online/offline notify  |

- Response

    N/A

- Sample Code

    ``` ObjectiveC
    [[LPDeviceManager sharedInstance] removeObserver:self];
    ```

### Get Device

#### Get Device with UUID

- Description

    ``` ObjectiveC
    - (LPDevice *)deviceForID:(NSString *)UUID;
    ```

- Parameter

| Name      | Type                     | Description                                     |
| :-------- | :----------------------- | :---------------------------------------------- |
| UUID      | NSString                 | Device UUID                                     |

- Response

| Type               | Description                              |
| :----------------- | :--------------------------------------- |
| LPDevice           | Device object                            |


- Sample Code

    ``` ObjectiveC
    LPDevice *device = [[LPDeviceManager sharedInstance] deviceForID:UUID];
    ```

#### Get Device List

- Description

    ``` ObjectiveC
    - (NSArray<LPDevice *> *)getMasterDevices;
    ```
- Parameter

    N/A

- Response

| Type               | Description                              |
| :----------------- | :--------------------------------------- |
| NSArray<LPDevice>  | Device list                              |

- Sample Code

    ``` ObjectiveC
    self.deviceListArray = [[LPDeviceManager sharedInstance] getMasterDevices];
    ```

#### Get Device with IP

- Description

    ``` ObjectiveC
    - (LPDevice *)deviceForIP:(NSString *)IP;
    ```

- Parameter

| Name      | Type                     | Description                                     |
| :-------- | :----------------------- | :---------------------------------------------- |
| IP        | NSString                 | Device IP                                       |

- Response

| Type               | Description                              |
| :----------------- | :--------------------------------------- |
| LPDevice           | Device object                            |


- Sample Code

    ``` ObjectiveC
    LPDevice *device = [[LPDeviceManager sharedInstance] deviceForIP:IP];
    ```

#### Get Device with MAC

- Description

    ``` ObjectiveC
    - (LPDevice *)deviceForMAC:(NSString *)MAC;
    ```

- Parameter

| Name      | Type                     | Description                                     |
| :-------- | :----------------------- | :---------------------------------------------- |
| MAC       | NSString                 | Device MAC                                      |


- Response

| Type               | Description                              |
| :----------------- | :--------------------------------------- |
| LPDevice           | Device object                            |

- Sample Code

    ``` ObjectiveC
    LPDevice *device = [[LPDeviceManager sharedInstance] deviceForIP:MAC];
    ```

#### Get Slave Devices with Master UUID

- Description

    ``` ObjectiveC
    -(NSArray<LPDevice *> *)slaveDeviceArray:(NSString *)UUID;
    ```

- Parameter

| Name      | Type                     | Description                                     |
| :-------- | :----------------------- | :---------------------------------------------- |
| UUID      | NSString                 | Device UUID                                     |


- Response

| Type               | Description                              |
| :----------------- | :--------------------------------------- |
| NSArray<LPDevice>  | Slave device list                        |

- Sample Code

    ``` ObjectiveC
    NSArray *slaveListArray = [[LPDeviceManager sharedInstance] slaveDeviceArray:UUID];
    ```

#### Get Master Device with Slave Device

- Description

    ``` ObjectiveC
    -(LPDevice *)getMasterDeviceWithSlaveDevice:(LPDevice *)device;
    ```

- Parameter

| Name      | Type                     | Description                                     |
| :-------- | :----------------------- | :---------------------------------------------- |
| device    | LPDevice                 | Device object                                   |

- Response

| Type               | Description                              |
| :----------------- | :--------------------------------------- |
| LPDevice           | Device object                            |

- Sample Code

    ``` ObjectiveC
        // The result may be empty
        LPDevice *masterDevice = [[LPDeviceManager sharedInstance] getMasterDeviceWithSlaveDevice:slaveDevice];
    ```

#### Switch SDK Log

- Description

    ``` ObjectiveC
    - (void)debugSwitch:(BOOL)logOn;
    ```

- Parameter

| Name      | Type                     | Description                                     |
| :-------- | :----------------------- | :---------------------------------------------- |
| logOn     | BOOL                     | Log Switch                                      |


- Response

    N/A

### Remove Device

#### Remove Device

- Description

    ``` ObjectiveC
    - (void)removeDevice:(NSString *)UUID;
    ```

- Parameter

| Name      | Type                     | Description                                     |
| :-------- | :----------------------- | :---------------------------------------------- |
| UUID      | NSString                 | Device UUID                                     |

- Response

    N/A

- Sample Code

    ``` ObjectiveC
    [[LPDeviceManager sharedInstance] removeDevice:UUID];
    ```

### Online/Offline Delegate

- LPDeviceManagerObserver

| Name               | Type      | Description                  |
| :----------------- | :-------- | :--------------------------- |
| onLPDeviceOnline   | LPDevice  | Device Online                |
| onLPDeviceOffline  | LPDevice  | Device Offline               |
| onLPDeviceUpdate   | LPDevice  | Device Update                |


#### - (LPDevicePlayer *)getPlayer;

- Description

    Get Device's player.

- Parameter

    N/A

- Response

| Type           | Description   |
| -------------- | ------------- |
| LPDevicePlayer | Player object |

#### - (LPDevicePreset *)getPreset;

- Description

    Get Preset object

- Parameter

    N/A

- Response

| Type           | Description   |
| -------------- | ------------- |
| LPDevicePreset | Preset object |

#### - (LPDeiceAlarm *)getAlarm;

- Description

    Get alarm object

- Parameter

    N/A

- Response

| Type          | Description  |
| ------------- | ------------ |
| LPDeviceAlarm | Alarm object |

#### - (LPDeviceTimer *)getTimer;

- Description

    Get shutdown timer object

- Parameter

    N/A

- Response

| Type          | Description           |
| ------------- | --------------------- |
| LPDeviceTimer | Shutdown timer object |

#### - (LPPassthrough *)getPassthrough;

- Description

    Get pass through object

- Parameter

    N/A

- Response

| Name | Type          | Description         |
| ---- | ------------- | ------------------- |
| mcu  | LPPassThrough | Pass through object |

#### - (LPDeviceOTA *)getOTA;

- Description

    Get OTA object

- Parameter

    N/A

- Response

| Type        | Description |
| ----------- | ----------- |
| LPDeviceOTA | OTA object  |

#### Property

| Name       | Type           | Description          |
| ---------- | -------------- | -------------------- |
| player     | LPDevicePlayer | Player object        |
| preset     | LPDevicePreset | Preset object        |
| status     | LPDeviceStatus | Device status object |
| alarm      | LPDeviceAlarm  | Alarm object         |
| timer      | LPDeviceTimer  | Timer object         |
| mediaInfo  | LPMediaInfo    | Media info object    |
| deviceInfo | LPDeviceInfo   | Device info object   |


## Device current info and browse
### LPDeviceInfo 
  Current information and queries played by the device

### Property 

| Name              | Type     | Description                |
| ------------------| -------- | -------------------        |
| playStatus        | NSString | Current play status |
| playMode          | int      | Play mode           |
| mediaType         | NSString | Media Type          |
| trackSource       | NSString | Track source        |
| ...               | ...      | ...                 |

 - currentQueue

   The name of the playlist queue currently being played, and the updateCurrentPlayInfo or browserQueue method needs to be called to assign a value
 - currentPlayIndex

   The index of the currently playing song in the currently playing playlist. Only when the updateCurrentPlayInfo or browserQueue method is called, will the value be assigned 

### Function

#### Update Current Play Info

- Description

    To set the current display device or switch the current display device, you need to call this method once. Can be used to update the values of currentQueue and currentPlayIndex in deviceInfo

    ``` ObjectiveC
    - (void)updateCurrentPlayInfo;
    ```

- Parameter

    N/A

- Response

    N/A

- Sample Code

    ``` ObjectiveC
    [device.deviceInfo updateCurrentPlayInfo];
        
    ```

#### Browse Queue

- Description

    Browse device information, the result obtained can be converted to the data structure by [[LPMDPKitManager shared] getBrowseListWithString: result]

    ``` ObjectiveC
    - (void)browseQueue:(NSString *_Nullable)queueName skipContent:(BOOL)skip completionHandler:(LPBrowseBlock _Nullable)completionHandler;
    ```

- Parameter

| Name          | Type         | Description                                                                            |
| :------------ | :------------| :------------------------------------------------------------------------------------  |
| queueName     | NSString     | The value is @"TotalQueue", @"CurrentQueue", @"USBDiskQueue" or the queue name of the  |
| skip          | BOOL         | The default is NO                                                                      |

- Response

    N/A

- Sample Code

    ``` ObjectiveC
    [device.deviceInfo browseQueue:@"CurrentQueue" skipContent:NO completionHandler:^(id  _Nullable obj, NSString * _Nullable resultString) {
        NSLog(@"currentQueue = %@", device.deviceInfo.currentQueue);
        NSLog(@"currentPlayIndex = %d", device.deviceInfo.currentPlayIndex);
        LPPlayMusicList *musicListObj = [[LPMDPKitManager shared] getBrowseListWithString:resultString];
    }];
    ```

## LPMediaInfo

### Function 

    N/A

### Property 

| Name   | Type     | Description |
| ------ | -------- | ----------- |
| title  | NSString | Title       |
| artist | NSString | Artist      |
| album  | NSString | Album       |
| ...    | ...      | ...         |


## LPDeviceStatus 

### Function 

    N/A

### Property 

| Name         | Type     | Description            |
| ------------ | -------- | ---------------------- |
| UUID         | NSString | UUID                   |
| IP           | int      | IP                     |
| WiFiStrength | float    | Wi-Fi signal strength  |
| MAC          | NSString | MAC                    |
| SSID         | NSString | SSID                   |
| friendlyName | NSString | Device's friendly Name |
| version      | NSString | Firmware version       |
| language     | int      | Prompt tone language   |
| release      | NSString | Compiled date          |

## Other Definitions

### LPPlayMode

| Type             | Description    |
| ---------------- | -------------- |
| LP_LISTREPEAT    | Loop playback  |
| LP_SINGLEREPEAT  | Single cycle   |
| LP_SHUFFLE       | Shuffle        |
| LP_SHUFFLEREPEAT | Shuffle repeat |
| LP_DEFAULT       | Default        |

### LPSpotifyPlayMode

| Type                             | Description           |
| -------------------------------- | --------------------- |
| LP_SPOTIFY_LISTREPEAT            | Loop playback         |
| LP_SPOTIFY_SINGLEREPEAT          | Single cycle          |
| LP_SPOTIFY_SHUFFLEREPEAT         | Shuffle repeat        |
| LP_SPOTIFY_SHUFFLE               | Shuffle               |
| LP_SPOTIFY_DEFAULT               | Default               |
| LP_SPOTIFY_SINGLE_REPEAT_SHUFFLE | Shuffle single repeat |


### LPDeviceChannel

| Type             | Description   |
| ---------------- | ------------- |
| LPChannel_stereo | Stereo        |
| LPChannel_left   | Left channel  |
| LPChannel_right  | Right channel |


### LPPlayStatus

| Type                             | Description      |
| -------------------------------- | ---------------- |
| LP_PLAYER_STATE_PLAYING          | Playing          |
| LP_PLAYER_STATE_STOPPED          | Stop             |
| LP_PLAYER_STATE_PAUSED_PLAYBACK  | Pause            |
| LP_PLAYER_STATE_TRANSITIONING    | Transitioning    |
| LP_PLAYER_STATE_NO_MEDIA_PRESENT | No media present |


### LPRoomState

| Type           | Description    |
| -------------- | -------------- |
| LP_ROOM_MASTER | Master speaker |
| LP_ROOM_SLAVE  | Slave speaker  |


### LPMediaObj

| Type        | Description |
| ----------- | ----------- |
| title       | Name        |
| mediaID     | Server ID   |
| serverIndex | index       |


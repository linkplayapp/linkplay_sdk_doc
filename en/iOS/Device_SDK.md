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


[LPDevicePlayer]

### Function 

#### - (void)play:(LPPlayerBlock _Nullable)completionHandler;

- Description

    Play

- Parameter
  
    N/A

#### - (void)pause:(LPPlayerBlock _Nullable)completionHandler;

- Description

    Pause

- Parameter

    N/A

#### - (void)stop:(LPPlayerBlock _Nullable)completionHandler;

- Description

    Stop

- Parameter
  
    N/A

#### - (void)next:(LPPlayerBlock _Nullable)completionHandler;

- Description

    Next

- Parameter
  
    N/A

#### - (void)previous:(LPPlayerBlock _Nullable)completionHandler;

- Description

    Previous

- Parameter

    N/A

#### - (void)setProgress:(NSTimeInterval)progress completionHandler:(LPPlayerBlock _Nullable)completionHandler;

- Description
    
    Set play progress

- Parameter

| Name     | Type           | Description   |
| -------- | -------------- | ------------- |
| progress | NSTimeInterval | Play progress |


#### - (void)setPlayMode:(LPPlayMode)playMode;

- Description

    Set play mode

- Parameter

| Name     | Type       | Description |
| -------- | ---------- | ----------- |
| playMode | LPPlayMode | Play mode   |

- Sample Code

    ``` ObjectiveC
        if ([device.mediaInfo.mediaType isEqualToString:SPOTIFY_SOURCE]) {
            LPSpotifyPlayMode mode = LP_SPOTIFY_LISTREPEAT;
            [[device getPlayer] setSpotifyPlayMode:mode];
        }else {
            LPPlayMode mode = LP_SHUFFLEREPEAT;
            [[device getPlayer] setPlayMode:mode];
        }
    ```

#### - (void)setSpotifyPlayMode:(LPSpotifyPlayMode)spotifyPlayMode;

- Description

    Set Spotify play mode

- Parameter

| Name            | Type              | Description |
| --------------- | ----------------- | ----------- |
| spotifyPlayMode | LPSpotifyPlayMode | Play mode   |

- Sample Code

    ``` ObjectiveC
        if ([device.mediaInfo.mediaType isEqualToString:SPOTIFY_SOURCE]) {
            LPSpotifyPlayMode mode = LP_SPOTIFY_LISTREPEAT;
            [[device getPlayer] setSpotifyPlayMode:mode];
        }else {
            LPPlayMode mode = LP_SHUFFLEREPEAT;
            [[device getPlayer] setPlayMode:mode];
        }
    ```

#### - (void)setChannel:(LPDeviceChannel)channel completionHandler:(LPPlayerBlock _Nullable)completionHandler;

- Description

Set sound channel

- Parameter

| Name    | Type            | Description   |
| ------- | --------------- | ------------- |
| channel | LPDeviceChannel | Sound channel |

- Sample Code

    ``` ObjectiveC
        LPDeviceChannel channel = LPChannel_left;
        [[device getPlayer] setChannel:channel completionHandler:^(BOOL isSuccess, NSString * _Nullable result) {
            if (isSuccess) {
                NSLog(@"Channel setup successful");
            }
        }];
    ```

#### - (void)setVolume:(CGFloat)volume single:(BOOL)single;

- Description

    Set volume

- Parameter

| Name   | Type    | Description     |
| ------ | ------- | --------------- |
| volume | CGFloat | Device's volume |

#### - (void)playAudioWithMusicDictionary:(NSDictionary *)musicDictionary completionHandler:(LPPlayerBlock _Nullable)completionHandler;

- Description

    Play music

- Parameter

| Name            | Type         | Description        |
| --------------- | ------------ | ------------------ |
| musicDictionary | NSDictionary | Media info to play |

- Sample Code

    ``` ObjectiveC
      [[LPMediaLibManager sharedInstance] searchSongs:nil completionHandler:^(LPPlayMusicList * _Nonnull musicListObj) {
                musicListObj.index = index;
                NSDictionary *info = [[LPMDPKitManager shared] playMusicSingleSource:listObj];
                [self.devicePlayer playAudioWithMusicDictionary:info completionHandler:^(BOOL isSuccess, NSString * _Nullable result) {
                    if (isSuccess) {
                        NSLog(@"Play success");
                    }
                }];
            }];
    ```

#### - (void)deleteWithIndex:(NSInteger)index completionHandler:(LPPlayerBlock _Nullable)completionHandler;

- Description

    Delete a track from current playing list

- Parameter

| Name  | Type | Description                       |
| ----- | ---- | --------------------------------- |
| index | int  | Index in the current playing list |

- Sample Code

    ``` ObjectiveC
        [[device getPlayer] deleteWithIndex:index completionHandler:^(BOOL isSuccess, NSString * _Nullable result) {
           if (isSuccess) {
               NSLog(@"Successfully delete a song from the playlist");
           }
        }];
    ```

### Property 

| Name      | Type        | Description    |
| --------- | ----------- | -------------- |
| index     | int         | Play progress  |
| duration  | float       | Total duration |
| channel   | int         | Sound channel  |
| mode      | int         | Play mode      |
| mediaInfo | LPMediaInfo | Media info     |

## LPMediaInfo

### Function 

deleteWithIndex

    N/A

### Property 

| Name   | Type     | Description |
| ------ | -------- | ----------- |
| title  | NSString | Title       |
| artist | NSString | Artist      |
| album  | NSString | Album       |
| ...    | ...      | ...         |

## LPDeviceInfo 

### Property 

| Name        | Type     | Description         |
| ----------- | -------- | ------------------- |
| playStatus  | NSString | Current play status |
| playMode    | int      | Play mode           |
| mediaType   | NSString | Media Type          |
| trackSource | NSString | Track source        |
| ...         | ...      | ...                 |


## LPDevicePreset

- [Linkplay Preset
    SDK](https://confluence.linkplay.co/display/AT/en+iOS+Linkplay+Preset+SDK)

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

### LPDeviceAlarm 

- [Linkplay Alarm
    SDK](https://confluence.linkplay.co/display/AT/en+iOS+Linkplay+Alarm+SDK)

### LPDeviceTimer 

- [iOS Linkplay Timer
    SDK](https://confluence.linkplay.co/display/AT/en+iOS+Linkplay+Timer+SDK)

### LPDeviceMCU 

- [Linkplay Passthrough
    SDK](https://confluence.linkplay.co/display/AT/en+iOS+Linkplay+Passthrough+SDK)

### LPDeviceOTA

- [Linkplay Preset
    SDK](https://confluence.linkplay.co/display/AT/en+iOS+Linkplay+Preset+SDK)

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


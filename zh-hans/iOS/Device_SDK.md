# Device_SDK

# Overview 

The main Function in SDK includes device management, multi-room
music(MRM), music control and device control and so on.

Device management includes device online/offline, get the device object
which used to communicate with the device; MRM includes room setup,
dismiss, change room name etc.; Music control includes playview related
information management, playlist management etc.; Device control is the
common control function, like preset, alarm setup, OTA etc. 

![server_error](./images/69731079.jpg)
![server_error](./images/69731080.jpg)

# API Reference 

## LPDeviceManager 

Singleton, manage the device online & offline.

### Function 

#### - (void)search:(NSString *)searchKey;

- Description

    Start discover devices.

- Parameter

| Name | Type     | Description                                                                                                                                  |
| ---- | -------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| key  | NSString | Default use empty string, if you want to distinguish your device from others, then this key should be the same with the firmware definition. |

- Return

    N/A

- Sample code

    ``` ObjectiveC
    [[LPDeviceManager sharedInstance] search:@""];
    ```

#### stop

- Description

    Stop discovering.

- Parameter

    N/A

#### - (void)addObserver:(id<LPDeviceManagerObserver>)observer;

- Description

    Add observer to receive the callback.

- Parameter

| Name     | Type                    | Description                                          |
| -------- | ----------------------- | ---------------------------------------------------- |
| observer | LPDeviceManagerObserver | Object to deal with the device online/offline event. |

- Return

    N/A

- Sample code

    ``` ObjectiveC
    [[LPDeviceManager sharedInstance] addObserver:self];
    ```

#### - (void)removeObserver:(id<LPDeviceManagerObserver>)observer;

- Description

    Remove the observer.

- Parameter

| Name     | Type                    | Description                                          |
| -------- | ----------------------- | ---------------------------------------------------- |
| observer | LPDeviceManagerObserver | Object to deal with the device online/offline event. |

- Return

    N/A

- Sample code

    ``` ObjectiveC
    [[LPDeviceManager sharedInstance] removeObserver:self];
    ```

#### - (LPDevice *)deviceForID:(NSString *)UUID;

- Description

    Get device object with UUID.

- Parameter

| Name | Type     | Description |
| ---- | -------- | ----------- |
| UUID | NSString | Device UUID |

- Return

| Type     | Description   |
| -------- | ------------- |
| LPDevice | Device object |


- Sample code

    ``` ObjectiveC
    LPDevice *device = [[LPDeviceManager sharedInstance] deviceForID:UUID];
    ```

#### - (NSArray<LPDevice *> *)getMasterDevices;

- Description

    Get all master devices, which is the master of the multi-room to play music synchronized.

- Parameter

    N/A

- Return

| Type              | Description        |
| ----------------- | ------------------ |
| NSArray<LPDevice> | Device object list |

- Sample code

    ``` ObjectiveC
    self.deviceListArray = [[LPDeviceManager sharedInstance] getMasterDevices];
    ```

#### - (LPDevice *)deviceForIP:(NSString *)IP;

- Description

    Get device object with IP.

- Parameter

| Name | Type     | Description |
| ---- | -------- | ----------- |
| IP   | NSString | Device IP   |

- Return

| Type     | Description   |
| -------- | ------------- |
| LPDevice | Device object |


- Sample code

    ``` ObjectiveC
    LPDevice *device = [[LPDeviceManager sharedInstance] deviceForIP:IP];
    ```

#### - (LPDevice *)deviceForMAC:(NSString *)MAC;

- Description

    Get device object with MAC.

- Parameter

| Name | Type     | Description |
| ---- | -------- | ----------- |
| MAC  | NSString | Device MAC  |


- Return

| Type     | Description   |
| -------- | ------------- |
| LPDevice | Device object |

- Sample code

    ``` ObjectiveC
    LPDevice *device = [[LPDeviceManager sharedInstance] deviceForIP:MAC];
    ```

#### - (void)debugSwitch:(BOOL)logOn;

- Description

    Switch on/off for the SDK log.

- Parameter

| Name  | Type | Description |
| ----- | ---- | ----------- |
| logOn | BOOL | log switch  |


- Return

    N/A

#### - (void)removeDevice:(NSString *)UUID;

- Description

    Delete cached device with UUID. If the device is actually discoverable, then SDK would discover it again.

- Parameter

| Name | Type     | Description |
| ---- | -------- | ----------- |
| UUID | NSString | Device UUID |

- Return

    N/A

- Sample code

    ``` ObjectiveC
    [[LPDeviceManager sharedInstance] removeDevice:UUID];
    ```

#### -(NSArray<LPDevice *> *)slaveDeviceArray:(NSString *)UUID;

- Description

    Get master device's slave device list.

- Parameter

| Name | Type     | Description |
| ---- | -------- | ----------- |
| UUID | NSString | Device UUID |

- Return

| Type           | Description        |
| -------------- | ------------------ |
| List<LPDevice> | Device object list |


- Sample code

    ``` ObjectiveC
    NSArray *slaveListArray = [[LPDeviceManager sharedInstance] slaveDeviceArray:UUID];
    ```

#### -(LPDevice *)getMasterDeviceWithSlaveDevice:(LPDevice *)device;

- Description

    Get slave device's master device.

- Parameter

| Name   | Type     | Description  |
| ------ | -------- | ------------ |
| device | LPDevice | Slave device |

- Return

| Type     | Description   |
| -------- | ------------- |
| LPDevice | Device object |

- Sample code

    ``` ObjectiveC
        // The result may be empty
        LPDevice *masterDevice = [[LPDeviceManager sharedInstance] getMasterDeviceWithSlaveDevice:slaveDevice];
    ```

### Property 

| Name       | Type  | Description                       |
| ---------- | ----- | --------------------------------- |
| devicelist | array | All discovered device object list |


LPDevice 

### Function 

#### - (LPDevicePlayer *)getPlayer;

- Description

    Get Device's player.

- Parameter

    N/A

- Return

| Type           | Description   |
| -------------- | ------------- |
| LPDevicePlayer | Player object |

#### - (LPDevicePreset *)getPreset;

- Description

    Get Preset object

- Parameter

    N/A

- Return

| Type           | Description   |
| -------------- | ------------- |
| LPDevicePreset | Preset object |

#### - (LPDeiceAlarm *)getAlarm;

- Description

    Get alarm object

- Parameter

    N/A

- Return

| Type          | Description  |
| ------------- | ------------ |
| LPDeviceAlarm | Alarm object |

#### - (LPDeviceTimer *)getTimer;

- Description

    Get shutdown timer object

- Parameter

    N/A

- Return

| Type          | Description           |
| ------------- | --------------------- |
| LPDeviceTimer | Shutdown timer object |

#### - (LPPassthrough *)getPassthrough;

- Description

    Get pass through object

- Parameter

    N/A

- Return

| Name | Type          | Description         |
| ---- | ------------- | ------------------- |
| mcu  | LPPassThrough | Pass through object |

#### - (LPDeviceOTA *)getOTA;

- Description

    Get OTA object

- Parameter

    N/A

- Return

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

- Sample code

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

- Sample code

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

- Sample code

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

- Sample code

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

- Sample code

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
| mediaType   | NSString | Media type          |
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
| friendlyName | NSString | Device's friendly name |
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

### Delegate 

- LPDeviceManagerObserver

| Name              | Type     | Description                 |
| ----------------- | -------- | --------------------------- |
| onLPDeviceOnline  | LPDevice | Device online notification  |
| onLPDeviceOffline | LPDevice | Device offline notification |
| onLPDeviceUpdate  | LPDevice | Device update notification  |


### Constant 

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


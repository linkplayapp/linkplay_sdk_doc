# Device Control

# Overview

This SDK implements most of the device related functions, includes play control, settings, preset, alarm and so on.

### Play Control

#### Get Play Control Object

- Description

    ``` ObjectiveC
    - (LPDevicePlayer *)getPlayer;
    ```

- Parameter

    N/A

- Response

| Type               | Description                              |
| :----------------- | :--------------------------------------- |
| LPDevicePlayer     | Play control object                      |


#### Play

- Description

    ``` ObjectiveC
    - (void)play:(LPPlayerBlock _Nullable)completionHandler;
    ```

- Parameter

    N/A

- Response

    N/A

#### Pause

- Description

    ``` ObjectiveC
    - (void)pause:(LPPlayerBlock _Nullable)completionHandler;
    ```

- Parameter

    N/A

- Response

    N/A

#### Stop

- Description

    ``` ObjectiveC
    - (void)stop:(LPPlayerBlock _Nullable)completionHandler;
    ```

- Parameter

    N/A

- Response

    N/A

#### Next

- Description

    ``` ObjectiveC
    - (void)next:(LPPlayerBlock _Nullable)completionHandler;
    ```

- Parameter

    N/A

- Response

    N/A

#### Previous

- Description

    ``` ObjectiveC
    - (void)previous:(LPPlayerBlock _Nullable)completionHandler;
    ```

- Parameter

    N/A

- Response

    N/A

#### Play Music

Get the play info from music source SDK and pass it to device withi this function. You can use LPMDPKitManager SDK to translate LPPlayMusicList object to musicDictionary


- Description

    ``` ObjectiveC
    - (void)playAudioWithMusicDictionary:(NSDictionary *)musicDictionary completionHandler:(LPPlayerBlock _Nullable)completionHandler;
    ```

- Parameter

| Name             | Type                       | Description                                     |
| :--------------- | :----------------------- - | :---------------------------------------------- |
| musicDictionary  | NSDictionary               | Music info to play                              |

- Response

    N/A

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

#### Next to Play

Insert song to next play

- Description

    ``` ObjectiveC
    - (void)nextPlay:(NSDictionary *)musicDictionary completionHandler:(LPPlayerBlock _Nullable)completionHandler;
    ```

- Parameter

| Name             | Type                       | Description                                     |
| :--------------- | :----------------------- - | :---------------------------------------------- |
| musicDictionary  | NSDictionary               | Music content to play                           |

- Response

    N/A

- Sample Code

    ``` ObjectiveC
    LPMSLibraryPlayItem *item = (LPMSLibraryPlayItem *)self.musicListObj.list[2];
    LPMediaSourceAction *action = [[LPMediaSourceAction alloc] init];
    LPPlayMusicList *songObj = [[LPPlayMusicList alloc] init];
     songObj.account = self.musicListObj.account;
     songObj.header = self.musicListObj.header;
     songObj.list = @[item];
     songObj.index = 0;
     songObj.customPresetName = self.musicListObj.customPresetName;
    
    [[LPMDPKitManager shared] addToNextPlayWithDeviceId:self.uuid playMusicList:self.musicListObj deviceAction:action block:^(NSDictionary * _Nonnull dictionary) {
        if (dictionary) {
            [self.devicePlayer nextPlay:dictionary completionHandler:^(BOOL isSuccess, NSString * _Nullable result) {
                if (isSuccess) {
                    NSLog(@"Next Play successfully");
                }
            }];
        }
    }];
    ```

#### Play USB songs

- Description

    ``` ObjectiveC
    - (void)playUSBSongsWithIndex:(int)index completionHandler:(LPPlayerBlock _Nullable)completionHandler;
    ```

- Parameter

| Name       | Type     | Description                                                          |
| :----------| :--------| :------------------------------------------------------------------- |
| index      | int      | Song index                                                           |

- Response

    N/A

- Sample Code

    ``` ObjectiveC
    self.musicListObj.index = (int)indexPath.row;
    [self.devicePlayer playUSBSongsWithIndex:(int)indexPath.row completionHandler:^(BOOL isSuccess, NSString * _Nullable result) {
        if (isSuccess) {
            NSLog(@"Play USB song successfully");
        }
    }];
    ```

#### Play Current Playlist Song

- Description

    ``` ObjectiveC
    - (void)playCurrentPlayListWithIndex:(int)index completionHandler:(LPPlayerBlock _Nullable)completionHandler;
    ```

- Parameter

| Name       | Type     | Description                                                                                         |
| :----------| :--------| :-------------------------------------------------------------------------------------------------- |
| index      | int      | The index of the song in the current playlist, you can get the playlist from (queryCurrentPlayList) |

- Response

    N/A

- Sample Code

    ``` ObjectiveC
    [self.devicePlayer queryCurrentPlayList:^(BOOL isSuccess, NSString * _Nullable result) {
        LPPlayMusicList *musicListObj = [[LPMDPKitManager shared] getBrowseListWithString:result];
        [self.devicePlayer playCurrentPlayListWithIndex:4 completionHandler:^(BOOL isSuccess, NSString * _Nullable result) {
            NSLog(@"Play successfully");
        }];
    }];
    ```

#### Remove Music from Current Playlist

- Description

    ``` ObjectiveC
    - (void)deleteWithIndex:(NSInteger)index completionHandler:(LPPlayerBlock _Nullable)completionHandler
    ```

- Parameter

| Name             | Type                       | Description                                     |
| :--------------- | :----------------------- - | :---------------------------------------------- |
| index            | NSInteger                  | Index in current playlist                          |

- Response

    N/A

- Sample Code

    ``` ObjectiveC
    [[device getPlayer] browseCurrentQueueWithcompletionHandler:^(BOOL isSuccess, NSString * _Nullable result) {
        LPPlayMusicList *musicListObj = [[LPMDPKitManager shared] getBrowseListWithString:result];
        NSLog(@"Current list = %@", musicListObj.list);
        [[device getPlayer] deleteWithIndex:index completionHandler:^(BOOL isSuccess, NSString * _Nullable result) {
            if (isSuccess) {
                NSLog(@"Delete index success");
            }
        }];
        
    }];
    ```


### Alarm

We wrapper the alarm related functions of the device here. <br>

You can create, edit, remove, enable/disable alarms. <br>

You can easily setting the time, interval, wakeup sound and other attributes of an alarm. <br>

#### Alarm List

- Description

    ``` ObjectiveC
    - (void)getAlarms:(LPGetAlarmBlock _Nullable)completionHandler;
    ```

- Parameter

    N/A

- Response

    N/A

- Sample Code

    ``` ObjectiveC
    [device.getAlarm getAlarms:^(NSString * _Nullable alarmString) {
        NSArray *alarmList = [[LPMDPKitManager shared] getAlarmDataWithString:alarmString];
    }];
    ```

#### Create Alarm

- Description

    ``` ObjectiveC
    - (void)addAlarmWithInfomation:(NSDictionary *)infomation completionHandler:(LPAlarmBlock _Nullable)completionHandler;
    ```

- Parameter

| Name            | Type                     | Description                                     |
| :-------------- | :----------------------- | :---------------------------------------------- |
| Infomation      | NSDictionary             | Alarm config                               |

- Response

    N/A

- Sample Code

    ``` ObjectiveC
    LPAlarmList *tempObj = [[LPAlarmList alloc] init];
    tempObj.clockName = @“”;
    tempObj.trigger = LP_ALARM_TRIGGER_ONCE;
    tempObj.type = LP_ALARM_PLAYQUEUE;
    tempObj.volume = @"50";
    tempObj.enable = YES;
    NSDictionary *alarmDict = [[LPMDPKitManager shared] addAlarmDataWithClockList:tempObj];
    [alarm addAlarmWithInfomation:alarmDict completionHandler:^(BOOL isSuccess) {
        if (isSuccess) {
            NSLog(@"Add Alarm successfully");
        }else {
            NSLog(@"Add Alarm failed");
        }
    }];
    ```
- Note

    If the wakeup sound is an online music, and device can't play it (for example the token is invalid), then the device would play with the default ring sound.

#### Edit Alarm

- Description

    ``` ObjectiveC
    - (void)editAlarmWithInfomation:(NSDictionary *)infomation completionHandler:(LPAlarmBlock _Nullable)completionHandle;
    ```

- Parameter

| Name            | Type                     | Description                                     |
| :-------------- | :----------------------- | :---------------------------------------------- |
| Infomation      | NSDictionary             | Alarm config                               |

- Response

    N/A

- Sample Code

    ``` ObjectiveC
    LPAlarmList *Alarm = self.tempObj;
    Alarm.trigger = LP_ALARM_TRIGGER_ONCE;
    Alarm.type = LP_ALARM_PLAYQUEUE;
    Alarm.volume = @"60";
    NSDictionary *alarmDict = [[LPMDPKitManager shared] editAlarmDataWithClockList:Alarm];
    [alarm editAlarmWithInfomation:alarmDict completionHandler:^(BOOL isSuccess) {
        if (isSuccess) {
            NSLog(@"Edit Alarm successfully");
        }else {
            NSLog(@"Edit Alarm failed");
        }
    }];
    ```

#### Remove Alarm

- Description

    ``` ObjectiveC
    - (void)deleteAlarmWithName:(NSString *)name completionHandler:(LPAlarmBlock _Nullable)completionHandler;
    ```

- Parameter

| Name            | Type                     | Description                                     |
| :-------------- | :----------------------- | :---------------------------------------------- |
| name            | NSString                 | Alarm name                                      |

- Response

    N/A

- Sample Code

    ``` ObjectiveC
    LPAlarmList *Alarm = alarmArray[indexPath.row];
    LPDevice *device = [[LPDeviceManager sharedInstance] deviceForID:self.deviceId];
    LPDeiceAlarm *alarm = device.getAlarm;
    [alarm deleteAlarmWithName:Alarm.clockName completionHandler:^(BOOL isSuccess) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (isSuccess) {
                NSLog(@"successfully deleted");
            }
        });
    }];
    ```
    
#### Max Alarm Support

- Description

    ``` ObjectiveC
    - (int)getAlarmMaxNum;
    ```

- Parameter

    N/A

- Response

    int num，max alarm number device support

- Note

    You shouldn't create more alarms than the device support.

####  Enable/Disable Alarm

- Description

    ``` ObjectiveC
    - (void)setAlarmSwitchOnWithInfomation:(NSDictionary *)infomation completionHandler:(LPAlarmBlock _Nullable)completionHandler;
    ```

- Parameter

| Name            | Type                     | Description                                     |
| :-------------- | :----------------------- | :---------------------------------------------- |
| Infomation      | NSDictionary             | Alarm config                               |

- Response

    N/A

- Sample Code

    ``` ObjectiveC
    NSDictionary *alarmDict = [[LPMDPKitManager shared] setAlarmStatusWithOpen:switchButton.on clockList:Alarm];
    [alarm setAlarmSwitchOnWithInfomation:alarmDict completionHandler:^(BOOL isSuccess) {
     
    }];
    ```

### Preset

Preset is the function that store music or playlist in device's flash, so that user can play music without app, like using physical button on the device.

We implement the CURD of the preset function.<br>

This SDK needs to cooperate with the LPMDPKit to use. <br>

#### List

- Description

    ``` ObjectiveC
    - (void)getPresets:(LPGetPresetBlock _Nullable)completionHandler;
    ```

- Parameter

    N/A

- Response

    N/A

- Sample Code

    ``` ObjectiveC
    LPDevice *device = [[LPDeviceManager sharedInstance] deviceForID:self.deviceId];
    LPDevicePreset *devicePreset = device.getPreset;
    [devicePreset getPresets:^(int presetNumber, NSString * _Nullable presetString) {
       dispatch_async(dispatch_get_main_queue(), ^{
           self.keyArray = [[LPMDPKitManager shared] getPresetListDataWithNumber:presetNumber presetString:presetString];
           for (LPPlayMusicList *listObj in self.keyArray) {
               LPPlayHeader *header = listObj.header;
               NSLog(@"title = %@", header.headTitle);
           }
           NSLog(@"preset list = %@", self.keyArray);
        });
    }];
    ```

#### Update

- Description

    ``` ObjectiveC
    - (void)setPresetWithInfomation:(NSDictionary *)infomation completionHandler:(LPPresetBlock _Nullable)completionHandler;
    ```

- Parameter

| Name             | Type                     | Description                                          |
| :-------------- | :----------------------- | :---------------------------------------------- |
| Infomation      | NSDictionary             | 闹钟信息                                          |

- Response

    N/A

- Sample Code

    ``` ObjectiveC
    LPPlayMusicList *musicList = [[LPPlayMusicList alloc] init];
    LPPlayHeader *header = self.header;
    musicList.header = header;
    //Need preset songs
    LPPlayItem *item = self.item;
    musicList.list = @[item];
    musicList.index = (int)indexPath.row;
    musicList.account = self.account;
    NSDictionary *presetDict = [[LPMDPKitManager shared] updataPresetDataWithPlayMusicList:musicList devicePresetList:self.keyArray];
    LPDevice *device =[[LPDeviceManager sharedInstance] deviceForID:self.deviceId];
    LPDevicePreset *devicePreset = device.getPreset;
    [devicePreset setPresetWithInfomation:presetDict completionHandler:^(BOOL isSuccess) {
         dispatch_async(dispatch_get_main_queue(), ^{
             if (isSuccess) {
                 NSLog(@"Set preset successfully");
             }
         });
    }];
    ```

#### Remove

- Description

    ``` ObjectiveC
    - (void)deletePresetWithInfomation:(NSDictionary *)infomation completionHandler:(LPPresetBlock _Nullable)completionHandler;
    ```

- Parameter

| Name             | Type                     | Description                                          |
| :-------------- | :----------------------- | :---------------------------------------------- |
| Infomation      | NSDictionary             | 闹钟信息                                          |

- Response

    N/A

- Sample Code

    ``` ObjectiveC
    NSDictionary *presetDict = [[LPMDPKitManager shared] deletePresetDataWithIndex:index devicePresetList:self.keyArray];
    LPDevice *device =[[LPDeviceManager sharedInstance] deviceForID:self.deviceId];
    LPDevicePreset *devicePreset = device.getPreset;
    [devicePreset deletePresetWithInfomation:presetDict completionHandler:^(BOOL isSuccess) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (isSuccess) {
                NSLog(@"Delete preset successfully");
            }
        });
    }];
    ```

#### Play

- Description

    ``` ObjectiveC
    - (void)playPresetWithIndex:(NSInteger)index completionHandler:(LPPresetBlock _Nullable)completionHandler;
    ```

- Parameter

| Name             | Type                     | Description                                          |
| :-------------- | :----------------------- | :---------------------------------------------- |
| index           | int                      | 预置对象的索引                                     |

- Response

    N/A

- Sample Code

    ``` ObjectiveC
    LPDevice *device =[[LPDeviceManager sharedInstance] deviceForID:self.deviceId];
    LPDevicePreset *devicePreset = device.getPreset;
    [devicePreset playPresetWithIndex:indexPath.row + 1 completionHandler:^(BOOL isSuccess) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (isSuccess) {
                NSLog(@"Play successfully");
            }
        });
    }];
    ```

### Schedule Shutdown

You can schedule shutdown timer.

#### Enable

- Description

    Schedule shutdown timer.

    ``` ObjectiveC
    - (void)setTimerWithTime:(NSInteger)time completionHandler:(LPSDKReturnBlock _Nullable)completionHandler;
    ```

- Parameter

| Name            | Type                     | Description                                     |
| :-------------- | :----------------------- | :---------------------------------------------- |
| time            | int                      | Shutdown timer duration (s); -1 means cancel    |

- Response

    N/A

#### Get Scheduled Shutdown Timer

- Description

    Get current timer

    ``` ObjectiveC
    - (void)getTimer:(LPSDKReturnBlock _Nullable)completionHandler;
    ```

- Parameter

    N/A

- Response

    N/A


### OTA

When the firmware is upgraded, the device must be connected to Wi-Fi, and Wi-Fi must have a network to enable the OTA function. You can use the getDeviceInternetStatus method in LPDeviceInfo to determine whether the current device has a network. For the device, under normal circumstances, no matter whether the device upgrades successfully or fails, it will be connected to the Wi-Fi before the upgrade. If the upgrade fails for some reason, you can wait for the device to reconnect and try the upgrade again.<br><br>

 OTA SDK implments check, trigger function. When in OTA, there're 3 steps: download, updating, rebooting, which state is MV_UP_STATUS_DOWNLOAD_START, MV_UP_STATUS_WRITE_START, MV_UP_STATUS_REBOOT

- `LPOTATimeoutObj`

    You should config timeout for each step.

| Name                   | Type              | Description                                                 |
| ---------------------- | ----------------- | ----------------------------------------------------------- |
| FWDownloadTimeout      | int               | Firmware download timeout, default 120s                     |
| FWWriteTimeout         | int               | Firmware upgrade timeout, default 120s                      |
| FWRebootTimeout        | int               | Firmware reboot timeout, default 120s                       |
| MCUDownloadTimeout     | int               | MCU download timeout, default 120s                          |
| MCUWriteTimeout        | int               | MCU upgrade timeout, default 120s                           |
| MCURebootTimeout       | int               | MCU reboot timeout, default 120s                            |
| DSPDownloadTimeout     | int               | DSP download timeout, default 120s                          |
| DSPWriteTimeout        | int               | MCU upgrade timeout, default 120s                           |
| DSPRebootTimeout       | int               | MCU reboot timeout, default 120s                            |


- `LPOTAPercentObj`

    Response object return in OTA process

| Name                   | Type              | Description                                                 |
| ---------------------- | ----------------- | ----------------------------------------------------------- |
| downloadPercent        | float             | Download progress                                           |
| upgradePercent         | float             | Upgrade progress                                            |
| recatoryPercent        | float             | Reboot progress                                             |
| firmwareOTAStatus      | int               | OTAStatus                                                   |
| expectTime             | int               | OTA expect time                                             |
| totalPercent           | float             | Total progress                                              |


- `OTAStatus`

    OTA status

| Name                           | Description                                                 |
| ------------------------------ | ----------------------------------------------------------- |
| MV_UP_STATUS_UNKNOWN           | Unknown                                                     |
| MV_UP_STATUS_DOWNLOAD_START    | Download Start                                              |
| MV_UP_STATUS_DOWNLOAD_FAILED   | Download failed                                             |
| MV_UP_STATUS_WRITE_START       | Upgrade start                                               |
| MV_UP_STATUS_WRITE_FINISH      | Upgrade finish                                              |
| MV_UP_STATUS_WRITE_FAILED      | Upgrade failed                                              |
| MV_UP_STATUS_COMPLETE          | Upgrade complete                                            |
| MV_UP_STATUS_REBOOT            | Reboot                                                      |
| MV_UP_STATUS_NOT_IN_OTA        | Not in OTA                                                  |

#### Check New Version

- Description

    Check if there's new version

    ``` ObjectiveC
    - (BOOL)checkUpdate;
    ```

- Parameter

    N/A

- Response

    BOOL

- Note

    Don't call this function immediately after Wi-Fi setup; firmware needs time to check if there's new version

#### Start OTA

- Description

    ``` ObjectiveC
    - (void)firmwareStartUpdate:(LPOTATimeoutObj *)timeoutObj completionHandler:(LPFirmwareUpdateResultBlock)completionHandler;
    ```

- Parameter

| Name            | Type                     | Description                                     |
| :-------------- | :----------------------- | :---------------------------------------------- |
| timeoutObj      | LPOTATimeoutObj          | Timeout obj                                     |

- Response

    N/A

#### OTA Delegate

- Description

    OTA status, progress notify

    ``` ObjectiveC
    - (void)LPOTAPercentUpdate:(LPOTAPercentObj *)percentObj;
    ```

- Parameter

| Name            | Type                     | Description                                     |
| :-------------- | :----------------------- | :---------------------------------------------- |
| percentObj      | LPOTAPercentObj          | OTA status object                               |

- Response

    N/A

### MCU Passthrough

Firmware establish a TCP connection with app to communicate with the MCU directly.

####  NSNotification

There're 2 notifications in Passthrough SDK, which for transport data and show the connection status.

####  LPPassthroughConnectionStateChanged

- Description

    Passthrough connection status

    ``` ObjectiveC
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(passthroughConnectionStateChanged:) name:LPPassthroughConnectionStateChanged object:nil];
    ```

- Parameter

| Name            | Type                     | Description                                     |
| :-------------- | :----------------------- | :---------------------------------------------- |
| isConnected     | int                      | Connected of not                                |

- Response

    N/A

- Sample Code

    ``` ObjectiveC
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(passthroughConnectionStateChanged:) name:LPPassthroughConnectionStateChanged object:nil];
    
    // LPPassthroughConnectionStateChanged
    - (void)passthroughConnectionStateChanged:(NSNotification *)notificaiton {
        NSDictionary *dictionary = notificaiton.object;
        NSLog(@"isConnected = %@", dictionary[@"isConnected"]);
    }
    ```


####  LPPassThroughMessageCome

- Description

    Passthrough data received

    ``` ObjectiveC
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(passThroughMessageCome:) name:LPPassThroughMessageCome object:nil];
    ```

- Parameter

| Name            | Type                     | Description                                     |
| :-------------- | :----------------------- | :---------------------------------------------- |
| response        | NSString                 | Data passthrough from MCU                                   |

- Response

    N/A

- Sample Code

    ``` ObjectiveC
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(passThroughMessageCome:) name:LPPassThroughMessageCome object:nil];
    
    // LPPassThroughMessageCome
    - (void)passThroughMessageCome:(NSNotification *)notificaiton {
        NSDictionary *dictionary = notificaiton.object;
        NSLog(@"response = %@", dictionary[@"response"]);
    }
    ```

#### Establish Connection

- Description

    Establish connection for passthrough.

    ``` ObjectiveC
    - (void)connect;
    ```

- Parameter

    N/A

- Response

    N/A

- Sample Code

    ``` ObjectiveC
    [[device getPassthrough] connect];
    ```

####  Disconnect

- Description

    ``` ObjectiveC
    - (void)disConnect;
    ```

- Parameter

    N/A

- Response

    N/A

#### Send Data

- Description

    ``` ObjectiveC
    - (void)write:(NSString *)cmd;
    ```

- Parameter

| Name      | Type                     | Description                                     |
| :-------- | :----------------------- | :---------------------------------------------- |
| cmd       | NSString                 | Data send to MCU                                |

- Response

    N/A

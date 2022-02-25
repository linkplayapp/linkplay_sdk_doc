# 设备设置

# Overview 

设备对象包含了播控、设备设置、预置、闹钟等有关设备的功能


### 播放控制

#### 获取设备播控对象

- 接口说明

    ``` ObjectiveC
    - (LPDevicePlayer *)getPlayer;
    ```

- 参数

    无

- 返回值

| 类型               | 接口说明                                  |
| :-----------------| :--------------------------------------- |
| LPDevicePlayer    | 设备播控对象                               |


#### 播放

- 接口说明

    ``` ObjectiveC
    - (void)play:(LPPlayerBlock _Nullable)completionHandler;
    ```

- 参数

    无

- 返回值

    无

#### 暂停

- 接口说明

    ``` ObjectiveC
    - (void)pause:(LPPlayerBlock _Nullable)completionHandler;
    ```

- 参数

    无

- 返回值

    无

#### 停止播放

- 接口说明

    ``` ObjectiveC
    - (void)stop:(LPPlayerBlock _Nullable)completionHandler;
    ```

- 参数

    无

- 返回值

    无

#### 下一首

- 接口说明

    ``` ObjectiveC
    - (void)next:(LPPlayerBlock _Nullable)completionHandler;
    ```

- 参数

    无

- 返回值

    无

#### 上一首

- 接口说明

    ``` ObjectiveC
    - (void)previous:(LPPlayerBlock _Nullable)completionHandler;
    ```

- 参数

    无

- 返回值

    无

#### 播放音乐

播放音乐指的是从音源SDK中获取要播放的信息 musicDictionary, 然后传递给设备，从而让设备播放音源信息，从音源中获得 LPPlayMusicList 对象后，可以通过 LPMDPKitManager SDK 转换成接口需要的播放信息 musicDictionary

- 接口说明

    ``` ObjectiveC
    - (void)playAudioWithMusicDictionary:(NSDictionary *)musicDictionary completionHandler:(LPPlayerBlock _Nullable)completionHandler;
    ```

- 参数

| 名称              | 类型                      | 接口说明                                           |
| :--------------- | :----------------------- -| :----------------------------------------------  |
| musicDictionary  | NSDictionary              | 播放媒体内容                                       |

- 返回值

    无

- 示例代码

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

#### 下一首播放

选中歌曲，作为歌单中的下一首音乐播放

- 接口说明

    ``` ObjectiveC
    - (void)nextPlay:(NSDictionary *)musicDictionary completionHandler:(LPPlayerBlock _Nullable)completionHandler;
    ```

- 参数

| 名称              | 类型                      | 接口说明                                           |
| :--------------- | :----------------------- -| :----------------------------------------------  |
| musicDictionary  | NSDictionary              | 播放媒体内容                                       |

- 返回值

    无

- 示例代码

    ``` ObjectiveC
    LPMSLibraryPlayItem *item = (LPMSLibraryPlayItem *)self.musicListObj.list[2];
    LPMediaSourceAction *action = [[LPMediaSourceAction alloc] init];
    LPPlayMusicList *songObj = [[LPPlayMusicList alloc] init];
     songObj.account = self.musicListObj.account;
     songObj.header = self.musicListObj.header;
     songObj.list = @[item];
     songObj.index = 0;
     songObj.customPresetName = self.musicListObj.customPresetName;
    
    [[LPMDPKitManager shared] addToNextPlayWithDeviceId:self.uuid playMusicList:songObj deviceAction:action block:^(NSDictionary * _Nonnull dictionary) {
        if (dictionary) {
            [self.devicePlayer nextPlay:dictionary completionHandler:^(BOOL isSuccess, NSString * _Nullable result) {
                if (isSuccess) {
                    NSLog(@"Next Play successfully");
                }
            }];
        }
    }];
    ```


#### 播放USB歌曲

- 接口说明

    ``` ObjectiveC
    - (void)playUSBSongsWithIndex:(int)index completionHandler:(LPPlayerBlock _Nullable)completionHandler;
    ```

- 参数

| 名称              | 类型                      | 接口说明                                           |
| :--------------- | :----------------------- -| :----------------------------------------------  |
| index            | int                       | 歌曲index                                         |

- 返回值

    无

- 示例代码

    ``` ObjectiveC
    self.musicListObj.index = (int)indexPath.row;
    [self.devicePlayer playUSBSongsWithIndex:(int)indexPath.row completionHandler:^(BOOL isSuccess, NSString * _Nullable result) {
        if (isSuccess) {
            NSLog(@"Play USB song successfully");
        }
    }];
    ```

#### 播放当前正在播放歌单中的歌曲

- 接口说明

    ``` ObjectiveC
    - (void)playCurrentPlayListWithIndex:(int)index completionHandler:(LPPlayerBlock _Nullable)completionHandler;
    ```

- 参数

| 名称              | 类型                      | 接口说明                                               |
| :--------------- | :----------------------- -| :--------------------------------------------------- |  
| index            | int                       | 当前歌单中歌曲index，可以从(queryCurrentPlayList)获取歌单 |

- 返回值

    无

- 示例代码

    ``` ObjectiveC
    [self.devicePlayer queryCurrentPlayList:^(BOOL isSuccess, NSString * _Nullable result) {
        LPPlayMusicList *musicListObj = [[LPMDPKitManager shared] getBrowseListWithString:result];
        [self.devicePlayer playCurrentPlayListWithIndex:4 completionHandler:^(BOOL isSuccess, NSString * _Nullable result) {
            NSLog(@"Play successfully");
        }];
    }];
    ```

#### 删除当前播放歌单中的歌曲

从正在播放的歌单列表中，删除指定的歌曲。

- 接口说明

    ``` ObjectiveC
    - (void)deleteWithIndex:(NSInteger)index completionHandler:(LPPlayerBlock _Nullable)completionHandler
    ```

- 参数

| 名称              | 类型                      | 接口说明                                           |
| :--------------- | :----------------------- -| :----------------------------------------------  |
| index             | NSInteger                | 歌曲在歌单列表中的位置                               |

- 返回值

    无

- 示例代码

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


### 闹钟

闹钟SDK实现了设备本地闹钟的功能。通过时间、周期、音乐的设定，来实现定时音箱闹铃功能。<br>

闹钟SDK可以设置闹铃，分为通过普通音乐和预置音乐，可以调整闹铃声音的大小，可以设置闹钟的周期。<br>

闹钟SDK可以实现编辑闹钟、新增闹钟、删除闹钟和关闭或者打开闹钟的功能。关闭或打开闹钟，指的是闹钟还存在，只是单纯的关闭或者打开闹钟功能，并不是删除闹钟。<br>

#### 闹钟列表

- 接口说明

    ``` ObjectiveC
    - (void)getAlarms:(LPGetAlarmBlock _Nullable)completionHandler;
    ```

- 参数

    无

- 返回值

    无

- 示例代码

    ``` ObjectiveC
    [device.getAlarm getAlarms:^(NSString * _Nullable alarmString) {
        NSArray *alarmList = [[LPMDPKitManager shared] getAlarmDataWithString:alarmString];
    }];
    ```

#### 增加新闹钟

- 接口说明

    ``` ObjectiveC
    - (void)addAlarmWithInfomation:(NSDictionary *)infomation completionHandler:(LPAlarmBlock _Nullable)completionHandler;
    ```

- 参数

| 名称             | 类型                     | 接口说明                                          |
| :-------------- | :----------------------- | :---------------------------------------------- |
| Infomation      | NSDictionary             | 闹钟信息                                          |

- 返回值

    无

- 示例代码

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
- 注意

    如果闹铃的选择为在线音乐，当选中的音乐处于异常状态时(如在线音乐 token 过期)，会使用默认的音乐代替闹铃

####  修改闹钟

- 接口说明

    ``` ObjectiveC
    - (void)editAlarmWithInfomation:(NSDictionary *)infomation completionHandler:(LPAlarmBlock _Nullable)completionHandle;
    ```

- 参数

| 名称             | 类型                     | 接口说明                                          |
| :-------------- | :----------------------- | :---------------------------------------------- |
| Infomation      | NSDictionary             | 闹钟信息                                          |

- 返回值

    无

- 示例代码

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

####  删除闹钟

- 接口说明

    ``` ObjectiveC
    - (void)deleteAlarmWithName:(NSString *)name completionHandler:(LPAlarmBlock _Nullable)completionHandler;
    ```

- 参数

| 名称             | 类型                     | 接口说明                                          |
| :-------------- | :----------------------- | :---------------------------------------------- |
| name            | NSString                 | 闹钟的名称                                        |

- 返回值

    无

- 示例代码

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
    
#### 最大设置闹钟数量

- 接口说明

    ``` ObjectiveC
    - (int)getAlarmMaxNum;
    ```

- 参数

    无

- 返回值

    int 类型变量 num，当前设备最大设置闹钟数量

- 注意

    闹钟设置的数量，不要超过限定的最大数量，最大数量可以通过 getAlarmMaxNum 方法获取

####  打开/关闭闹钟

- 接口说明

    ``` ObjectiveC
    - (void)setAlarmSwitchOnWithInfomation:(NSDictionary *)infomation completionHandler:(LPAlarmBlock _Nullable)completionHandler;
    ```

- 参数

| 名称             | 类型                     | 接口说明                                          |
| :-------------- | :----------------------- | :---------------------------------------------- |
| Infomation      | NSDictionary             | 闹钟信息                                          |

- 返回值

    无

- 示例代码

    ``` ObjectiveC
    NSDictionary *alarmDict = [[LPMDPKitManager shared] setAlarmStatusWithOpen:switchButton.on clockList:Alarm];
    [alarm setAlarmSwitchOnWithInfomation:alarmDict completionHandler:^(BOOL isSuccess) {
     
    }];
    ```

### 预置

预置是指将歌曲或者歌单信息保存到设备的存储空间中，可通过设备上的某些物理按键播放这些音乐，用户可以将喜爱的一些音乐通过预置保存在设备中，就可以更快速，更便捷的在设备上播放音乐。<br>

Preset SDK 提供了添加预置，删除预置，获取预置，播放预置的功能。<br>

SDK 需要配合 LPMDPKit SDK 使用，SDK返回的信息，需要传入的参数，也都是通过LPMDPKit SDK 获得。<br>

#### 预置列表

- 接口说明

    ``` ObjectiveC
    - (void)getPresets:(LPGetPresetBlock _Nullable)completionHandler;
    ```

- 参数

    无

- 返回值

    无

- 示例代码

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

####  设置预置

- 接口说明

    ``` ObjectiveC
    - (void)setPresetWithInfomation:(NSDictionary *)infomation completionHandler:(LPPresetBlock _Nullable)completionHandler;
    ```

- 参数

| 名称             | 类型                     | 接口说明                                          |
| :-------------- | :----------------------- | :---------------------------------------------- |
| Infomation      | NSDictionary             | 闹钟信息                                          |

- 返回值

    无

- 示例代码

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

####  删除预置

- 接口说明

    ``` ObjectiveC
    - (void)deletePresetWithInfomation:(NSDictionary *)infomation completionHandler:(LPPresetBlock _Nullable)completionHandler;
    ```

- 参数

| 名称             | 类型                     | 接口说明                                          |
| :-------------- | :----------------------- | :---------------------------------------------- |
| Infomation      | NSDictionary             | 闹钟信息                                          |

- 返回值

    无

- 示例代码

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

####  播放预置

- 接口说明

    ``` ObjectiveC
    - (void)playPresetWithIndex:(NSInteger)index completionHandler:(LPPresetBlock _Nullable)completionHandler;
    ```

- 参数

| 名称             | 类型                     | 接口说明                                          |
| :-------------- | :----------------------- | :---------------------------------------------- |
| index           | int                      | 预置对象的索引                                     |

- 返回值

    无

- 示例代码

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

### 定时关机

Timer SDK 提供了设置休眠倒计时时间，获取休眠倒计时时间的API

####  设置时间

- 接口说明

    设置设备定时关机的时间

    ``` ObjectiveC
    - (void)setTimerWithTime:(NSInteger)time completionHandler:(LPSDKReturnBlock _Nullable)completionHandler;
    ```

- 参数

| 名称             | 类型                     | 接口说明                                          |
| :-------------- | :----------------------- | :---------------------------------------------- |
| time            | int                      | 休眠倒计时时间(s)；-1表示取消                       |

- 返回值

    无


####  获取设备定时关机时间

- 接口说明

    获取设备当前已经设置的timer

    ``` ObjectiveC
    - (void)getTimer:(LPSDKReturnBlock _Nullable)completionHandler;
    ```

- 参数

    无

- 返回值

    无


### 固件升级

当固件有新版本更新的时候，可以通过OTA实现设备固件更新的功能。 <br><br>
固件升级时，设备必须连接在Wi-Fi上，且Wi-Fi必须有网络才可以开启OTA功能。你可以通过 LPDeviceInfo 中 getDeviceInternetStatus 方法来判断当前设备是否有网络。对于设备来说，正常情况下，无论设备升级成功或者失败，都会回连到升级前的Wi-Fi上，如果因为某些原因导致升级失败，你可以等待设备回连后，再次尝试升级。<br><br>
 OTA  SDK 提供了检测固件是否有升级，升级的功能，OTA SDK 会经历固件下载、设备升级、设备重启三个阶段，分别对应 MV_UP_STATUS_DOWNLOAD_START、MV_UP_STATUS_WRITE_START、MV_UP_STATUS_REBOOT三个状态，每个阶段都会有超时判断，防止卡死在OTA流程中。 <br>


- `LPOTATimeoutObj` 数据模型

    设备OTA需要配置升级的时间

| 名称                   | 类型              | 描述                                                        |
| ---------------------- | ----------------- | ----------------------------------------------------------- |
| FWDownloadTimeout      | int               | 固件下载阶段需要的时间, 默认 120s                           |
| FWWriteTimeout         | int               | 固件升级阶段需要的时间, 默认 120s                           |
| FWRebootTimeout        | int               | 固件重启阶段需要的时间, 默认 120s                           |
| MCUDownloadTimeout     | int               | MCU下载阶段需要的时间, 默认 120s                            |
| MCUWriteTimeout        | int               | MCU升级阶段需要的时间, 默认 120s                            |
| MCURebootTimeout       | int               | MCU重启阶段需要的时间, 默认 120s                            |
| DSPDownloadTimeout     | int               | DSP下载阶段需要的时间, 默认 120s                            |
| DSPWriteTimeout        | int               | DSP升级阶段需要的时间, 默认 120s                            |
| DSPRebootTimeout       | int               | DSP重启阶段需要的时间, 默认 120s                            |

- `LPOTAPercentObj` 数据模型

    OTA过程中设备返回的信息对象

| 名称                    | 类型             | 描述                                                         |
| ---------------------- | -----------------| ----------------------------------------------------------- |
| downloadPercent        | float            | 下载阶段进度                                                  |
| upgradePercent         | float            | 升级阶段进度                                                  |
| recatoryPercent        | float            | 重启阶段进度                                                  |
| firmwareOTAStatus      | int              | OTAStatus                                                   |
| expectTime             | int              | OTA 预期时间                                                  |
| totalPercent           | float            | 下载总进度                                                    |


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

    ``` ObjectiveC
    - (BOOL)checkUpdate;
    ```

- 参数

    无

- 返回值

    BOOL

- 注意

    建议：配网完成后不要立即调用此接口；设备需要时间查询是否有OTA。


####  开始设备升级

- 接口说明

    ``` ObjectiveC
    - (void)firmwareStartUpdate:(LPOTATimeoutObj *)timeoutObj completionHandler:(LPFirmwareUpdateResultBlock)completionHandler;
    ```

- 参数

| 名称             | 类型                     | 接口说明                                          |
| :-------------- | :----------------------- | :---------------------------------------------- |
| timeoutObj      | LPOTATimeoutObj          | OTA 升级过程中三个阶段所需要的时间对象                |

- 返回值

    无

####  设备升级代理

- 接口说明

    升级过程中返回状态、进度等属性的代理方法

    ``` ObjectiveC
    - (void)LPOTAPercentUpdate:(LPOTAPercentObj *)percentObj;
    ```

- 参数

| 名称             | 类型                     | 接口说明                                          |
| :-------------- | :----------------------- | :---------------------------------------------- |
| percentObj      | LPOTAPercentObj          | OTA设备返回的信息管理对象                           |

- 返回值

    无

### MCU 交互

Passthrough SDK 提供了与设备建立长连接，发送透传指令，并接收设备透传指令的功能。


####  NSNotification

Passthrough SDK 共有两个通知，用来传递数据和标识长连接状态。

####  LPPassthroughConnectionStateChanged

- 接口说明

    Passthrough 长连接状态通知

    ``` ObjectiveC
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(passthroughConnectionStateChanged:) name:LPPassthroughConnectionStateChanged object:nil];
    ```

- 参数

| 名称             | 类型                     | 接口说明                                          |
| :-------------- | :----------------------- | :---------------------------------------------- |
| isConnected     | int                      | 是否连接成功                                      |

- 返回值

    无

- 示例代码

    ``` ObjectiveC
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(passthroughConnectionStateChanged:) name:LPPassthroughConnectionStateChanged object:nil];
    
    // LPPassthroughConnectionStateChanged
    - (void)passthroughConnectionStateChanged:(NSNotification *)notificaiton {
        NSDictionary *dictionary = notificaiton.object;
        NSLog(@"isConnected = %@", dictionary[@"isConnected"]);
    }
    ```


####  LPPassThroughMessageCome

- 接口说明

    Passthrough 数据通讯通知

    ``` ObjectiveC
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(passThroughMessageCome:) name:LPPassThroughMessageCome object:nil];
    ```

- 参数

| 名称             | 类型                     | 接口说明                                          |
| :-------------- | :----------------------- | :---------------------------------------------- |
| response        | NSString                 | 设备发送过来的透传数据                              |

- 返回值

    无

- 示例代码

    ``` ObjectiveC
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(passThroughMessageCome:) name:LPPassThroughMessageCome object:nil];
    
    // LPPassThroughMessageCome
    - (void)passThroughMessageCome:(NSNotification *)notificaiton {
        NSDictionary *dictionary = notificaiton.object;
        NSLog(@"response = %@", dictionary[@"response"]);
    }
    ```

####  建立连接

- 接口说明

    建立与MCU的透传连接。

    ``` ObjectiveC
    - (void)connect;
    ```

- 参数

    无

- 返回值

    无

- 示例代码

    ``` ObjectiveC
    [[device getPassthrough] connect];
    ```

####  断开连接

- 接口说明

    ``` ObjectiveC
    - (void)disConnect;
    ```

- 参数

    无

- 返回值

    无

#### 发送数据

- 接口说明

    ``` ObjectiveC
    - (void)write:(NSString *)cmd;
    ```

- 参数

| 名称       | 类型                      | 接口说明                                          |
| :-------- | :-----------------------  | :----------------------------------------------  |
| cmd       | NSString                  | 与MCU交互的数据                                    |

- 返回值

    无

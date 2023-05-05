# 设备播放音乐设置

# 简介

对设备播放音乐的信息设置，如声道、播放模式、进度等信息。

#### 播放进度

- 接口说明

    ``` ObjectiveC
    - (void)setProgress:(NSTimeInterval)progress completionHandler:(LPPlayerBlock _Nullable)completionHandler;
    ```

- 参数

| 名称           | 类型                     | 接口说明                                         |
| :-------------| :----------------------- | :---------------------------------------------- |
| progress      | NSTimeInterval           | 播放进度                                         |

- 返回值

    无


#### 播放声道

- 接口说明

    ``` ObjectiveC
    - (void)setChannel:(LPDeviceChannel)channel completionHandler:(LPPlayerBlock _Nullable)completionHandler;
    ```

- 参数

| 名称           | 类型                     | 接口说明                                         |
| :-------------| :----------------------- | :----------------------------------------------|
| channel       | LPDeviceChannel          | 播放声道                                        |

- 返回值

    无

- 示例代码

    ``` ObjectiveC
    LPDeviceChannel channel = LPChannel_left;
    [[device getPlayer] setChannel:channel completionHandler:^(BOOL isSuccess, NSString * _Nullable result) {
        if (isSuccess) {
            NSLog(@"Channel setup successful");
        }
    }];
    
    ```

#### 播放模式

- 接口说明

    ``` ObjectiveC
    - (void)setPlayMode:(LPPlayMode)playMode completionHandler:(LPPlayerBlock _Nullable)completionHandler;
    ```

- 参数

| 名称           | 类型                     | 接口说明                                         |
| :-------------| :----------------------- | :----------------------------------------------|
| playMode      | LPPlayMode                | 播放模式                                       |

- 返回值

    无

- 示例代码

    ``` ObjectiveC
    if ([device.mediaInfo.mediaType isEqualToString:SPOTIFY_SOURCE]) {
        LPSpotifyPlayMode mode = LP_SPOTIFY_LISTREPEAT;
        [[self.boxInfo getPlayer] setSpotifyPlayMode:mode completionHandler:^(BOOL isSuccess, NSString * _Nullable result) {
            
        }];
    }else {
        LPPlayMode mode = LP_SHUFFLEREPEAT;
        [[self.boxInfo getPlayer] setPlayMode:mode completionHandler:^(BOOL isSuccess, NSString * _Nullable result) {
            
        }];
    }
    ```

#### Spotify 播放模式

- 接口说明

    ``` ObjectiveC
    - (void)setSpotifyPlayMode:(LPSpotifyPlayMode)spotifyPlayMode completionHandler:(LPPlayerBlock _Nullable)completionHandler;
    ```

- 参数

| 名称              | 类型                      | 接口说明                                         |
| :-------------    | :----------------------- | :----------------------------------------------|
| spotifyPlayMode   | LPSpotifyPlayMode        | Spotify播放模式                                  |

- 返回值

    无

- 示例代码

    ``` ObjectiveC
    if ([device.mediaInfo.mediaType isEqualToString:SPOTIFY_SOURCE]) {
        LPSpotifyPlayMode mode = LP_SPOTIFY_LISTREPEAT;
        [[self.boxInfo getPlayer] setSpotifyPlayMode:mode completionHandler:^(BOOL isSuccess, NSString * _Nullable result) {
            
        }];
    }else {
        LPPlayMode mode = LP_SHUFFLEREPEAT;
        [[self.boxInfo getPlayer] setPlayMode:mode completionHandler:^(BOOL isSuccess, NSString * _Nullable result) {
            
        }];
    }
    ```

#### 音量

- 接口说明

    ``` ObjectiveC
    - (void)setVolume:(CGFloat)volume single:(BOOL)single;
    ```

- 参数

| 名称           | 类型                     | 接口说明                                         |
| :-------------| :----------------------- | :----------------------------------------------|
| volume        | CGFloat                  | 设备音量                                         |

- 返回值

    无


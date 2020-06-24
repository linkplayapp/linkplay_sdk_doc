# Play Settings

# Overview

Play control, change settings like channel, play mode, progress etc.

#### Progress

- Description

    ``` ObjectiveC
    - (void)setProgress:(NSTimeInterval)progress completionHandler:(LPPlayerBlock _Nullable)completionHandler;
    ```

- Parameter

| Name           | Type                     | Description                                     |
| :------------- | :----------------------- | :---------------------------------------------- |
| progress       | NSTimeInterval           | Progress                                        |

- Response

    N/A


#### Channel

- Description

    ``` ObjectiveC
    - (void)setChannel:(LPDeviceChannel)channel completionHandler:(LPPlayerBlock _Nullable)completionHandler;
    ```

- Parameter

| Name           | Type                     | Description                                     |
| :------------- | :----------------------- | :---------------------------------------------- |
| channel        | LPDeviceChannel          | Channel                                         |

- Response

    N/A

- Sample Code

    ``` ObjectiveC
    LPDeviceChannel channel = LPChannel_left;
    [[device getPlayer] setChannel:channel completionHandler:^(BOOL isSuccess, NSString * _Nullable result) {
        if (isSuccess) {
            NSLog(@"Channel setup successful");
        }
    }];
    
    ```

#### Play Mode

- Description

    ``` ObjectiveC
    - (void)setPlayMode:(LPPlayMode)playMode;
    ```

- Parameter

| Name           | Type                     | Description                                     |
| :------------- | :----------------------- | :---------------------------------------------- |
| playMode       | LPPlayMode               | Play mode                                       |

- Response

    N/A

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

#### Spotify Play Mode

- Description

    ``` ObjectiveC
    - (void)setSpotifyPlayMode:(LPSpotifyPlayMode)spotifyPlayMode;
    ```

- Parameter

| Name            | Type                     | Description                                     |
| :-------------  | :----------------------- | :---------------------------------------------- |
| spotifyPlayMode | LPSpotifyPlayMode        | Spotify play mode                               |

- Response

    N/A

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

#### Volume

- Description

    ``` ObjectiveC
    - (void)setVolume:(CGFloat)volume single:(BOOL)single;
    ```

- Parameter

| Name           | Type                     | Description                                     |
| :------------- | :----------------------- | :---------------------------------------------- |
| volume         | CGFloat                  | Volume                                          |

- Response

    N/A


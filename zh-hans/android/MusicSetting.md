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

#### Spotify 播放模式

- 接口说明

    ``` Java
    setSpotifyPlayMode(LPSpotifyPlayMode playMode, LPDevicePlayerListener listener)
    ```

- 参数

| 名称           | 类型                     | 接口说明                                        |
| :------------- | :----------------------- | :---------------------------------------------- |
| playMode           | LPSpotifyPlayMode    | Spotify播放模式                                   |
| listener       | LPDevicePlayerListener   | Callback                                        |

- 返回值

    无

- 示例代码
    ``` Java
    if (UIApplication.currDevice.getMediaInfo().getMediaType().equals(LPPlayHeader.LPPlayMediaType.LP_SPOTIFY)) {

                LPSpotifyPlayMode lpSpotifyPlayMode = UIApplication.currDevice.getDeviceInfo().getSpotifyPlayMode();

                LPSpotifyPlayMode setLPSpotifyPlayMode = null;

                switch (lpSpotifyPlayMode) {
                    case LP_SPOTIFY_DEFAULT:
                        setLPSpotifyPlayMode = LPSpotifyPlayMode.LP_SPOTIFY_LISTREPEAT;
                        break;
                    case LP_SPOTIFY_SHUFFLE:
                        setLPSpotifyPlayMode = LPSpotifyPlayMode.LP_SPOTIFY_SINGLEREPEAT;
                        break;
                    case LP_SPOTIFY_LISTREPEAT:
                        setLPSpotifyPlayMode = LPSpotifyPlayMode.LP_SPOTIFY_SHUFFLEREPEAT;
                        break;
                    case LP_SPOTIFY_SINGLEREPEAT:
                        setLPSpotifyPlayMode = LPSpotifyPlayMode.LP_SPOTIFY_SINGLE_REPEAT_SHUFFLE;
                        break;
                    case LP_SPOTIFY_SHUFFLEREPEAT:
                        setLPSpotifyPlayMode = LPSpotifyPlayMode.LP_SPOTIFY_SHUFFLE;
                        break;
                    case LP_SPOTIFY_SINGLE_REPEAT_SHUFFLE:
                        setLPSpotifyPlayMode = LPSpotifyPlayMode.LP_SPOTIFY_DEFAULT;
                        break;
                    default:
                        setLPSpotifyPlayMode = LPSpotifyPlayMode.LP_SPOTIFY_DEFAULT;
                }

                UIApplication.currDevice.getPlayer()
                        .setSpotifyPlayMode(setLPSpotifyPlayMode,
                                new LPDevicePlayerListener() {
                                    @Override
                                    public void onSuccess(String result) {
                                        Log.i(TAG, "setMode success: " + result);
                                    }

                                    @Override
                                    public void onFailure(Exception e) {
                                        Log.i(TAG, "setMode fail: " + e.getMessage());
                                    }
                                });
            }
    ```
    
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


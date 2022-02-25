# Play Settings

# Overview

Play control, change settings like channel, play mode, progress etc.

#### Progress

- Description

    ``` Java
    setProgress(int progress, LPDevicePlayerListener listener)
    ```

- Parameter

| Name           | Type                     | Description                                     |
| :------------- | :----------------------- | :---------------------------------------------- |
| progress       | int                      | Progress                                        |
| listener       | LPDevicePlayerListener   | Callback                                        |

- Response

    N/A


#### Channel

- Description

    ``` Java
    setChannel(int channel, LPDevicePlayerListener listener)
    ```

- Parameter

| Name           | Type                     | Description                                     |
| :------------- | :----------------------- | :---------------------------------------------- |
| channel        | int                      | Channel                                         |
| listener       | LPDevicePlayerListener   | Callback                                        |

- Response

    N/A

#### Play Mode

- Description

    ``` Java
    setMode(int mode, LPDevicePlayerListener listener)
    ```

- Parameter

| Name           | Type                     | Description                                     |
| :------------- | :----------------------- | :---------------------------------------------- |
| playMode       | int                      | Play mode                                       |
| listener       | LPDevicePlayerListener   | Callback                                        |

- Response

    N/A

#### Spotify Play Mode

- Description

    ``` Java
    setSpotifyPlayMode(LPSpotifyPlayMode playMode, LPDevicePlayerListener listener)
    ```

- Parameter

| Name            | Type                     | Description                                     |
| :-------------  | :----------------------- | :---------------------------------------------- |
| playMode | LPSpotifyPlayMode        | Spotify play mode                               |

- Response

    N/A

- Sample Code

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

#### Volume

- Description

    ``` Java
    setVolume(int volume, LPDevicePlayerListener listener)
    ```

- Parameter

| Name           | Type                     | Description                                     |
| :------------- | :----------------------- | :---------------------------------------------- |
| volume         | int                      | Volume                                          |
| listener       | LPDevicePlayerListener   | Callback                                        |

- Response

    N/A


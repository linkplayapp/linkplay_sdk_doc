# Device Control

# Overview

This SDK implements most of the device related functions, includes play control, settings, preset, alarm and so on.

### Play Control

#### Get Play Control Object

- Description

    ``` Java
    getPlayer()
    ```

- Parameter

    N/A

- Response

| Type               | Description                              |
| :----------------- | :--------------------------------------- |
| LPDevicePlayer     | Play control object                      |


#### Play

- Description

    ``` Java
    play(LPDevicePlayerListener listener)
    ```

- Parameter

| Name         | Type                     | Description                                     |
| :----------- | :----------------------- | :---------------------------------------------- |
| listener     | LPDevicePlayerListener   | Callback                                        |

- Response

    N/A

#### Pause

- Description

    ``` Java
    pause(LPDevicePlayerListener listener)
    ```

- Parameter

| Name         | Type                     | Description                                     |
| :----------- | :----------------------- | :---------------------------------------------- |
| listener     | LPDevicePlayerListener   | Callback                                        |

- Response

    N/A

#### Stop

- Description

    ``` Java
    stop(LPDevicePlayerListener listener)
    ```

- Parameter

| Name         | Type                     | Description                                     |
| :----------- | :----------------------- | :---------------------------------------------- |
| listener     | LPDevicePlayerListener   | Callback                                        |

- Response

    N/A

#### Next

- Description

    ``` Java
    next(LPDevicePlayerListener listener)
    ```

- Parameter

| Name         | Type                     | Description                                     |
| :----------- | :----------------------- | :---------------------------------------------- |
| listener     | LPDevicePlayerListener   | Callback                                        |

- Response

    N/A

#### Previous

- Description

    ``` Java
    previous(LPDevicePlayerListener listener)
    ```

- Parameter

| Name         | Type                     | Description                                     |
| :----------- | :----------------------- | :---------------------------------------------- |
| listener     | LPDevicePlayerListener   | Callback                                        |

- Response

    N/A


#### Play Music

Get the play info from music source SDK and pass it to device withi this function. You can use LPMDPKitManager SDK to translate LPPlayMusicList object to musicDictionary


- Description

    ``` Java
    playAudio(String playlist, LPDevicePlayerListener listener)
    ```

- Parameter

| Name             | Type                       | Description                                     |
| :--------------- | :----------------------- - | :---------------------------------------------- |
| playlist         | String                     | Music info to play                              |

- Response

    N/A

- Sample Code

    ```Java
    currDevice.getPlayer().playAudio(playlist,
                new LPDevicePlayerListener() {
            @Override
            public void onSuccess(String result) {
 
            }
 
            @Override
            public void onFailure(Exception e) {
 
            }
        });
    ```

#### Next to Play

Insert song to next play

- Description

    ``` Java
    nextPlay(String playlist, LPMediaInfo mediaItem, LPDevicePlayerListener listener)
    ```

- Parameter

| Name             | Type                       | Description                                     |
| :--------------- | :----------------------- - | :---------------------------------------------- |
| playlist         | String                     | Music content to play                           |
| mediaItem        | LPMediaInfo                | Music mediaItem                                 |
| listener         | LPDevicePlayerListener     | Music play callback                             |

- Response

    N/A

- Sample Code

    ``` Java
     currDevice.getPlayer().nextPlay(playlist, mediaItem,
                new LPDevicePlayerListener() {
            @Override
            public void onSuccess(String result) {
 
            }
 
            @Override
            public void onFailure(Exception e) {
 
            }
        });
    ```

#### Play USB songs

- Description

    ``` Java
    playUSBSongsWithIndex(int index, LPDevicePlayerListener listener);
    ```

- Parameter

| Name       | Type     | Description                                                          |
| :----------| :--------| :------------------------------------------------------------------- |
| index      | int      | Song index                                                           |

- Response

    N/A

- Sample Code

``` Java
    currDevice.getPlayer().playUSBSongsWithIndex(index,
        new LPDevicePlayerListener() {
         @Override
        public void onSuccess(String result) {
 
         }
 
        @Override
        public void onFailure(Exception e) {
         }
    });
```


#### Play Current Playlist Song

- Description
    ``` Java
    playCurrentPlayListWithIndex(int index, LPDevicePlayerListener listener)
    ```
- Parameter

| Name       | Type     | Description                                                          |
| :----------| :--------| :------------------------------------------------------------------- |
| index      | int      | The index of the song in the current playlist, you can get the playlist from (queryCurrentPlayList)                                                          |


- Response
    N/A
- Sample Code
   ``` Java
    currDevice.getPlayer().playCurrentPlayListWithIndex(index,
                new LPDevicePlayerListener() {
            @Override
            public void onSuccess(String result) {
 
            }
 
            @Override
            public void onFailure(Exception e) {
 
            }
        });
    ```



#### Remove Music from Current Playlist

- Description

    ``` Java
    deleteWithIndex(int index, LPDevicePlayerListener listener)
    ```

- Parameter

| Name             | Type                       | Description                                     |
| :--------------- | :----------------------- - | :---------------------------------------------- |
| index            | int                        | Index in current playlist                       |
| listener         | LPDevicePlayerListener     | Callback                                        |

- Response

    N/A

- Sample Code

    ``` Java
    currDevice.getPlayer().delWithIndex(0,
                new LPDevicePlayerListener() {
            @Override
            public void onSuccess(String result) {
 
            }
 
            @Override
            public void onFailure(Exception e) {
 
            }
        });
    ```

### Alarm

We wrapper the alarm related functions of the device here. <br>

You can create, edit, remove, enable/disable alarms. <br>

You can easily setting the time, interval, wakeup sound and other attributes of an alarm. <br>

#### Alarm List

- Description

    ``` Java
    getAlarms(final LPAlarmListener listener)
    ```

- Parameter

    N/A

- Response

    N/A

- Sample Code

    ``` Java
    LPDeviceAlarm lpDeviceAlarm = new LPDeviceAlarm(UIApplication.currDevice);
        lpDeviceAlarm.getAlarms(new LPAlarmListener() {
            @Override
            public void onSuccess(String result) {
                Log.e(TAG, "getAlarms = " + result);
            }

            @Override
            public void onFail(Exception e) {
                e.printStackTrace();
                Log.e(TAG, "get alarms error = " + e.getMessage());
            }
        });
    ```

#### Create Alarm

- Description
    ``` Java
    addAlarm(String content, final LPAlarmListener listener)
    ```

- Parameter

| Name            | Type                     | Description                                     |
| :-------------- | :----------------------- | :---------------------------------------------- |
| content          | String                     | Alarm config                                        |
| listener         | LPAlarmListener            | Callback                                        |


- Response

    N/A

- Sample Code

    ``` Java
    String content = "";
    LPDeviceAlarm lpDeviceAlarm = new LPDeviceAlarm(UIApplication.currDevice);
    lpDeviceAlarm.addAlarm(content, new LPAlarmListener() { 
                @Override
                public void onSuccess(String result) {
                    Log.i(TAG, "alarm: " + result);
                }
                    @Override
                public void onFail(Exception e) {
                    Log.i(TAG, "alarm: e " + e);
                }
            });       
    ```

- Note

    If the wakeup sound is an online music, and device can't play it (for example the token is invalid), then the device would play with the default ring sound.

#### Edit Alarm

- Description
    ``` Java
    editAlarm(String context, final LPAlarmListener listener)
    ```

- Parameter

| Name            | Type                     | Description                                     |
| :-------------- | :----------------------- | :---------------------------------------------- |
| context          | String                     | Alarm config                                        |
| listener         | LPAlarmListener            | Callback                                        |


- Response

     N/A

- Sample Code
    ``` Java
    LPDeviceAlarm lpDeviceAlarm = new LPDeviceAlarm(UIApplication.currDevice);
        lpDeviceAlarm.editAlarm(content, new LPAlarmListener() {
                    @Override
                    public void onSuccess(String result) {
                        Log.i(TAG, "alarm: " + result);
                    }

                    @Override
                    public void onFail(Exception e) {
                        Log.i(TAG, "alarm: e " + e);

                    }
                });
    ```

#### Remove Alarm
- Description
    ``` Java
    deleteAlarm(String alarmName, final LPAlarmListener listener)
    ```

- Parameter

| Name            | Type                     | Description                                     |
| :-------------- | :----------------------- | :---------------------------------------------- |
| alarmName          | String                     | Alarm name                                        |
| listener         | LPAlarmListener            | Callback                                        |

- Response

    N/A

- Sample Code
    ``` Java
    LPDeviceAlarm lpDeviceAlarm = new LPDeviceAlarm(UIApplication.currDevice);
            lpDeviceAlarm.deleteAlarm(bean.getAlarmName(), new LPAlarmListener() {
                @Override
                public void onSuccess(String result) {
                     Log.i(TAG, "delete alarm: " + result);
                }

                @Override
                public void onFail(Exception e) {
                    e.printStackTrace();
                    Log.e(TAG, "delete error = " + e.getMessage());
                }
            });
    ```

####  Enable/Disable Alarm

- Description
``` Java
    setAlarmSwitchOn(String context, LPAlarmListener listener)
    ```

- Parameter

| Name            | Type                     | Description                                     |
| :-------------- | :----------------------- | :---------------------------------------------- |
| context          | String                     | Alarm config                                        |
| listener         | LPAlarmListener            | Callback                                        |

- Response

    N/A

- Sample Code
    ``` Java
    LPDeviceAlarm lpDeviceAlarm = new LPDeviceAlarm(UIApplication.currDevice);
            lpDeviceAlarm.setAlarmSwitchOn(LPMDPKitManager.getInstance().setAlarmStatusWithOpen(isChecked, bean),
                    new LPAlarmListener() {
                        @Override
                        public void onSuccess(String result) {
                            Log.i(TAG, "swith result = " + result);
                        }

                        @Override
                        public void onFail(Exception e) {
                            e.printStackTrace();
                            Log.e(TAG, "swith error = " + e.getMessage());
                            alarmSwith.setChecked(!isChecked);
                        }
                    });
  

### Preset

Preset is the function that store music or playlist in device's flash, so that user can play music without app, like using physical button on the device.

We implement the CURD of the preset function.<br>

This SDK needs to cooperate with the LPMDPKit to use. <br>

#### List

- Description

    ```Java
    getPresets(LPPresetListListener listener)
    ```

- Parameter

| Name            | Type                     | Description                                     |
| :-------------- | :----------------------- | :---------------------------------------------- |
| listener      | LPPresetListListener             | Callback                               |


- Response

    N/A

-   Sample Code
    
    ```Java
    currDevice.getDevicePreset().getPresets(new LPPresetListener() {
                    @Override
                    public void onSuccess(String s) {
                       
                    }

                    @Override
                    public void onFail(Exception e) {

                    }
                });
    ```

#### Update

- Description

    ``` Java
    setPreset(String context, LPPresetListener listener)
    ```

- Parameter

| Name            | Type                     | Description                                     |
| :-------------- | :----------------------- | :---------------------------------------------- | 
| context           | String                      | preset context                                 |
| listener        | LPPresetListener         | Callback                                        |

- Response

    N/A

- Sample Code
    ```Java
    currDevice.getDevicePreset().setPreset(prests,
                        new LPPresetListener() {
                    @Override
                    public void onSuccess(String s) {

                    }

                    @Override
                    public void onFail(Exception e) {

                    }
                });
    ```

#### Remove

- Description

    ``` Java
    deletePreset(String context, LPPresetListener listener)
    ```

- Parameter

| Name            | Type                     | Description                                     |
| :-------------- | :----------------------- | :---------------------------------------------- |
| context           | String                      | preset context                                  |
| listener        | LPPresetListener         | Callback                                        |

- Response

    N/A

-  Sample Code
    ```Java
    currDevice.getDevicePreset().deletePreset(preset,
                        new LPPresetListener() {
                            @Override
                            public void onSuccess(String s) {
                                
                            }

                            @Override
                            public void onFail(Exception e) {

                            }
                        });
    ```

#### Play

- Description

    ``` Java
    playPreset(int index, LPPresetListener listener)
    ```

- Parameter

| Name            | Type                     | Description                                     |
| :-------------- | :----------------------- | :---------------------------------------------- |
| index           | int                      | Index to preset                                 |
| listener        | LPPresetListener         | Callback                                        |

- Response

    N/A


-  Sample Code
    ```Java
    currDevice.getDevicePreset().playPreset(1, new LPPresetListener() {
                    @Override
                    public void onSuccess(String s) {
                        
                    }

                    @Override
                    public void onFail(Exception e) {

                    }
                });
    ```

### Schedule Shutdown

You can schedule shutdown timer.

#### Enable

- Description

    Schedule shutdown timer.

    ``` Java
    setTimer(int time, LPTimerListener listener)
    ```

- Parameter

| Name            | Type                     | Description                                     |
| :-------------- | :----------------------- | :---------------------------------------------- |
| time            | int                      | Shutdown timer duration (s); -1 means cancel    |
| listener        | LPTimerListener          | Callback                                        |

- Response

    N/A

#### Get Scheduled Shutdown Timer

- Description

    Get current timer

    ``` Java
    getTimer(LPTimerListener listener)
    ```

- Parameter

    N/A

- Response

    N/A


### OTA

When the firmware is upgraded, the device must be connected to Wi-Fi, and Wi-Fi must have a network to enable the OTA function. You can use the getDeviceInternetStatus method in LPDeviceInfo to determine whether the current device has a network. For the device, under normal circumstances, no matter whether the device upgrades successfully or fails, it will be connected to the Wi-Fi before the upgrade. If the upgrade fails for some reason, you can wait for the device to reconnect and try the upgrade again.<br><br>

 OTA SDK implments check, trigger function. When in OTA, there're 3 steps: download, updating, rebooting, which state is MV_UP_STATUS_DOWNLOAD_START, MV_UP_STATUS_WRITE_START, MV_UP_STATUS_REBOOT


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

    ``` Java
    checkUpdate()
    ```

- Parameter

    N/A

- Response

    BOOL

- Note

    Don't call this function immediately after Wi-Fi setup; firmware needs time to check if there's new version

#### Start OTA

- Description

    ``` Java
    firmwareStartUpdate(LPOTAConfiguration config, LPOTAListener listener)
    ```

- Parameter

| Name            | Type                     | Description                                     |
| :-------------- | :----------------------- | :---------------------------------------------- |
| config          | LPOTAConfiguration       | The object in OTA process                       |
| listener        | LPOTAListener            | Callback                                        |

- Response

    N/A

#### OTA Listener

- Description

    OTA status, progress notify

    ``` Java
    otaStatusUpdated(OTAStatus status)
    ```

- Parameter

| Name            | Type                     | Description                                     |
| :-------------- | :----------------------- | :---------------------------------------------- |
| status          | OTAStatus                | Progress info                                   |

- Response

    N/A

### MCU Passthrough

Firmware establish a TCP connection with app to communicate with the MCU directly.

####  Listener

There're 2 listeners in Passthrough SDK, which for transport data and show the connection status.

#### connectionStateChanged(boolean isConnected)

- Description

    Passthrough connection status

- Parameter

| Name            | Type                     | Description                                     |
| :-------------- | :----------------------- | :---------------------------------------------- |
| isConnected     | boolean                  | Connected of not                                |

- Response

    N/A

####  passThroughMessageCome(String response)

- Description

    Passthrough data received

- Parameter

| Name            | Type                     | Description                                     |
| :-------------- | :----------------------- | :---------------------------------------------- |
| response        | String                   | Data passthrough from MCU                       |

- Response

    N/A

#### Establish Connection

- Description

    Establish connection for passthrough.

    ``` Java
    connect()
    ```

- Parameter

    N/A

- Response

    N/A

####  Disconnect

- Description

    ``` Java
    disConnect()
    ```

- Parameter

    N/A

- Response

    N/A

#### Send Data

- Description

    ``` Java
    write(String cmd)
    ```

- Parameter

| Name      | Type                     | Description                                     |
| :-------- | :----------------------- | :---------------------------------------------- |
| cmd       | String                   | Data send to MCU                                |

- Response

    N/A


### HTTP Passthrough

App and device PassThrough via HTTP.

#### Passthrough Delegate

- Description

    Delegate method for firmware to send information to App

    ``` Java
    - void passthroughViaHTTPNotify(String strPassThrough);
    ```

- Parameter

| Name            | Type                     | Description                                     |
| :-------------- | :----------------------- | :---------------------------------------------- |
| strPassThrough  | String                   | Information sent by the device                  |

- Response

    N/A

#### Start Passthrough

- Description
    App sends Passthrough information to device

    ``` Java
    - void passthroughViaHTTP(String url, String method, String body_params, LPNetworkListener callback);
    ```

- Parameter

| Name            | Type                     | Description                                     |
| :-------------- | :----------------------- | :---------------------------------------------- |
| url             | String                 | Requested url                                   |
| method          | String                 | The requested method name                       |
| body_params     | String                 | request parameters                              |
| callback        | LPNetworkListener      | callback                                        |

- Response

    N/A

- Sample Code


    ``` Java

   LPDevice device = UIApplication.currDevice;
        String url = String.format("https://%s/httpapi.asp?", device.getIp());
        String parameters = "{\"command\": \"setPowerState\", \"value\":1}";

        device.getPassthroughViaHTTP().passthroughViaHTTP(url, "passthrough",
                parameters, new LPNetworkListener() {
            @Override
            public void onSuccess(LPNetworkResponseItem response) {
                super.onSuccess(response);
                Log.i(TAG, "passthroughViaHTTP success: " + response.body);
            }

            @Override
            public void onFailure(Exception e) {
                super.onFailure(e);
                Log.i(TAG, "passthroughViaHTTP failure: " + e.getLocalizedMessage());
            }
        });
    
    ```
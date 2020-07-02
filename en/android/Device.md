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
    - (void)stop:(LPPlayerBlock _Nullable)completionHandler;
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

### Preset

Preset is the function that store music or playlist in device's flash, so that user can play music without app, like using physical button on the device.

We implement the CURD of the preset function.<br>

This SDK needs to cooperate with the LPMDPKit to use. <br>

#### List

- Description

    ``` Java
    getPresets(LPPresetListListener listener)
    ```

- Parameter

| Name             | Type                       | Description                                     |
| :--------------- | :----------------------- - | :---------------------------------------------- |
| listener         | LPPresetListListener       | Callback                                        |

- Response

    N/A

#### Update

- Description

    ``` Java
    setPreset(List<LPPresetItem> presetItems, int index, LPPresetListener listener)
    ```

- Parameter

| Name            | Type                     | Description                                     |
| :-------------- | :----------------------- | :---------------------------------------------- |
| presetItems     | List                     | Preset list                                     |
| index           | int                      | Index to preset                                 |
| listener        | LPPresetListener         | Callback                                        |

- Response

    N/A

#### Remove

- Description

    ``` Java
    deletePreset(List<LPPresetItem> presetItems, int index, LPPresetListener listener)
    ```

- Parameter

| Name            | Type                     | Description                                     |
| :-------------- | :----------------------- | :---------------------------------------------- |
| presetItems     | List                     | Preset list                                     |
| index           | int                      | Index to preset                                 |
| listener        | LPPresetListener         | Callback                                        |

- Response

    N/A

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

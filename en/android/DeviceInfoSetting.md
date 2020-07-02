# Device System Settings

# Overview

Device system related settings, includes language, name, timezone etc.

#### Name

-   Description

    ```ObjectiveC
    setDeviceName(String name, final LPDeviceSettingsListener listener)
    ```

-   Parameter

| Name       | Type                     | Description |
| :--------- | :-------                 | :---------- |
| deviceName | String                   | Name        |
| listener   | LPDeviceSettingsListener | Callback    |

-   Response

    N/A

#### Switch input source

-   Description

    Switch the input source of the device, such as Bluetooth, AUX, RCA

    ```ObjectiveC
    switchInputSource(LPInputSource source, String uuid, final LPDeviceSettingsListener listener)
    ```

-   Parameter

| Name     | Type                     | Description  |
| :-----   | :------------            | :----------- |
| source   | LPInputSource            | Input source |
| listener | LPDeviceSettingsListener | Callback     |

-   Response

    N/A

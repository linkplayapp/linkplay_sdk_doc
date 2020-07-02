# 设备信息设置

# 简介

设备信息设置，支持对设备信息的设置，如设备语音、名称、时区等信息。

#### 设置设备名称

-   接口说明

    ```ObjectiveC
    setDeviceName(String name, final LPDeviceSettingsListener listener)
    ```

-   参数

| 名称       | 类型                     | 接口说明 |
| :--------- | :-------                 | :------- |
| deviceName | String                   | 设备名称 |
| listener   | LPDeviceSettingsListener | Callback |


-   返回值

    无

#### 设置设备输入源

-   接口说明

    ```ObjectiveC
    switchInputSource(LPInputSource source, final LPDeviceSettingsListener listener)
    ```

-   参数

| 名称     | 类型                     | 接口说明   |
| :-----   | :------------            | :--------- |
| source   | LPInputSource            | 设备输入源 |
| listener | LPDeviceSettingsListener | Callback   |

-   返回值

    无

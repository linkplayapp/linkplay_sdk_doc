# 设备信息设置

# 简介

设备信息设置，支持对设备信息的设置，如设备语音、名称、时区等信息。

#### 设置设备名称

-   接口说明

    ```Java
    setDeviceName(String name, final LPDeviceSettingsListener listener)
    ```

-   参数

| 名称       | 类型                     | 接口说明 |
| :--------- | :-------                 | :------- |
| deviceName | String                   | 设备名称 |
| listener   | LPDeviceSettingsListener | Callback |


-   返回值

    无

-   示例代码
    ```Java
    currDevice.getDeviceSettings().setDeviceName("Name", new LPDeviceSettingsListener() {
                    @Override
                    public void success(String s) {

                    }

                    @Override
                    public void failure(Exception e) {

                    }
                });
    ```
#### 恢复出厂设置

-   接口说明

    ```Java
    resetDeviceWithHandler(final LPDeviceSettingsListener listener)
    ```

-   参数

| 名称       | 类型                     | 接口说明 |
| :--------- | :-------                 | :------- |
| listener   | LPDeviceSettingsListener | Callback |


-   返回值

    无

-   示例代码
    ```Java
    currDevice.getDeviceSettings().resetDeviceWithHandler(new LPDeviceSettingsListener() {
                    @Override
                    public void success(String s) {

                    }

                    @Override
                    public void failure(Exception e) {

                    }
                });
    ```
    
#### 设置设备输入源

-   接口说明

    ```Java
    switchInputSource(LPInputSource source, final LPDeviceSettingsListener listener)
    ```

-   参数

| 名称     | 类型                     | 接口说明   |
| :-----   | :------------            | :--------- |
| source   | LPInputSource            | 设备输入源 |
| listener | LPDeviceSettingsListener | Callback   |

-   返回值

    无

-   示例代码
    ```Java
        LPInputSource inputSource = LPInputSource.LPBluetooth;
        currDevice.getDeviceSettings().switchInputSource(inputSource,
           new LPDeviceSettingsListener() {
                @Override
                public void success(String s) {
                }

                @Override
                public void failure(Exception e) {
                }
        });
    ```

#### 设备网络检测

-   属性说明

    判断设备是否具有网络，如果设备网络发生更改，isHaveInternet 的值已经更新

-   示例代码
    ```Java
        currDevice.getDeviceStatus().isHaveInternet();
    ```
#### EQ
#### 获取支持的EQ和值

-   接口说明

    获取支持的EQ类型和当前的值。 在以其他方式修改EQ的值之后，您可以通知来同步该值。 返回的数据结构如下:
    ```Java
    {
        "Mode":"POP",
        "Version":1,
        "EQValue": "[
        {"Name":"BandBASS", "Value":"0"},
        {"Name":"BandLOW", "Value":"0"},
        {"Name":"BandMID", "Value":"0"},
        {"Name":"BandHIGH", "Value":"0"},
        {"Name":"BandTREBLE", "Value":"0"}
        ...
        ]
    }
    ```
    EQValue字段对应的数组是设备支持的EQ类型集合。 如果有特殊的EQ类型，请与Linkplay固件人员联系，配置服务器数据参数 通常，Value的值是-5到5，请确保Value的值是int类型。

    ```Java
    getSupportEQAndValues(final LPDeviceSettingsListener listener)
    ```

-   参数

| 名称     | 类型                     | 接口说明   |
| :-----   | :------------            | :--------- |
| listener | LPDeviceSettingsListener | Callback   |

-   返回值

    无

-   示例代码
    ```Java
        currDevice.getDeviceSettings().getSupportEQAndValues(new LPDeviceSettingsListener() {
                    @Override
                    public void success(String s) {
                        
                    }

                    @Override
                    public void failure(Exception e) {

                    }
                });
    ```

#### 设置EQ
- 接口说明
    ```Java
        setEQValues(String value, LPDeviceSettingsListener listener)
    ```
-   参数

| 名称     | 类型                     | 接口说明   |
| :-----   | :------------            | :--------- |
| value    | String | value值   |
| listener | LPDeviceSettingsListener | Callback   |

-   返回值

    无

-   示例代码
    ```Java
        currDevice.getDeviceSettings().setEQValues("0", new LPDeviceSettingsListener() {
                    @Override
                    public void success(String s) {
                        
                    }

                    @Override
                    public void failure(Exception e) {

                    }
                });
    ```
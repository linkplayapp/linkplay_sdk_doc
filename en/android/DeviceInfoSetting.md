# Device System Settings

# Overview

Device system related settings, includes language, name, timezone etc.

####  Name

-   Description

    ```Java
    setDeviceName(String name, final LPDeviceSettingsListener listener)
    ```

-   Parameter

| Name       | Type                     | Description |
| :--------- | :-------                 | :---------- |
| deviceName | String                   | Name        |
| listener   | LPDeviceSettingsListener | Callback    |

-   Response

    N/A

#### Restore

-   Description 

    ```Java
    resetDeviceWithHandler(final LPDeviceSettingsListener listener)
    ```

-   Parameter

| Name       | Type                     | Description |
| :--------- | :-------                 | :------- |
| listener   | LPDeviceSettingsListener | Callback |


-   Response

    N/A

-   Sample Code
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

#### Switch input source

-   Description

    Switch the input source of the device, such as Bluetooth, AUX, RCA

    ```Java
    switchInputSource(LPInputSource source, String uuid, final LPDeviceSettingsListener listener)
    ```

-   Parameter

| Name     | Type                     | Description  |
| :-----   | :------------            | :----------- |
| source   | LPInputSource            | Input source |
| listener | LPDeviceSettingsListener | Callback     |

-   Response

    N/A

#### Network detection

-   Description

    Judge if the device has a network, if the device network changes, at this time the value of isHaveInternet has been updated.

-   Sample Code
    ```Java
        currDevice.getDeviceStatus().isHaveInternet();
    ```

#### EQ
#### Get EQ

-   Description

     Get the supported EQ type and current Value.
    After modifying the value of EQ in other ways, you can synchronize the Value
    The data structure is as follows:
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
    The array corresponding to the EQValue field is a collection of EQ types supported by the device. If there is a special EQ type, please contact Linkplay firmware personnel to configure the server data parameters.
    Generally, the value of Value is -5 to 5, please make sure that the value of Value is of type int.

    ```Java
    getSupportEQAndValues(final LPDeviceSettingsListener listener)
    ```

-   Parameter

| Name     | Type                     | Description  |
| :-----   | :------------            | :--------- |
| listener | LPDeviceSettingsListener | Callback   |

-   Response

    N/A

-   Sample Code
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

#### Set EQ
- Description
    ```Java
        setEQValues(String value, LPDeviceSettingsListener listener)
    ```
-   Parameter

| Name     | Type                     | Description   |
| :-----   | :------------            | :--------- |
| value    | String | value   |
| listener | LPDeviceSettingsListener | Callback   |

-   Response

     N/A

-   Sample Code
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

### SSID and password

#### Hide/Open SSID

-   Description

    Hide or open the SSID of the device. When you turn on the device SSID, if there is no password, it is best to prompt the user to set the password. You can judge whether the SSID has been hidden according to the hideSSID attribute in deviceStatus (0 is Open，1 is Hidden)

    ```Java
    -  public void hideSSID(boolean hide, LPDeviceSettingsListener listener);
    ```

-   Parameter

| Name       | Type          | Description                                                                   |
| :--------- | :------------ | :-----------------------------------------------------------------------------|
| hide       | boolean          | Hide or open the SSID of the device                                           |

-   Response

    N/A

-   Sample Code

     ```Java
     // Open the device SSID
                currDevice.getDeviceSettings().hideSSID(false,
                        new LPDeviceSettingsListener() {
                    @Override
                    public void success(String s) {

                    }

                    @Override
                    public void failure(Exception e) {

                    }
                });

    // Hide the device SSID
   currDevice.getDeviceSettings().hideSSID(true,
                        new LPDeviceSettingsListener() {
                    @Override
                    public void success(String s) {

                    }

                    @Override
                    public void failure(Exception e) {

                    }
                });
    ```


#### Set SSID password

-   Description

    Set the device SSID password, please note that the password length is at least 8 digits.

    ```Java
    - public void setSSIDPassword(String password, LPDeviceSettingsListener listener);
    ```


-   Parameter

| Name       | Type          | Description                                                                   |
| :--------- | :------------ | :-----------------------------------------------------------------------------|
| password   | String      | SSID password, at least 8 digits in length                                    |

-   Response

    N/A

-   Sample Code

    ```Java
     // Set SSID password
    currDevice.getDeviceSettings().setSSIDPassword("12345678",
                        new LPDeviceSettingsListener() {
                            @Override
                            public void success(String s) {
                                
                            }

                            @Override
                            public void failure(Exception e) {

                            }
                        });
    ```
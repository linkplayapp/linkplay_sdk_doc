# Wi-Fi Setup

# Overview

Wi-Fi Setup is the first step to config the device. We supply 2 ways to do this, you should choose based on the hardware you're using:

- BLE Wi-Fi Setup

- SoftAP Wi-Fi Setup

> SDK requires location privilege after Android10 to get the phone's connected SSID.


## BLE Wi-Fi Setup ##

App setup device's Wi-Fi network through BLE connection.

### Start Scan BLE Devices ###

- Description

    Start scanning for BLE devices

    ``` Java
    startScan(LPBLEScanListener listener)
    ```

- Parameter

| Name         | Type                     | Description                                     |
| :----------- | :----------------------- | :---------------------------------------------- |
| listener     | LPBLEScanListener        | Founded BLE device                              |

- Response

    N/A

### Stop Scan BLE Devices ###

- Description

    When scan finished or not required, use this function to stop BLE scan so that lower the power consumption.

    ``` Java
    stopScan()
    ```

- Parameter

    N/A

- Response

    N/A

### Connect BLE Device ###

- Description

    Establish BLE connection with device.

    ``` Java
    connectBLE(LPBluetoothDevice device，LPConnectBLEListener listener)
    ```

- Parameter

| Name         | Type                     | Description                                     |
| :----------- | :----------------------- | :---------------------------------------------- |
| device       | LPBluetoothDevice        | The device object get from BLE scan             |
| listener     | LPConnectBLEListener     | Result of BLE connection                        |

- Response

    N/A

- Sample Code

    ``` Java
    LPBLEManager.getInstance().connectBLE(bluetoothDevice, new LPConnectBLEListener() {
                @Override
                public void onFailed(int i, String s) {
                    Log.i(TAG, "connectBLE onFailed");
                }

                @Override
                public void onStartConnect() {
                    Log.i(TAG, "connectBLE onStartConnect");
                }

                @Override
                public void onConnectFail(Exception e) {
                    Log.i(TAG, "connectBLE onConnectFail");
                }

                @Override
                public void onConnectSuccess(BluetoothGatt bluetoothGatt, int i) {

                    Log.i(TAG, "connectBLE onConnectSuccess");
                }

                @Override
                public void onDisConnected(boolean b, BluetoothGatt bluetoothGatt, int i) {
                    Log.i(TAG, "connectBLE onDisConnected");
                }
            });
    ```

### Disconnect BLE Connection ###

- Description

    Disconnect BLE connection with device

    ``` Java
    disConnect()
    ```

- Parameter

    N/A

- Response

    N/A


### Get AP List from Device ###

- Description

    Get AP list around from device through BLE

    ``` Java
    getWLANList(LPBLEAPListListener listener)
    ```

- Parameter

| Name         | Type                     | Description                                     |
| :----------- | :----------------------- | :---------------------------------------------- |
| apList       | id                       | Listener for Wi-Fi list discovery               |

- Response

    N/A

- Sample Code

    ``` Java
    LPBLEManager.getInstance().getWLANList(new LPBLEAPListListener() {
            @Override
            public void onSuccess(List<BLEAPInfo> apItemList) {
 
                Log.i(TAG, "Get WiFi list success++");
 
                adapter.clear();
 
                ArrayList<BLEAPInfo> arrayList = new ArrayList<>();
 
                arrayList.addAll(apItemList);
 
                ArrayList<BLEAPInfo> finalAPLIst = arrayList;
 
                refreshHandler.post(new Runnable() {
                    @Override
                    public void run() {
 
                        adapter.setDeviceList(finalAPLIst);
                        adapter.notifyDataSetChanged();
                    }
                });
            }
 
            @Override
            public void onFailed(Exception e) {
                Log.i(TAG, "Get WiFi list failed++");
            }
        });
    ```

### Send Wi-Fi Connect Command ###

- Description

    Send Wi-Fi connect command.

    ``` Java
    connectToWiFi(String ssid, String pwd, LPBLEConnectWifiListener listener)
    ```

- Parameter

| Name         | Type                      | Description                                     |
| :----------- | :------------------------ | :---------------------------------------------- |
| ssid         | String                    | SSID to connect                                 |
| password     | String                    | Password for AP                                 |
| listener     | LPConnectBLEListener      | Callback                                        |

- Response

    N/A

- Sample Code

    ``` Java
    LPBLEManager.getInstance().connectWLAN(ssid, pwd,
                            new LPConnectBLEListener() {
                                @Override
                                public void LPConnectSuccess(String ip, String uuid) {
                                    //searching device online
                                    connectSuccess(ip, uuid);
                                }
 
                                @Override
                                public void LPConnectFailed(int errorCode) {
                                    //connect failed
                                    connectFail(errorCode);
                                }
                            });
    ```

## SoftAP Wi-Fi Setup ##

LPWiFiSetupManager implements the softAP Wi-Fi setup.

- `LPApItem`

    Response object from getAPList

| Name                   | Type              | Description                              |
| ---------------------- | ----------------- | ---------------------------------------- |
| SSID                   | String          | SSID Name                                |
| RSSI                   | String          | Signal Strength                          |
| BSSID                  | String          | BSSID                                    |
| Channel                | String          | Channel                                  |
| Auth                   | String          | Auth                                     |
| Encry                  | String          | Encryption                               |


- `LPWiFiSetupFailed` errorCode

| Name                   | Type              | Description                                          |
| ---------------------- | ----------------- | ----------------------------------------             |
| 1001                   | int               | Phone connects to different Wi-Fi from user's choice |
| 1002                   | int               | Other errors                                         |

### Check if Phone Connected to Device's AP ###

- Description

    SoftAP requires phone connected to device's hotspot, so you need a function to check this.

    ``` Java
    isLinkplayHotspot()
    ```

- Parameter

N/A

- Response

    BOOL

### Get AP List from Device ###

- Description

    After connected to device's hotspot, call this function to get AP list around from device.

    ``` Java
    getApList（LPApListListener listener）
    ```

- Parameter

| Name      | Type                     | Description                                     |
| :-------- | :----------------------- | :---------------------------------------------- |
| listener  | LPAPListListener         | Get AP list listener                            |

- Response

    N/A

### Send Wi-Fi Connect Command ###

- Description

    ``` Java
    connectToWiFi(LPApItem item, String pwd, LPWiFiSetupListener listener)
    ```

- Parameter

| Name      | Type                     | Description                                     |
| :-------- | :----------------------- | :---------------------------------------------- |
| item      | LPApItem                 | Wi-Fi object to connect                         |
| pwd       | String                   | Password                                        |
| listener  | LPWiFiSetupListener      | Callback                                        |

- Response

    N/A

### Recheck SoftAP Wi-Fi Setup Result ###

- Description

    If SoftAP Wi-Fi setup failed and phone connected to different AP from destination AP, you could call this function to recheck the result

    ``` Java
    retryCheckWithTime（int timeout, LPWiFiSetupListener listener）
    ```

- Parameter

| Name      | Type                     | Description                                     |
| :-------- | :----------------------- | :---------------------------------------------- |
| timeout   | int                      | Recheck timeout, default 30s                    |
| listener  | LPApListListener         | Callback                                                |

- Response

    N/A

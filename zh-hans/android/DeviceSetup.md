# 设备配网

# Overview 

设备配网是用户配置设备的第一步。设备配网SDK提供了把设备配置到路由器的能力，目前提供以下两种配网方式：

- BLE配网模式

- SoftAP配网模式

> Android10及以上需要提供定位权限，拿到手机所连的Wi-Fi的名称。


## BLE 配网模式 ##

BLE SDK 中提供了配网功能，通过与设备建立BLE连接，发送配网信息至设备，设备连接Wi-Fi之后发送连接结果给App。

### 开始扫描BLE设备 ###

- 接口说明

    开始扫描BLE设备

    ``` Java
    startScan(LPBLEScanListener listener)
    ```

- 参数

| 名称         | 类型                     | 接口说明                                        |
| :----------- | :----------------------- | :---------------------------------------------- |
| listener     | LPBLEScanListener        | BLE扫描结果回调                                 |

- 返回值

    无

### 停止扫描BLE设备 ###

- 接口说明

    配网结束或者不需要扫描时，请停止扫描BLE设备，降低应用耗电。

    ``` Java
    stopScan()
    ```

- 参数

    无

- 返回值

    无

### 连接设备 ###

- 接口说明

    与设备建立BLE连接。

    ``` Java
    connectBLE(LPBluetoothDevice device，LPConnectBLEListener listener)
    ```

- 参数

| 名称         | 类型                     | 接口说明                                        |
| :----------- | :----------------------- | :---------------------------------------------- |
| device       | LPBluetoothDevice        | BLE 设备                                        |
| listener     | LPConnectBLEListener     | BLE连接状态回调                                 |

- 返回值

    无

- 示例代码

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

### 断开与设备的连接 ###

- 接口说明

    断开与设备的BLE连接。

    ``` Java
    disConnect()
    ```

- 参数

    无

- 返回值

    无


### 获取 Wi-Fi 列表 ###

- 接口说明

    获取设备周边的 Wi-Fi 列表。

    ``` Java
    getWLANList(LPBLEAPListListener listener)
    ```

- 参数

| 名称         | 类型                     | 接口说明                                        |
| :----------- | :----------------------- | :---------------------------------------------- |
| listener     | LPBLEAPListListener      | BLE获取Wi-Fi列表回调                            |

- 返回值

    无

- 示例代码

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

### 发送配网信息 ###

- 接口说明

    发送配网指令。

    ``` Java
    connectToWiFi(String ssid, String pwd, LPBLEConnectWifiListener listener)
    ```

- 参数

| 名称         | 类型                      | 接口说明                                        |
| :----------- | :------------------------ | :---------------------------------------------- |
| ssid         | String                    | Wi-Fi SSID                                      |
| password     | String                    | Wi-Fi 密码                                      |
| listener        | LPConnectBLEListener      | 配网操作的回调                                  |

- 返回值

    无

- 示例代码

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
    
### LPBLEState
- 描述
BLE 配网流程中使用的常量

- 常量

| 名称                      | Description                                          |
| ----------------------    | ----------------------------------------             |
| LP_BLE_BLUETOOTH_DISABLED | 搜索时蓝牙未打开                                     |
| LP_BLE_CONNECT_ERROR      | 建立BLE连接失败                                      |
| LP_BLE_LINK_TIMEOUT       | BLE配网超时                                          |
| LP_BLE_LINK_ERROR_01      | 固件配网错误：Have not scanned the specified SSID    |
| LP_BLE_LINK_ERROR_02      | 固件配网错误：WIFI connection timeout                |
| LP_BLE_LINK_ERROR_03      | 固件配网错误：DHCP timeout                           |
| LP_BLE_LINK_ERROR_04      | 固件配网错误：The password you entered is incorrect  |
| LP_BLE_LINK_ERROR_05      | 固件配网错误：Unsupported router encryption protocol |
| LP_BLE_LINK_ERROR_06      | 固件配网错误：Parameter error                        |
| LP_BLE_LINK_ERROR_07      | 固件配网错误：Other errors                           |

## SoftAP 配网模式 ##

LPWiFiSetupManager 提供了Wi-Fi配网的能力。

- `LPApItem`

    路由信息：ssid名称，信号强度，bssid地址等

| 名称                   | 类型              | 描述                                     |
| ---------------------- | ----------------- | ---------------------------------------- |
| SSID                   | String            | SSID 名称                                |
| RSSI                   | int               | 信号强度                                 |
| BSSID                  | String            | 信号地址                                 |
| Channel                | int               | 信道                                     |
| Auth                   | String            | 授权                                     |
| Encry                  | String            | 加密方式                                 |


- `LPWiFiSetupFailed` errorCode

    errorCode 所对应的含义

| 名称                    | 类型             | 描述                                     |
| ---------------------- | -----------------| ----------------------------------------|
| 1001                   | int              | 手机当前连接的Wi-Fi和用户选择的Wi-Fi不一致    |
| 1002                   | int              | 其他错误                                  |



### 检测手机是否连接到设备热点 ###

- 接口说明

    Wi-Fi配网模式需要手机的Wi-Fi连接到设备的热点网络上，所以需要检测手机的Wi-Fi是否连接到设备热点，可以设定检测的时间

    ``` Java
    isLinkplayHotspot()
    ```

- 参数

N/A

- 返回值

    BOOL

### 获取 Wi-Fi 列表 ###

- 接口说明

    手机Wi-Fi连接到设备热点后，可以获取到周边的Wi-Fi列表。

    ``` Java
    getApList（LPApListListener listener）
    ```

- 参数

| 名称      | 类型                     | 描述                                            |
| :-------- | :----------------------- | :---------------------------------------------- |
| listener  | LPAPListListener         | 获取AP列表回调                                  |

- 返回值

    无

### 开始配网接口 ###

- 接口说明

    ``` Java
    connectToWiFi(LPApItem item, String pwd, LPWiFiSetupListener listener)
    ```
    
    设备连接Wi-Fi时，手机与设备之间的连接将会断开，手机会自动连接到其他Wi-Fi上。请提示用户将手机连接到目标Wi-Fi上。

- 参数

| 名称      | 类型                     | 接口说明                                        |
| :-------- | :----------------------- | :---------------------------------------------- |
| item      | LPApItem                 | 选择的目标Wi-Fi对象                             |
| pwd       | String                   | Wi-Fi的密码                                     |
| listener  | LPWiFiSetupListener      | 配网操作的回调                                  |

- 返回值

    无

### 重新检测配网结果 ###

- 接口说明

    配网失败后，如果手机所连WiFi和选择的目标路由器Wi-Fi不一致，可调用此方法重新检测配网结果

    ``` Java
    retryCheckWithTime（int timeout, LPWiFiSetupListener listener）
    ```

- 参数

| 名称      | 类型                     | 接口说明                                        |
| :-------- | :----------------------- | :---------------------------------------------- |
| timeout   | int                      | 重新检测的时间，默认30s                         |
| listener  | LPApListListener         | 回调                                            |

- 返回值

    无

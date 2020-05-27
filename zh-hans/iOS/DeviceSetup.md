# 设备配网

# Overview 

设备配网SDK提供了把设备配置到路由器的能力，iOS13及以上需要提供定位权限，拿到手机所连的Wi-Fi的名称，目前提供以下两种配网方式：

- BLE配网模式

- Wi-Fi配网模式


### BLE 配网模式

BLE SDK 中提供了配网功能，通过与设备建立BLE连接，发送配网信息至设备，设备连接Wi-Fi之后发送连接结果给App。LPBLEManager 提供了相应的API。

- `LP_CONNECT_AP_STATE`

    BLE 设备配网的结果

| 名称                              | 描述                                     |
| -------------------------------- | ---------------------------------------- |
| LP_CONNECT_AP_SUCCESS            | 设备配网成功                               |
| LP_CONNECT_AP_START              | 设备开始连接路由                            |
| LP_CONNECT_AP_NO_SSID            | 设备没有发现该SSID                          |
| LP_CONNECT_AP_WIFI_TIMEOUT       | 设备连接路由超时                            |
| LP_CONNECT_AP_DHCP_TIMEOUT       | DHCP超时                                  |
| LP_CONNECT_AP_PASSWORD_ERROR     | 密码错误                                   |
| LP_CONNECT_AP_NO_SUPPORT_SECRET  | 不支持的加密类型                            |
| LP_CONNECT_AP_PARAMETER_ERROR    | 参数错误                                   |
| LP_CONNECT_AP_OTHER_ERROR        | 其他错误                                   |


#### 系统蓝牙状态监测

- 示例代码

    ``` ObjectiveC
    [LPBLEManager shareInstance].delegate = self;

     #pragma mark —————LPBLEManagerDelegate —————

    - (void)BLEManger:(LPBLEManager *)BLEManger BLEPoweredOff:(BOOL)isPoweredOff {
        NSLog(@"BLE state change: %d", isPoweredOff ? 0 : 1);
    }

    - (void)BLEMangerDidDisconnectPeripheral {
        NSLog(@"BLE didDisconnect");
    }

    - (void)BLEManger:(LPBLEManager *)BLEManger BLEState:(CBCentralManagerState)state {
        NSLog(@"BLE state");
    }
    ```

#### 开始扫描BLE设备

- 接口说明

    配网失败后，如果手机所连WiFi和选择的目标路由器Wi-Fi不一致，可调用此方法重新检测配网结果

    ``` ObjectiveC
    - (void)retryCheckWithTime:(int)time success:(LPWiFiSetupSuccess)success failed:(LPWiFiSetupFailed)failed;
    ```

- 参数

| 名称          | 类型                      | 接口说明                                          |
| :----------- | :----------------------- | :----------------------------------------------  |
| peripheral   | LPPeripheral             | BLE搜索到设备对象                                   |

- 返回值

    无

- 示例代码

    ``` ObjectiveC
    if ([LPBLEManager shareInstance].state == CBManagerStatePoweredOn) {
        [[LPBLEManager shareInstance] startScan:^(LPPeripheral * _Nonnull peripheral) {
            [self.deviceArray addObject:peripheral];
        }];
    }
    ```

####  停止扫描BLE设备

- 接口说明

    配网结束或者不需要扫描时，请停止扫描BLE设备，降低应用耗电。

    ``` ObjectiveC
    - (void)stopScan;
    ```

- 参数

    无

- 返回值

    无

#### 连接设备

- 接口说明

    与设备建立BLE连接。

    ``` ObjectiveC
    - (void)connectBLE:(LPPeripheral *)peripheral callback:(void (^)(LP_BLE_CONNECT_RESULT state))callback;
    ```

- 参数

| 名称          | 类型                      | 接口说明                                          |
| :----------- | :----------------------- | :----------------------------------------------  |
| peripheral   | LPPeripheral             | BLE搜索到设备对象                                   |
| state        | LP_BLE_CONNECT_RESULT    | 连接BLE设备的结果                                   |

- 返回值

    无

- 示例代码

    ``` ObjectiveC
    [[LPBLEManager shareInstance] connectBLE:peripheral callback:^(LP_BLE_CONNECT_RESULT state) {
        if (state == LP_BLE_CONNECT_SUCCESS) {
            NSLog(@"BLE connection successful");
        }else {
          NSLog(@"BLE connection failed");
        }
    }];
    ```

####  断开与设备的连接

- 接口说明

    断开与设备的BLE连接。

    ``` ObjectiveC
    - (void)disconnectBLE;
    ```

- 参数

    无

- 返回值

    无


#### 获取 Wi-Fi 列表

- 接口说明

    获取设备周边的 Wi-Fi 列表。

    ``` ObjectiveC
    - (void)getWLANListWithCallback:(void(^)(id _Nullable apList))callback;
    ```

- 参数

| 名称          | 类型                      | 接口说明                                          |
| :----------- | :----------------------- | :----------------------------------------------  |
| apList       | id                       | 	周边的Wi-Fi列表                                |

- 返回值

    无

- 示例代码

    ``` ObjectiveC
    [[LPBLEManager shareInstance] getWLANList:NO callback:^(id  _Nullable apList) {
        NSLog(@"Wi-Fi List = %@", apList);
    }];
    ```

#### 发送配网信息

- 接口说明

    与设备建立BLE连接。

    ``` ObjectiveC
    - (void)connectWLAN:(NSString *)ssid password:(NSString *)password auth:(NSString *)auth encry:(NSString *)encry
               callback:(void(^)(LP_CONNECT_AP_STATE code, id _Nullable responseObj))callback;
    ```

- 参数

| 名称          | 类型                      | 接口说明                                           |
| :----------- | :------------------------ | :----------------------------------------------  |
| ssid         | NSString                  | 手机所连的 Wi-Fi 名称                               |
| password     | NSString                  | Wi-Fi 密码                                         |
| auth         | NSString                  | auth                                              |
| encry        | NSString                  | encry                                             |

- 返回值

    无

- 示例代码

    ``` ObjectiveC
    __block NSDictionary *infoDict = @{};
    [[LPBLEManager shareInstance] getWLANListWithCallback:^(id  _Nullable apList) {
        infoDict = apList[indexPath.row];
        [[LPBLEManager shareInstance] connectWLAN:infoDict[@"ssid"] password:password auth:infoDict[@"auth"] encry:infoDict[@"encry"] callback:^(LP_CONNECT_AP_STATE code, id  _Nullable responseObj) {
            if (code == LP_CONNECT_AP_SUCCESS && responseObj) {
                     NSLog(@"[BLE] success = %@", responseObj);
                     NSDictionary * infoDic = responseObj;
                     self.UUID = infoDic[@"UUID"];
                     LPDevice *device = [[LPDeviceManager sharedInstance] deviceForID:infoDic[@"UUID"]];
                     if (device) {
                         [self success];
                     }else {
                         if (!self->searchTimer) {
                             self->checkDate = [NSDate date];
                             self->searchTimer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(waitForDeivceOnline) userInfo:nil repeats:YES];
                             [[NSRunLoop mainRunLoop] addTimer:self->searchTimer forMode:NSDefaultRunLoopMode];
                             [self->searchTimer fire];
                         }
                     }
                 }else if (code == LP_CONNECT_AP_START) {
                     NSLog(@"[BLE] connectWLAN start");
                 }else {
                     NSLog(@"[BLE] setup Failed = %@", responseObj);
                     [self setupFailed];
                 }
        }];
    }];
    ```

### Wi-Fi 配网模式

LPWiFiSetupManager 提供了Wi-Fi配网的能力。

- `LPApItem` 数据模型

    getApList 返回的Wi-Fi对象，包含以下信息

| 名称                    | 类型             | 描述                                     |
| ---------------------- | -----------------| ----------------------------------------|
| SSID                   | NSString          | SSID 名称                               |
| RSSI                   | NSString          | 信号强度                                 |
| BSSID                  | NSString          | 信号地址                                 |
| Channel                | NSString          | 信道                                    |
| Auth                   | NSString          | 授权                                    |
| Encry                  | NSString          | 加密方式                                 |


- `LPWiFiSetupFailed` errorCode

    errorCode 所对应的含义

| 名称                    | 类型             | 描述                                     |
| ---------------------- | -----------------| ----------------------------------------|
| 1001                   | int              | 手机当前连接的Wi-Fi和用户选择的Wi-Fi不一致    |
| 1002                   | int              | 其他错误                                  |



#### 检测手机是否连接到设备热点

- 接口说明

    Wi-Fi配网模式需要手机的Wi-Fi连接到设备的热点网络上，所以需要检测手机的Wi-Fi是否连接到设备热点，可以设定检测的时间

    ``` ObjectiveC
    - (void)isLinkplayHotspotWithCheckTime:(int)time block:(void(^)(BOOL isDirect))block;
    ```

- 参数

| 名称       | 类型                      | 接口说明                                          |
| :-------- | :----------------------- | :----------------------------------------------  |
| time      | int                      | 是否连接到设备热点的检测时间                          |

- 返回值

    布尔类型，true/false

- 示例代码

    ``` ObjectiveC
    [[LPWiFiSetupManager sharedInstance] isLinkplayHotspotWithCheckTime:10 block:^(BOOL isDirect) {
        if (!isDirect) {
            NSLog(@"The WiFi connected to the phone is not a hotspot from the device");
        }else {
            NSLog(@"The WiFi connected to the phone is a hotspot from the device");
        }
    }];
    ```

#### 获取 Wi-Fi 列表

- 接口说明

    手机Wi-Fi连接到设备热点后，可以获取到周边的Wi-Fi列表。

    ``` ObjectiveC
    - (void)getApList:(LPApListBlock)block;
    ```

- 参数

    无

- 返回值

    无

- 示例代码

    ``` ObjectiveC
    __weak __typeof(self)weakSelf = self;
    [[LPWiFiSetupManager sharedInstance] getApList:^(NSMutableArray * _Nonnull LPApList) {
        weakSelf.wlanDetailsArray = LPApList;
    }];
    ```

#### 开始配网接口

- 接口说明

    ``` ObjectiveC
    - (void)connectToWiFi:(LPApItem *)apItem pass:(NSString *)pass success:(LPWiFiSetupSuccess)success failed:(LPWiFiSetupFailed)failed;
    ```

- 参数

| 名称       | 类型                      | 接口说明                                          |
| :-------- | :----------------------- | :----------------------------------------------  |
| item      | LPApItem                 | 选择的目标Wi-Fi对象                                |
| pass      | NSString                 | Wi-Fi的密码                                       |

- 返回值

    无

- 示例代码

    ``` ObjectiveC
    LPApItem *apItem = [_wlanDetailsArray objectAtIndex:indexPath.row];
    [[LPWiFiSetupManager sharedInstance] connectToWiFi:apItem pass:passwordText.text success:^(LPDevice * _Nonnull device) {
        NSLog(@"LPWiFiConnect success");
    } failed:^(int errorCode) {
        NSLog(@"LPWiFiConnect failed");
    }];
    ```

#### 重新检测配网结果

- 接口说明

    配网失败后，如果手机所连WiFi和选择的目标路由器Wi-Fi不一致，可调用此方法重新检测配网结果

    ``` ObjectiveC
    - (void)retryCheckWithTime:(int)time success:(LPWiFiSetupSuccess)success failed:(LPWiFiSetupFailed)failed;
    ```

- 参数

| 名称       | 类型                      | 接口说明                                          |
| :-------- | :----------------------- | :----------------------------------------------  |
| time      | int                       | 重新检测的时间，默认30s                             |

- 返回值

    无

- 示例代码

    ``` ObjectiveC
    LPApItem *apItem = [_wlanDetailsArray objectAtIndex:indexPath.row];
    [[LPWiFiSetupManager sharedInstance] connectToWiFi:apItem pass:passwordText.text success:^(LPDevice * _Nonnull device) {
        NSLog(@"LPWiFiConnect success");
    } failed:^(int errorCode) {
        NSLog(@"LPWiFiConnect failed");
        if (errorCode == 1001) {
                 
            [[LPWiFiSetupManager sharedInstance] retryCheckWithTime:30 success:^(LPDevice * _Nonnull device) {
                NSLog(@"LPWiFiConnect success");
            } failed:^(int errorCode) {
                NSLog(@"LPWiFiConnect failed");
            }];
        }
    }];
    ```


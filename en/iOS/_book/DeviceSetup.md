# Wi-Fi Setup

# Overview

Wi-Fi Setup is the first step to config the device. We supply 2 ways to do this, you should choose based on the hardware you're using:

- BLE Wi-Fi Setup

- SoftAP Wi-Fi Setup

> SDK requires location privilege after iOS13 to get the phone's connected SSID.


### BLE Wi-Fi Setup

App setup device's Wi-Fi network through BLE connection.

- `LP_CONNECT_AP_STATE`

Wi-Fi setup response

| Name                             | Description                              |
| -------------------------------- | ---------------------------------------- |
| LP_CONNECT_AP_SUCCESS            | BLE setup successfully                   |
| LP_CONNECT_AP_START              | Device starts to connect to AP           |
| LP_CONNECT_AP_NO_SSID            | Device can't find the SSID               |
| LP_CONNECT_AP_WIFI_TIMEOUT       | Connect AP DSPWriteTimeoutt              |
| LP_CONNECT_AP_DHCP_TIMEOUT       | DHCP timeout                             |
| LP_CONNECT_AP_PASSWORD_ERROR     | Wrong password                           |
| LP_CONNECT_AP_NO_SUPPORT_SECRET  | Unsupported encryption type              |
| LP_CONNECT_AP_PARAMETER_ERROR    | Parameter error                          |
| LP_CONNECT_AP_OTHER_ERROR        | Other error                              |


#### Phone BLE Status

- Sample Code

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

#### Start Scan BLE Devices

- Description

    Start scanning for BLE devices

    ``` ObjectiveC
    - (void)startScan:(void (^)(LPPeripheral *peripheral))callback;
    ```

- Parameter

| Name         | Type                     | Description                                     |
| :----------- | :----------------------- | :---------------------------------------------- |
| peripheral   | LPPeripheral             | Founded BLE device                              |
|              |                          |                                                 |

- Response

    N/A

- Sample Code

    ``` ObjectiveC
    if ([LPBLEManager shareInstance].state == CBManagerStatePoweredOn) {
        [[LPBLEManager shareInstance] startScan:^(LPPeripheral * _Nonnull peripheral) {
            [self.deviceArray addObject:peripheral];
        }];
    }
    ```

####  Stop Scan BLE Devices

- Description

    When scan finished or not required, use this function to stop BLE scan so that lower the power consumption.

    ``` ObjectiveC
    - (void)stopScan;
    ```

- Parameter

    N/A

- Response

    N/A

#### Connect BLE Device

- Description

    Establish BLE connection with device.

    ``` ObjectiveC
    - (void)connectBLE:(LPPeripheral *)peripheral callback:(void (^)(LP_BLE_CONNECT_RESULT state))callback;
    ```

- Parameter

| Name         | Type                     | Description                                     |
| :----------- | :----------------------- | :---------------------------------------------- |
| peripheral   | LPPeripheral             | The device object get from BLE scan             |
| state        | LP_BLE_CONNECT_RESULT    | Result of BLE connection                        |

- Response

    N/A

- Sample Code

    ``` ObjectiveC
    [[LPBLEManager shareInstance] connectBLE:peripheral callback:^(LP_BLE_CONNECT_RESULT state) {
        if (state == LP_BLE_CONNECT_SUCCESS) {
            NSLog(@"BLE connection successful");
        }else {
          NSLog(@"BLE connection failed");
        }
    }];
    ```

#### Disconnect BLE Connection

- Description

    Disconnect BLE connection with device

    ``` ObjectiveC
    - (void)disconnectBLE;
    ```

- Parameter

    N/A

- Response

    N/A


#### Get AP List from Device

- Description

    Get AP list around from device through BLE

    ``` ObjectiveC
    - (void)getWLANListWithCallback:(void(^)(id _Nullable apList))callback;
    ```

- Parameter

| Name         | Type                     | Description                                     |
| :----------- | :----------------------- | :---------------------------------------------- |
| apList       | id                       | AP list around                                  |

- Response

    N/A

- Sample Code

    ``` ObjectiveC
    [[LPBLEManager shareInstance] getWLANList:NO callback:^(id  _Nullable apList) {
        NSLog(@"Wi-Fi List = %@", apList);
    }];
    ```

#### Send Wi-Fi Connect Command

- Description

    Send Wi-Fi connect command.

    ``` ObjectiveC
    - (void)connectWLAN:(NSString *)ssid password:(NSString *)password auth:(NSString *)auth encry:(NSString *)encry
               callback:(void(^)(LP_CONNECT_AP_STATE code, id _Nullable responseObj))callback;
    ```

- Parameter

| Name         | Type                      | Description                                     |
| :----------- | :------------------------ | :---------------------------------------------- |
| ssid         | NSString                  | SSID to connect                                 |
| password     | NSString                  | Password for AP                                 |
| auth         | NSString                  | auth                                            |
| encry        | NSString                  | encry                                           |

- Response

    N/A

- Sample Code

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

### SoftAP Wi-Fi Setup

LPWiFiSetupManager implements the softAP Wi-Fi setup.

- `LPApItem`

    Response object from getAPList

| Name                   | Type              | Description                              |
| ---------------------- | ----------------- | ---------------------------------------- |
| SSID                   | NSString          | SSID Name                                |
| RSSI                   | NSString          | Signal Strength                          |
| BSSID                  | NSString          | BSSID                                    |
| Channel                | NSString          | Channel                                  |
| Auth                   | NSString          | Auth                                     |
| Encry                  | NSString          | Encryption                               |


- `LPWiFiSetupFailed` errorCode

| Name                   | Type              | Description                                          |
| ---------------------- | ----------------- | ----------------------------------------             |
| 1001                   | int               | Phone connects to different Wi-Fi from user's choice |
| 1002                   | int               | Other errors                                         |

#### Check if Phone Connected to Device's AP

- Description

    SoftAP requires phone connected to device's hotspot, so you need a function to check this.

    ``` ObjectiveC
    - (void)isLinkplayHotspotWithCheckTime:(int)time block:(void(^)(BOOL isDirect))block;
    ```

- Parameter

| Name      | Type                     | Description                                     |
| :-------- | :----------------------- | :---------------------------------------------- |
| time      | int                      | Timeout to check                                |

- Response

    BOOL

- Sample Code

    ``` ObjectiveC
    [[LPWiFiSetupManager sharedInstance] isLinkplayHotspotWithCheckTime:10 block:^(BOOL isDirect) {
        if (!isDirect) {
            NSLog(@"The WiFi connected to the phone is not a hotspot from the device");
        }else {
            NSLog(@"The WiFi connected to the phone is a hotspot from the device");
        }
    }];
    ```

#### Get AP List from Device

- Description

    After connected to device's hotspot, call this function to get AP list around from device.

    ``` ObjectiveC
    - (void)getApList:(LPApListBlock)block;
    ```

- Parameter

    N/A

- Response

    N/A

- Sample Code

    ``` ObjectiveC
    __weak __typeof(self)weakSelf = self;
    [[LPWiFiSetupManager sharedInstance] getApList:^(NSMutableArray * _Nonnull LPApList) {
        weakSelf.wlanDetailsArray = LPApList;
    }];
    ```

#### Send Wi-Fi Connect Command

- Description

    ``` ObjectiveC
    - (void)connectToWiFi:(LPApItem *)apItem pass:(NSString *)pass success:(LPWiFiSetupSuccess)success failed:(LPWiFiSetupFailed)failed;
    ```

- Parameter

| Name      | Type                     | Description                                     |
| :-------- | :----------------------- | :---------------------------------------------- |
| item      | LPApItem                 | Wi-Fi object to connect                         |
| pass      | NSString                 | Password                                        |

- Response

    N/A

- Sample Code

    ``` ObjectiveC
    LPApItem *apItem = [_wlanDetailsArray objectAtIndex:indexPath.row];
    [[LPWiFiSetupManager sharedInstance] connectToWiFi:apItem pass:passwordText.text success:^(LPDevice * _Nonnull device) {
        NSLog(@"LPWiFiConnect success");
    } failed:^(int errorCode) {
        NSLog(@"LPWiFiConnect failed");
    }];
    ```

#### Recheck SoftAP Wi-Fi Setup Result

- Description

    If SoftAP Wi-Fi setup failed and phone connected to different AP from destination AP, you could call this function to recheck the result

    ``` ObjectiveC
    - (void)retryCheckWithTime:(int)time success:(LPWiFiSetupSuccess)success failed:(LPWiFiSetupFailed)failed;
    ```

- Parameter

| Name      | Type                     | Description                                     |
| :-------- | :----------------------- | :---------------------------------------------- |
| time      | int                      | Recheck timeout, default 30s                    |

- Response

    N/A

- Sample Code

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


# 设备信息设置

# 简介

设备信息设置，支持对设备信息的设置，如设备语音、名称、时区等信息。

### 设置设备名称

-   接口说明

    ```ObjectiveC
    - (void)setDeviceName:(NSString *)deviceName completionHandler:(LPSDKReturnBlock _Nullable)completionHandler;
    ```

-   参数

| 名称       | 类型     | 接口说明 |
| :--------- | :------- | :------- |
| deviceName | NSString | 设备名称 |

-   返回值

    无

-   示例代码

    ```ObjectiveC
    [device.deviceSettings setDeviceName:@"Music" completionHandler:^(NSURLResponse * _Nullable response, id  _Nullable responseObject, NSError * _Nullable error) {
        if ([responseObject[@"result"] isEqualToString:@"OK"]) {
           NSLog(@"Set device name successfully");
        }
    }];
    ```

### 恢复出厂设置

-   接口说明

    ```ObjectiveC
    - (void)resetDeviceWithHandler:(LPSDKReturnBlock _Nullable)completionHandler;
    ```

-   参数

    无

-   返回值

    无

-   示例代码

    ```ObjectiveC
    [device.deviceSettings resetDeviceWithHandler:^(NSURLResponse * _Nullable response, id  _Nullable responseObject, NSError * _Nullable error) {
        if ([responseObject[@"result"] isEqualToString:@"OK"]) {
           NSLog(@"Reset device successfully");
        }
    }];
    ```

### 获取当前输入源

-   接口说明

    获取设备当前的输入模式

    ```ObjectiveC
    LPInputSource currentDeviceInputMode = device.deviceStatus.currentInputMode;
    ```

### 获取支持的输入源列表 

-   接口说明

    设备支持的输入源列表，内容是LPInputSource 类型对应的数字

    ```ObjectiveC
    - (NSArray *)getSupportInputSource;
    ```

-   参数

    无


-   返回值

| 类型           | 接口说明                                                     |
| :------------ | :---------------------------------------------------------- |
| NSArray       | 输入源数组, 内容是LPInputSource 类型对应的数字                   |

-   示例代码

    ```ObjectiveC
    NSArray *inputModeArray = [device.deviceSettings getSupportInputSource];
    for (NSNumber *inputMode in inputModeArray) {
        LPInputSource source = [inputMode intValue];
        NSLog(@"Input source supported by the device: = %d", source);
    }
    ```


### 设置设备输入源

-   接口说明

    ```ObjectiveC
    - (void)switchInputSource:(LPInputSource)source  completionHandler:(LPSDKReturnBlock _Nullable)completionHandler;
    ```

-   参数

| 名称   | 类型          | 接口说明   |
| :----- | :------------ | :--------- |
| source | LPInputSource | 设备输入源 |

-   返回值

    无

-   示例代码

    ```ObjectiveC
    LPInputSource *sourc = LPBluetooth;
    [device.deviceSettings switchInputSource:source completionHandler:^(NSURLResponse * _Nullable response, id  _Nullable responseObject, NSError * _Nullable error) {
        if ([responseObject[@"result"] isEqualToString:@"OK"]) {
            NSLog(@"Switch deivce input source successfully");
        }
    }];
    ```

### 设备网络检测

-   属性说明

    判断设备是否具有网络，如果设备网络发生更改，会触发通知 LPInternetAccessChange，此时isHaveInternet 的值已经更新

    ```ObjectiveC
    // LPDeviceStatus
    @property (nonatomic, assign) BOOL isHaveInternet;
    ```

-   示例代码

    ```ObjectiveC
    if (device.deviceStatus.isHaveInternet) {
        NSLog(@"Device has a network");
    }else {
        NSLog(@"Device has no network");
    }
    ```

    ```ObjectiveC
    // NSNotification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(internetAccessChange:) name:@"LPInternetAccessChange" object:nil];

    - (void)internetAccessChange:(NSNotification *)notification {
        NSDictionary *infoDict = notification.object;
        NSLog(@"UUID = %@ isHaveInternet = %@", infoDict[@"UUID"], infoDict[@"isHaveInternet"]);
    }

    ```

### EQ

#### 获取支持的EQ和值

-   接口说明
    
    获取支持的EQ类型和当前的值。
    在以其他方式修改EQ的值之后，您可以通过LPEQValueChangeNotification通知来同步该值。
    返回的数据结构如下:
    ```
    {
        "Mode":"POP",
        "Version":1,
        "EQValue": @[
            @{@"Name":@"BandBASS", @"Value":@"0"},
            @{@"Name":@"BandLOW", @"Value":@"0"},
            @{@"Name":@"BandMID", @"Value":@"0"},
            @{@"Name":@"BandHIGH", @"Value":@"0"},
            @{@"Name":@"BandTREBLE", @"Value":@"0"}
            ...
        ]
    }
    ```
    EQValue字段对应的数组是设备支持的EQ类型集合。 如果有特殊的EQ类型，请与Linkplay固件人员联系，配置服务器数据参数
    通常，Value的值是-5到5，请确保Value的值是int类型。
    ```ObjectiveC
    - (void)getSupportEQAndValues:(LPSDKReturnBlock _Nullable)completionHandler;
    ```

-   参数

    无

-   返回值

    无

-   示例代码

    ```ObjectiveC
    [device.deviceSettings getSupportEQAndValues:^(NSURLResponse * _Nullable response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (responseObject) {
            NSLog(@"SupportEQ = %@", responseObject[@"EQValue"]);
        }
    }];
    ```

#### 设置 EQ

-   接口说明

    设置各个EQ类型的值

    ```ObjectiveC
    - (void)setEQValues:(NSDictionary *)valuesDict completionHandler:(LPSDKReturnBlock _Nullable)completionHandler;
    ```

-   参数

| 名称        | 类型          | 接口说明                                            |
| :-----     | :------------ | :-------------------------------------------------|
| valuesDict | NSDictionary  | getSupportEQAndValues接口返回的EQValue的数据结构      |


-   返回值

    无

-   示例代码

    ```ObjectiveC
    //valuesArray: the device supported EQ types
    NSArray *valuesArray = @[@{@"Name":@"BandBASS", @"Value":@"-5"} ,@{@"Name":@"BandLOW", @"Value":@"-2"},@{@"Name":@"BandMID", @"Value":@"0"},@{@"Name":@"BandHIGH", @"Value":@"2"},@{@"Name":@"BandTREBLE", @"Value":@"5"}];
    NSDictionary *EQValuesDict = @{@"EQValue":valuesArray};
    [device.deviceSettings setEQValues:EQValuesDict completionHandler:^(NSURLResponse * _Nullable response, id  _Nullable responseObject, NSError * _Nullable error) {
        NSLog(@"EQValue = %@", responseObject[@"EQValue"]);
    }];
    ```
   
#### EQ 通知

- 通知说明

  当EQ通过设置或者别的手机调节的时候，会触发这个通知，从而同步更新数据

  LPEQValueChangeNotification

-   示例代码

    ```ObjectiveC
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(EQValueChangeNotification:) name:@"LPEQValueChangeNotification" object:nil];

    - (void)EQValueChangeNotification:(NSNotification *)notification {
        NSDictionary *infoDict = notification.object;
        if ([[infoDict allKeys] containsObject:@"EQValue"]) {
            NSLog(@"EQValue = %@", infoDict[@"EQValue"]);
        }
    }   
    ```


### SSID和密码

#### 隐藏/打开 SSID

-   接口说明

    隐藏或打开设备的SSID。 打开设备的SSID时，如果没有密码，最好提示用户去设置密码。你可以根据deviceStatus中isSSIDHidden属性，判断SSID是否已经隐藏

    ```ObjectiveC
    - (void)hideSSID:(BOOL)hide completionHandler:(LPSDKReturnBlock _Nullable)completionHandler;
    ```

-   参数

| 名称         | 类型           | 接口说明                                             |
| :---------  | :------------  | :-------------------------------------------------  |
| hide        | BOOL           | 隐藏或打开设备的SSID                                  |


-   返回值

    无

-   示例代码

    ```ObjectiveC
     // Open the device SSID
     BOOL isHidden = device.deviceStatus.isSSIDHidden;
    [device.deviceSettings hideSSID:NO completionHandler:^(NSURLResponse * _Nullable response, id  _Nullable responseObject, NSError * _Nullable error) {
        if ([responseObject[@"result"] isEqualToString:@"OK"]) {
            // Open the device SSID successfully
            // If the device SSID has not set a password, you need to prompt the user to set a password
            if (device.deviceStatus.password.length == 0) {
                [device.deviceSettings setSSIDPassword:@"12345678" completionHandler:^(NSURLResponse * _Nullable response, id  _Nullable responseObject, NSError * _Nullable error) {
                    if ([responseObject[@"result"] isEqualToString:@"OK"]) {
                        NSLog(@"Successfully set the SSID password");
                    }else {
                        NSLog(@"Failed to set SSID password");
                        // Hide device SSID again
                        [device.deviceSettings hideSSID:YES completionHandler:^(NSURLResponse * _Nullable response, id  _Nullable responseObject, NSError * _Nullable error) {
                            
                        }];
                    }
                }];
            }else {
                NSLog(@"Choose whether to reset the password");
            }
        }else {
            NSLog(@"Failed to open device SSID");
        }
    }];

    // Hide the device SSID
    [device.deviceSettings hideSSID:YES completionHandler:^(NSURLResponse * _Nullable response, id  _Nullable responseObject, NSError * _Nullable error) {
        if ([responseObject[@"result"] isEqualToString:@"OK"]) {
            NSLog(@"Device SSID is turned off");
        }else {
            NSLog(@"Device SSID turned off failed");
        }
    }];
    ```


#### 设置SSID密码

-   接口说明

    设置设备的SSID密码，请注意密码长度至少为8位

    ```ObjectiveC
    - (void)setSSIDPassword:(NSString *)password completionHandler:(LPSDKReturnBlock _Nullable)completionHandler;
    ```

-   参数

| 名称       | 类型            | 接口说明                                                                       |
| :--------- | :------------ | :-----------------------------------------------------------------------------|
| password   | NSString      | 设置的SSID密码，至少8位                                                          |

-   返回值

    无

-   示例代码

    ```ObjectiveC
     // Set SSID password
    [device.deviceSettings setSSIDPassword:@"12345678" completionHandler:^(NSURLResponse * _Nullable response, id  _Nullable responseObject, NSError * _Nullable error) {
        if ([responseObject[@"result"] isEqualToString:@"OK"]) {
            NSLog(@"Successfully set the SSID password");
        }else {
            NSLog(@"Failed to set SSID password");
        }
    }];
    ```
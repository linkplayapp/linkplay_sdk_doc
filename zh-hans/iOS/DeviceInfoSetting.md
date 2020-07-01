# 设备信息设置

# 简介

设备信息设置，支持对设备信息的设置，如设备语音、名称、时区等信息。

#### 设置设备名称

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

#### 恢复出厂设置

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

#### 设置设备输入源

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

# 设备信息设置

# 简介

设备信息设置，支持对设备信息的设置，如设备语音、名称、时区等信息。


#### 设置设备名称

- 接口说明

    ``` ObjectiveC
    - (void)setDeviceName:(NSString *)deviceName deviceID:(NSString *)UUID completionHandler:(LPSDKReturnBlock _Nullable)completionHandler;
    ```

- 参数

| 名称           | 类型                    | 接口说明                                         |
| :-------------| :-----------------------| :---------------------------------------------- |
| deviceName    | NSString                | 设备名称                                         |
| UUID          | NSString                | 设备UUID                                         |

- 返回值

    无

- 示例代码

    ``` ObjectiveC
    [[LPDeviceSettingsManager sharedInstance] setDeviceName:@"Music" deviceID:device.deviceStatus.UUID completionHandler:^(NSURLResponse * _Nullable response, id  _Nullable responseObject, NSError * _Nullable error) {
        if ([responseObject[@"result"] isEqualToString:@"OK"]) {
           NSLog(@"Set device name successfully");
        }
    }];
    ```
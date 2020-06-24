# Device System Settings

# Overview

Device system related settings, includes language, name, timezone etc.

#### Name

- Description

    ``` ObjectiveC
    - (void)setDeviceName:(NSString *)deviceName deviceID:(NSString *)UUID completionHandler:(LPSDKReturnBlock _Nullable)completionHandler;
    ```

- Parameter

| Name           | Type                     | Description                                     |
| :------------- | :----------------------- | :---------------------------------------------- |
| deviceName     | NSString                 | Name                                            |
| UUID           | NSString                 | UUID                                            |

- Response

    N/A

- Sample Code

    ``` ObjectiveC
    [[LPDeviceSettingsManager sharedInstance] setDeviceName:@"Music" deviceID:device.deviceStatus.UUID completionHandler:^(NSURLResponse * _Nullable response, id  _Nullable responseObject, NSError * _Nullable error) {
        if ([responseObject[@"result"] isEqualToString:@"OK"]) {
           NSLog(@"Set device name successfully");
        }
    }];
    ```

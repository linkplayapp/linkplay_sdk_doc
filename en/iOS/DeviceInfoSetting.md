# Device System Settings

# Overview

Device system related settings, includes language, name, timezone etc.

#### Name

-   Description

    ```ObjectiveC
    - (void)setDeviceName:(NSString *)deviceName deviceID:(NSString *)UUID completionHandler:(LPSDKReturnBlock _Nullable)completionHandler;
    ```

-   Parameter

| Name       | Type     | Description |
| :--------- | :------- | :---------- |
| deviceName | NSString | Name        |
| UUID       | NSString | UUID        |

-   Response

    N/A

-   Sample Code

    ```ObjectiveC
    [[LPDeviceSettingsManager sharedInstance] setDeviceName:@"Music" deviceID:device.deviceStatus.UUID completionHandler:^(NSURLResponse * _Nullable response, id  _Nullable responseObject, NSError * _Nullable error) {
        if ([responseObject[@"result"] isEqualToString:@"OK"]) {
           NSLog(@"Set device name successfully");
        }
    }];
    ```

#### Restore

-   Description

    ```ObjectiveC
    - (void)resetDeviceWithHandler:(LPSDKReturnBlock _Nullable)completionHandler;
    ```

-   Parameter

    N/A

-   Response

    N/A

-   Sample Code

    ```ObjectiveC
    [device.deviceSettings resetDeviceWithHandler:^(NSURLResponse * _Nullable response, id  _Nullable responseObject, NSError * _Nullable error) {
        if ([responseObject[@"result"] isEqualToString:@"OK"]) {
           NSLog(@"Reset device successfully");
        }
    }];
    ```

#### Switch input source

-   Description

    Switch the input source of the device, such as Bluetooth, AUX, RCA

    ```ObjectiveC
    - (void)switchInputSource:(LPInputSource)source  completionHandler:(LPSDKReturnBlock _Nullable)completionHandler;
    ```

-   Parameter

| Name   | Type          | Description  |
| :----- | :------------ | :----------- |
| source | LPInputSource | Input source |

-   Response

    N/A

-   Sample Code

    ```ObjectiveC
    LPInputSource *sourc = LPBluetooth;
    [device.deviceSettings switchInputSource:source completionHandler:^(NSURLResponse * _Nullable response, id  _Nullable responseObject, NSError * _Nullable error) {
        if ([responseObject[@"result"] isEqualToString:@"OK"]) {
            NSLog(@"Switch deivce input source successfully");
        }
    }];
    ```


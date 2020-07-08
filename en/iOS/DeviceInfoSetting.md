# Device System Settings

# Overview

Device system related settings, includes language, name, timezone etc.

### Name

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

### Restore

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

### Switch input source

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

### Network detection

-   Description

    Judge if the device has a network, if the device network changes, it will trigger the notification LPInternetAccessChange, at this time the value of isHaveInternet has been updated.

    ```ObjectiveC
    // LPDeviceStatus
    @property (nonatomic, assign) BOOL isHaveInternet;
    ```

-   Sample Code

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

#### Get EQ

-   Description
    
    Get the supported EQ type and current Value.
    After modifying the value of EQ in other ways, you can synchronize the Value through the LPEQValueChangeNotification notification
     The data structure is as follows:
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
    The array corresponding to the EQValue field is a collection of EQ types supported by the device. If there is a special EQ type, please contact Linkplay firmware personnel to configure the server data parameters.
    Generally, the value of Value is -5 to 5, please make sure that the value of Value is of type int.

    ```ObjectiveC
    - (void)getSupportEQAndValues:(LPSDKReturnBlock _Nullable)completionHandler;
    ```

-   Parameter

    N/A

-   Response

    N/A

-   Sample Code

    ```ObjectiveC
    [device.deviceSettings getSupportEQAndValues:^(NSURLResponse * _Nullable response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (responseObject) {
            NSLog(@"SupportEQ = %@", responseObject[@"EQValue"]);
        }
    }];
    ```

#### Set EQ

-   Description

    Set the value of each EQ type

    ```ObjectiveC
    - (void)setEQValues:(NSDictionary *)valuesDict completionHandler:(LPSDKReturnBlock _Nullable)completionHandler;
    ```

-   Parameter

| Name       | Type          | Description                                                                   |
| :-----     | :------------ | :-----------------------------------------------------------------------------|
| valuesDict | NSDictionary  | The data structure of EQValue returned by the getSupportEQAndValues interface |

-   Response

    N/A

-   Sample Code

    ```ObjectiveC
    NSArray *valuesArray = @[@{@"Name":@"BandBASS", @"Value":@"-5"} ,@{@"Name":@"BandLOW", @"Value":@"-2"},@{@"Name":@"BandMID", @"Value":@"0"},@{@"Name":@"BandHIGH", @"Value":@"2"},@{@"Name":@"BandTREBLE", @"Value":@"5"}];
    NSDictionary *EQValuesDict = @{@"EQValue":valuesArray};
    [device.deviceSettings setEQValues:EQValuesDict completionHandler:^(NSURLResponse * _Nullable response, id  _Nullable responseObject, NSError * _Nullable error) {
        
    }];
    ```





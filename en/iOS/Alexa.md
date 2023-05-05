# Alexa

# Overview

This SDK implements Alexa related functions, such as login, get login status, language settings, audio cues etc.

### Alexa Splash

####  Show Alexa Splash

This function shows Alexa Splash UI for you, and deals with related touch delegate.

- Description

    Load Alexa Splash UI

    ``` ObjectiveC
    - (instancetype)initAlexaSplashViewWithFrame:(CGRect)frame device:(LPDevice *)device;
    ```

- Parameter

| Name         | Type                     | Description                                     |
| :----------- | :----------------------- | :---------------------------------------------- |
| device       | LPDevice                 | Device object                                   |
| frame        | CGRect                   | Splash UI frame                                |

- Response

    N/A

- Sample Code

    ``` ObjectiveC
    LPAlexaSplashView *splashView = [[LPAlexaSplashView alloc] initAlexaSplashViewWithFrame:[UIScreen mainScreen].bounds device:self.device];
    splashView.delegate = self;
    [self.view addSubview:splashView];
    ```

#### Login

User press login button callback.

- Description

    ``` ObjectiveC
    - (void)login;
    ```

#### Skip

User press back button or skip button callback.

- Description

    ``` ObjectiveC
    - (void)skip;
    ```

### Login with Amazon

#### Get Alexa login status

- Description

    Check if device is login with Alexa account

    ``` ObjectiveC
    - (void)getAlexaStatus:(LPDevice *)device completionHandler:(LPSDKReturnBlock _Nullable)completionHandler
    ```

- Parameter

| Name         | Type                     | Description                                     |
| :----------- | :----------------------- | :---------------------------------------------- |
| device       | LPDevice                 | Device object                                   |

- Response

    N/A

- Sample Code

    ``` ObjectiveC
    [[LPAlexaManager sharedInstance] getAlexaStatus:self.device completionHandler:^(NSURLResponse * _Nullable response, id  _Nullable responseObject, NSError * _Nullable error) {
        NSLog(@"%@",responseObject);
    }];
    ```

####  Alexa Login Page

Show Alexa login page with related delegate.

- Description

    Load Alexa login page.

    ``` ObjectiveC
    - (instancetype)initAlexaLoginViewWithFrame:(CGRect)frame device:(LPDevice *)device isBeta:(BOOL)isBeta betaString:(NSString *)betaString;
    ```

- Parameter

| Name         | Type                     | Description                                     |
| :----------- | :----------------------- | :---------------------------------------------- |
| device       | LPDevice                 | Device object                                   |
| frame        | CGRect                   | UI frame                                        |
| isBeta       | BOOL                     | Whether beta version for Amazon certification   |
| betaString   | NSString                 | alexa beta string, default is "_BETA"           |

- Response

    N/A

- Sample Code

    ``` ObjectiveC
    LPAlexaLoginView *loginView = [[LPAlexaLoginView alloc] initAlexaLoginViewWithFrame:[UIScreen mainScreen].bounds device:self.device isBeta:NO betaString:@""];
    loginView.delegate = self;
    [self.view addSubview:loginView];
    ```

#### Alexa Login Success

Alexa login success callback, then you can pass authcode to the device to finish the authorization.

- Description

    ``` ObjectiveC
    - (void)loginSuccess;
    ```

- Sample Code

    ``` ObjectiveC
    #pragma mark —————LPAlexaLoginDelegate—————
    - (void)loginSuccess {
        [[LPAlexaManager sharedInstance] setAuthcodeWithDeivce:device completionHandler:^(NSURLResponse * _Nullable response, id  _Nullable responseObject, NSError * _Nullable error) {
            if ([responseObject[@"result"] isEqualToString:@"OK"]) {
                NSLog(@"Set Authcode successfully");
            }else {
                NSLog(@"Set Authcode failed");
            }
        }];
    }
    ```


#### Cancel

User press cancel button callback.

- Description

    ``` ObjectiveC
    - (void)cancel;
    ```

- Sample Code

    ``` ObjectiveC
    #pragma mark —————LPAlexaLoginDelegate—————
    - (void)cancel {
        NSLog(@"The user clicks Cancel");
        [self.navigationController popViewControllerAnimated:YES];
    }
    ```

### Alexa Logout

Logout device side Alexa account

#### Logout

- Description

    ``` ObjectiveC
    - (void)logoutWithDevice:(LPDevice *)device completionHandler:(LPSDKReturnBlock _Nullable)completionHandler;
    ```

- Parameter

| Name         | Type                     | Description                                     |
| :----------- | :----------------------- | :---------------------------------------------- |
| device       | LPDevice                 | Device object                                   |

- Response

    N/A

- Sample Code

    ``` ObjectiveC
    [[LPAlexaManager sharedInstance] logoutWithDevice:self.device completionHandler:^(NSURLResponse * _Nullable response, id  _Nullable responseObject, NSError * _Nullable error) {
        if ([responseObject[@"result"] isEqualToString:@"OK"]) {
            NSLog(@"Logout success");
        }else {
            NSLog(@"Logout failed");
        }
    }];
    ```

### Alexa Setting

Implements Alexa related settings functions, includs logout, language settings, sound cues setting, etc.

- `LP_CONNECT_AP_STATE`

    Alexa Language

| Name                             | Description                              |
| -------------------------------- | ---------------------------------------- |
| LANGUAGE_EN_US                   | US English                               |
| LANGUAGE_EN_GB                   | Britain                                  |
| LANGUAGE_DE_DE                   | German                                   |
| LANGUAGE_EN_CA                   | Canda English                            |
| LANGUAGE_JA_JP                   | Japanese                                 |
| LANGUAGE_EN_IN                   | India English                            |
| LANGUAGE_EN_AUT                  | Australia English                        |
| LANGUAGE_FR_FR                   | French                                   |


#### Send AuthCode

- Description

    ``` ObjectiveC
    - (void)setAuthcodeWithDeivce:(LPDevice *)device completionHandler:(LPSDKReturnBlock _Nullable)completionHandler;
    ```

- Parameter

| Name         | Type                     | Description                                     |
| :----------- | :----------------------- | :---------------------------------------------- |
| device       | LPDevice                 | Device object                                   |

- Response

    N/A

- Sample Code

    ``` ObjectiveC
    [[LPAlexaManager sharedInstance] setAuthcodeWithDeivce:device completionHandler:^(NSURLResponse * _Nullable response, id  _Nullable responseObject, NSError * _Nullable error) {
        if ([responseObject[@"result"] isEqualToString:@"OK"]) {
            NSLog(@"Set Authcode successfully");
        }else {
            NSLog(@"Set Authcode failed");
        }
    }];
    ```

#### Set Alexa Language

- Description

    ``` ObjectiveC
    - (void)setLanguage:(LPDevice *)device selectLanguage:(NSString *)language completionHandler:(LPSDKReturnBlock _Nullable)completionHandler
    ```

- Parameter

| Name         | Type                     | Description                                     |
| :----------- | :----------------------- | :---------------------------------------------- |
| device       | LPDevice                 | Device object                                   |
| language     | NSString                 | alexa language                                  |

- Response

    N/A

- Sample Code

    ``` ObjectiveC
    [[LPAlexaManager sharedInstance] setLanguage:self.device selectLanguage:LANGUAGE_EN_US completionHandler:^(NSURLResponse * _Nullable response, id  _Nullable responseObject, NSError * _Nullable error) {
        NSLog(@"%@",responseObject[@"result"]);
    }];
    ```

#### Get Alexa Language

- Description

    ``` ObjectiveC
    - (void)getLanguage:(LPDevice *)device completionHandler:(LPSDKReturnBlock _Nullable)completionHandler;
    ```

- Parameter

| Name         | Type                     | Description                                     |
| :----------- | :----------------------- | :---------------------------------------------- |
| device       | LPDevice                 | Device object                                   |

- Response

    N/A

- Sample Code

    ``` ObjectiveC
    [[LPAlexaManager sharedInstance] getLanguage:self.device completionHandler:^(NSURLResponse * _Nullable response, id  _Nullable responseObject, NSError * _Nullable error) {
        NSLog(@"%@",responseObject[@"result"]);
    }];
    ```

#### Get Alexa Audio Ques On/Off

- Description

    ``` ObjectiveC
    - (void)getPromptStatus:(LPDevice *)device completionHandler:(LPSDKReturnBlock _Nullable)completionHandler;
    ```

- Parameter

| Name         | Type                     | Description                                     |
| :----------- | :----------------------- | :---------------------------------------------- |
| device       | LPDevice                 | Device object                                   |

- Response

    N/A

- Sample Code

    ``` ObjectiveC
    [[LPAlexaManager sharedInstance] getPromptStatus:self.device completionHandler:^(NSURLResponse * _Nullable response, id  _Nullable responseObject, NSError * _Nullable error) {
        NSLog(@"%@",responseObject[@"result"]);
    }];
    ```
    
#### Set Alexa Audio Ques On/Off

- Description

    ``` ObjectiveC
    - (void)getPromptStatus:(LPDevice *)device completionHandler:(LPSDKReturnBlock _Nullable)completionHandler;
    ```

- Parameter

| Name         | Type                     | Description                                     |
| :----------- | :----------------------- | :---------------------------------------------- |
| device       | LPDevice                 | Device object                                   |
| status       | BOOL                     | On/off                                          |

- Response

    N/A

- Sample Code

    ``` ObjectiveC
    [[LPAlexaManager sharedInstance] setPromptStatus:self.device status:YES completionHandler:^(NSURLResponse * _Nullable response, id  _Nullable responseObject, NSError * _Nullable error) {
         NSLog(@"%@",responseObject[@"result"]);
    }];
    ```

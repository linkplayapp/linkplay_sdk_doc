# Alexa 登录

# Overview 

Alexa SDK提供了和alexa相关功能的API，例如：登录、查询是否登录、语言设置、唤醒提示音设置等.


### Alexa Splash

####  Alexa Splash 网页展示

提供了Alexa Splash 网页的展示，和相关按钮的点击方法代理。

- 接口说明

    加载Alexa Splash网页

    ``` ObjectiveC
    - (instancetype)initAlexaSplashViewWithFrame:(CGRect)frame device:(LPDevice *)device;
    ```

- 参数

| 名称          | 类型                      | 接口说明                                          |
| :----------- | :-----------------------  | :---------------------------------------------- |
| device       | LPDevice                  | 设备                                             |
| frame        | CGRect                    | Splash网页 frame                                 |

- 返回值

    无

- 示例代码

    ``` ObjectiveC
    LPAlexaSplashView *splashView = [[LPAlexaSplashView alloc] initAlexaSplashViewWithFrame:[UIScreen mainScreen].bounds device:self.device];
    splashView.delegate = self;
    [self.view addSubview:splashView];
    ```

#### 登录方法

Splash 网页 点击登录对应的代理方法。

- 接口说明

    ``` ObjectiveC
    - (void)login;
    ```

#### Skip

Splash 网页点击返回按键或者Skip按键对应的代理方法。

- 接口说明

    ``` ObjectiveC
    - (void)skip;
    ```

### Alexa 网页登录

#### 获取Alexa登录状态

- 接口说明

    判断设备端Alexa是否已经登录

    ``` ObjectiveC
    - (void)getAlexaStatus:(LPDevice *)device completionHandler:(LPSDKReturnBlock _Nullable)completionHandler
    ```

- 参数

| 名称          | 类型                      | 接口说明                                          |
| :----------- | :-----------------------  | :---------------------------------------------- |
| device       | LPDevice                  | 设备                                             |

- 返回值

    无

- 示例代码

    ``` ObjectiveC
    [[LPAlexaManager sharedInstance] getAlexaStatus:self.device completionHandler:^(NSURLResponse * _Nullable response, id  _Nullable responseObject, NSError * _Nullable error) {
        NSLog(@"%@",responseObject);
    }];
    ```

####  Alexa Login 网页展示

提供了Alexa Login 网页的展示，和相关按钮的点击方法代理。

- 接口说明

    加载Alexa Login网页

    ``` ObjectiveC
    - (instancetype)initAlexaLoginViewWithFrame:(CGRect)frame device:(LPDevice *)device isBeta:(BOOL)isBeta betaString:(NSString *)betaString;
    ```

- 参数

| 名称         | 类型                     | 接口说明                                        |
| :----------- | :----------------------- | :---------------------------------------------- |
| device       | LPDevice                 | 设备                                            |
| frame        | CGRect                   | 网页 frame                                      |
| isBeta       | BOOL                     | 是否是Beta版本                                   |
| betaString   | NSString                 | alexa beta 字符串, 默认的值是 "_BETA"             |

- 返回值

    无

- 示例代码

    ``` ObjectiveC
    LPAlexaLoginView *loginView = [[LPAlexaLoginView alloc] initAlexaLoginViewWithFrame:[UIScreen mainScreen].bounds device:self.device isBeta:NO betaString:@""];
    loginView.delegate = self;
    [self.view addSubview:loginView];
    ```

#### Alexa 登录成功

Alexa 登录成功对应的代理方法, 成功后需要调用设置Authcode 方法，LPAlexaManager

- 接口说明

    ``` ObjectiveC
    - (void)loginSuccess;
    ```

- 示例代码

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

Alexa 网页点击取消对应的代理方法。

- 接口说明

    ``` ObjectiveC
    - (void)cancel;
    ```

- 示例代码

    ``` ObjectiveC
    #pragma mark —————LPAlexaLoginDelegate—————
    - (void)cancel {
        NSLog(@"The user clicks Cancel");
        [self.navigationController popViewControllerAnimated:YES];
    }
    ```

### Alexa 登出

登出设备端Alexa

#### 登出

- 接口说明

    ``` ObjectiveC
    - (void)logoutWithDevice:(LPDevice *)device completionHandler:(LPSDKReturnBlock _Nullable)completionHandler;
    ```

- 参数

| 名称          | 类型                      | 接口说明                                          |
| :----------- | :-----------------------  | :---------------------------------------------- |
| device       | LPDevice                  | 设备                                             |

- 返回值

    无

- 示例代码

    ``` ObjectiveC
    [[LPAlexaManager sharedInstance] logoutWithDevice:self.device completionHandler:^(NSURLResponse * _Nullable response, id  _Nullable responseObject, NSError * _Nullable error) {
        if ([responseObject[@"result"] isEqualToString:@"OK"]) {
            NSLog(@"Logout success");
        }else {
            NSLog(@"Logout failed");
        }
    }];
    ```

### Alexa 设置

提供了Alexa相关功能的API, 包括登录，退出登录，语言设置、获取，唤醒提示音设置、获取，登录状态。


- `LP_CONNECT_AP_STATE`

    Alexa语言

| 名称                              | 描述                                     |
| -------------------------------- | ---------------------------------------- |
| LANGUAGE_EN_US                    | 美国                                     |
| LANGUAGE_EN_GB                    | 英国/爱尔兰                               |
| LANGUAGE_DE_DE                    | 德语/奥地利                               |
| LANGUAGE_EN_CA                    | 加拿大                                   |
| LANGUAGE_JA_JP                    | 日本语                                   | 
| LANGUAGE_EN_IN                    | 印度语                                   |
| LANGUAGE_EN_AUT                   | 澳大利亚                                 |
| LANGUAGE_FR_FR                    | 法国                                    |


#### 设置AuthCode

- 接口说明

    ``` ObjectiveC
    - (void)setAuthcodeWithDeivce:(LPDevice *)device completionHandler:(LPSDKReturnBlock _Nullable)completionHandler;
    ```

- 参数

| 名称          | 类型                      | 接口说明                                          |
| :----------- | :-----------------------  | :---------------------------------------------- |
| device       | LPDevice                  | 设备                                             |

- 返回值

    无

- 示例代码

    ``` ObjectiveC
    [[LPAlexaManager sharedInstance] setAuthcodeWithDeivce:device completionHandler:^(NSURLResponse * _Nullable response, id  _Nullable responseObject, NSError * _Nullable error) {
        if ([responseObject[@"result"] isEqualToString:@"OK"]) {
            NSLog(@"Set Authcode successfully");
        }else {
            NSLog(@"Set Authcode failed");
        }
    }];
    ```

#### 设置 Alexa 语言

- 接口说明

    ``` ObjectiveC
    - (void)setLanguage:(LPDevice *)device selectLanguage:(NSString *)language completionHandler:(LPSDKReturnBlock _Nullable)completionHandler
    ```

- 参数

| 名称          | 类型                      | 接口说明                                          |
| :----------- | :-----------------------  | :---------------------------------------------- |
| device       | LPDevice                  | 设备                                             |
| language     | NSString                  | alexa语言                                        |

- 返回值

    无

- 示例代码

    ``` ObjectiveC
    [[LPAlexaManager sharedInstance] setLanguage:self.device selectLanguage:LANGUAGE_EN_US completionHandler:^(NSURLResponse * _Nullable response, id  _Nullable responseObject, NSError * _Nullable error) {
        NSLog(@"%@",responseObject[@"result"]);
    }];
    ```

#### 获取 Alexa 语言

- 接口说明

    ``` ObjectiveC
    - (void)getLanguage:(LPDevice *)device completionHandler:(LPSDKReturnBlock _Nullable)completionHandler;
    ```

- 参数

| 名称          | 类型                      | 接口说明                                          |
| :----------- | :-----------------------  | :---------------------------------------------- |
| device       | LPDevice                  | 设备                                             |

- 返回值

    无

- 示例代码

    ``` ObjectiveC
    [[LPAlexaManager sharedInstance] getLanguage:self.device completionHandler:^(NSURLResponse * _Nullable response, id  _Nullable responseObject, NSError * _Nullable error) {
        NSLog(@"%@",responseObject[@"result"]);
    }];
    ```

#### 获取 Alexa 提示音状态

- 接口说明

    ``` ObjectiveC
    - (void)getPromptStatus:(LPDevice *)device completionHandler:(LPSDKReturnBlock _Nullable)completionHandler;
    ```

- 参数

| 名称          | 类型                      | 接口说明                                          |
| :----------- | :-----------------------  | :---------------------------------------------- |
| device       | LPDevice                  | 设备                                             |

- 返回值

    无

- 示例代码

    ``` ObjectiveC
    [[LPAlexaManager sharedInstance] getPromptStatus:self.device completionHandler:^(NSURLResponse * _Nullable response, id  _Nullable responseObject, NSError * _Nullable error) {
        NSLog(@"%@",responseObject[@"result"]);
    }];
    ```
    
#### 设置 Alexa 提示音状态

- 接口说明

    ``` ObjectiveC
    - (void)getPromptStatus:(LPDevice *)device completionHandler:(LPSDKReturnBlock _Nullable)completionHandler;
    ```

- 参数

| 名称          | 类型                      | 接口说明                                          |
| :----------- | :-----------------------  | :---------------------------------------------- |
| device       | LPDevice                  | 设备                                             |
| status       | BOOL                      | 开关状态                                          |

- 返回值

    无

- 示例代码

    ``` ObjectiveC
    [[LPAlexaManager sharedInstance] setPromptStatus:self.device status:YES completionHandler:^(NSURLResponse * _Nullable response, id  _Nullable responseObject, NSError * _Nullable error) {
         NSLog(@"%@",responseObject[@"result"]);
    }];
    ```

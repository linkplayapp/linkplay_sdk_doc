# Alexa 登录

# Overview 

Alexa SDK提供了和alexa相关功能的API，例如：登录、查询是否登录、语言设置、唤醒提示音设置等.


### Alexa Splash

####  Alexa Splash 网页展示

提供了Alexa Splash 网页的展示，和相关按钮的点击方法代理。

- 接口说明

    加载Alexa Splash网页

    ``` Java
    initSplashView(LPDevice device, WebView splashWebView, LPAlexaSplashListener listener) 
    ```

- 参数

| 名称          | 类型                     | 接口说明                                        |
| :-----------  | :----------------------- | :---------------------------------------------- |
| device        | LPDevice                 | 设备                                            |
| splashWebView | WebView                  | Webview控件，用来显示Splash页面                 |
| listener      | LPAlexaSplashListener    | 加载Alexa Splash页面的回调                      |

- 返回值

    无

- 示例代码

    ``` Java
    lpDeviceManager.initSplashView(currDevice,
        splashWebView, new LPAlexaSplashListener() {
            @Override
            public void skipAlexa() {
                 
            }
 
            @Override
            public void setupAlexa() {
 
            }
 
            @Override
            public void onFailed(Exception e) {
 
            }
        });
    ```

### Alexa 网页登录

#### 获取Alexa登录状态

- 接口说明

    判断设备端Alexa是否已经登录

    ``` Java
    - (void)getAlexaStatus:(LPDevice *)device completionHandler:(LPSDKReturnBlock _Nullable)completionHandler
    ```

- 参数

| 名称          | 类型                      | 接口说明                                          |
| :----------- | :-----------------------  | :---------------------------------------------- |
| device       | LPDevice                  | 设备                                             |

- 返回值

    无

- 示例代码

    ``` Java
    [[LPAlexaManager sharedInstance] getAlexaStatus:self.device completionHandler:^(NSURLResponse * _Nullable response, id  _Nullable responseObject, NSError * _Nullable error) {
        NSLog(@"%@",responseObject);
    }];
    ```

####  Alexa Login 网页展示

提供了Alexa Login 网页的展示，和相关按钮的点击方法代理。

- 接口说明

    加载Alexa Login网页

    ``` Java
    initLoginView(LPDevice device, WebView webview, LPAlexaLoginListener listener) 
    ```

- 参数

| 名称         | 类型                     | 接口说明                                        |
| :----------- | :----------------------- | :---------------------------------------------- |
| device       | LPDevice                 | 设备                                            |
| webview      | WebView                  | Webview控件，用来显示Splash页面                 |
| listener     | LPAlexaLoginListener     | 加载页面的回调                                  |

- 返回值

    无

- 示例代码

    ``` Java
    lpDeviceManager.initLoginView(currDevice,
               webView, new LPAlexaLoginListener() {
                   @Override
                   public void startLogin() {
                        
                   }
 
                   @Override
                   public void loginFailed(Exception e) {
 
                   }
 
                   @Override
                   public void cancel() {
 
                   }
 
                   @Override
                   public void loginSuccess() {
 
                   }
               });
    ```

### Alexa 登出

登出设备端Alexa

#### 登出

- 接口说明

    ``` Java
    logout(LPDevice device, LPAlexaListener listener)
    ```

- 参数

| 名称         | 类型                     | 接口说明                                        |
| :----------- | :----------------------- | :---------------------------------------------- |
| device       | LPDevice                 | 设备                                            |
| listener     | LPAlexaListener          | 回调                                            |

- 返回值

    无

- 示例代码

    ``` Java
    lpDeviceManager.logout(currDevice, new LPAlexaListener() {
            @Override
            public void onSuccess(String result) {
                 
            }
 
            @Override
            public void onFail(Exception e) {
 
            }
        });
    ```

### Alexa 设置

提供了Alexa相关功能的API, 包括登录，退出登录，语言设置、获取，唤醒提示音设置、获取，登录状态。


- `AlexaLanguage`

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

    ``` Java
    setAuthcodeWithDevice(LPDevice device,  LPAlexaListener listener)
    ```

- 参数

| 名称         | 类型                     | 接口说明                                        |
| :----------- | :----------------------- | :---------------------------------------------- |
| device       | LPDevice                 | 设备                                            |
| listener     | LPAlexaListener          | 回调                                            |

- 返回值

    无

- 示例代码

    ``` Java
    lpDeviceManager.setAuthcode(currDevice, new LPAlexaListener() {
            @Override
            public void onSuccess(String result) {
 
            }
 
            @Override
            public void onFail(Exception e) {
 
            }
        });
    ```

#### 设置 Alexa 语言

- 接口说明

    ``` Java
    setLanguage(LPDevice device, String lan,LPAlexaListener listener)
    ```

- 参数

| 名称         | 类型                     | 接口说明                                        |
| :----------- | :----------------------- | :---------------------------------------------- |
| device       | LPDevice                 | 设备                                            |
| lan          | String                   | alexa语言                                       |
| listener     | LPAlexaListener          | 回调                                            |

- 返回值

    无

#### 获取 Alexa 语言

- 接口说明

    ``` Java
    getLanguage(LPDevice device, LPAlexaListener listener)
    ```

- 参数

| 名称         | 类型                     | 接口说明                                        |
| :----------- | :----------------------- | :---------------------------------------------- |
| device       | LPDevice                 | 设备                                            |
| listener     | LPAlexaListener          | 回调                                            |

- 返回值

    无

#### 获取 Alexa 提示音状态

- 接口说明

    ``` Java
    getPromptStatus(LPDevice device, LPAlexaListener listener)
    ```

- 参数

| 名称         | 类型                     | 接口说明                                        |
| :----------- | :----------------------- | :---------------------------------------------- |
| device       | LPDevice                 | 设备                                            |
| listener     | LPAlexaListener          | 回调                                            |

- 返回值

    无

#### 设置 Alexa 提示音状态

- 接口说明

    ``` Java
    setPromptStatus(LPDevice device, String status, LPAlexaListener listener)
    ```

- 参数

| 名称          | 类型                      | 接口说明                                          |
| :----------- | :-----------------------  | :---------------------------------------------- |
| device       | LPDevice                  | 设备                                             |
| status       | BOOL                      | 开关状态                                          |

- 返回值

    无


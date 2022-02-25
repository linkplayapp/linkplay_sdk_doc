# Alexa

# Overview

This SDK implements Alexa related functions, such as login, get login status, language settings, audio cues etc.

### Alexa Splash

####  Show Alexa Splash

This function shows Alexa Splash UI for you, and deals with related touch delegate.

- Description

    Load Alexa Splash UI

    ``` Java
    initSplashView(LPDevice device, WebView splashWebView, LPAlexaSplashListener listener) 
    ```

- Parameter

| Name          | Type                     | Description                                     |
| :-----------  | :----------------------- | :---------------------------------------------- |
| device        | LPDevice                 | Device object                                   |
| splashWebView | WebView                  | Webview object，which to show Splash web        |
| listener      | LPAlexaSplashListener    | Load Alexa Splash callback                      |

- Response

    N/A

- Sample Code

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

### Login with Amazon

#### Get Alexa login status

- Description

    Check if device is login with Alexa account

    ``` Java
    - (void)getAlexaStatus:(LPDevice *)device completionHandler:(LPSDKReturnBlock _Nullable)completionHandler
    ```

- Parameter

| Name         | Type                     | Description                                     |
| :----------- | :----------------------- | :---------------------------------------------- |
| device       | LPDevice                 | Device object                                   |

- Response

    N/A

- Sample Code

    ``` Java
    [[LPAlexaManager sharedInstance] getAlexaStatus:self.device completionHandler:^(NSURLResponse * _Nullable response, id  _Nullable responseObject, NSError * _Nullable error) {
        NSLog(@"%@",responseObject);
    }];
    ```

####  Alexa Login Page

Show Alexa login page with related delegate.

- Description

    Load Alexa login page.

    ``` Java
    initLoginView(LPDevice device, WebView webview, LPAlexaLoginListener listener) 
    ```

- Parameter

| Name         | Type                     | Description                                     |
| :----------- | :----------------------- | :---------------------------------------------- |
| device       | LPDevice                 | Device object                                   |
| webview      | WebView                  | Webview object，which to show web               |
| listener     | LPAlexaLoginListener     | Callback                                        |

- Response

    N/A

- Sample Code

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

### Alexa Logout

Logout device side Alexa account

#### Logout

- Description

    ``` Java
    logout(LPDevice device, LPAlexaListener listener)
    ```

- Parameter

| Name         | Type                     | Description                                     |
| :----------- | :----------------------- | :---------------------------------------------- |
| device       | LPDevice                 | Device object                                   |
| listener     | LPAlexaListener          | Callback                                        |

- Response

    N/A

- Sample Code

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

    ``` Java
    setAuthcodeWithDevice(LPDevice device,  LPAlexaListener listener)
    ```

- Parameter

| Name         | Type                     | Description                                     |
| :----------- | :----------------------- | :---------------------------------------------- |
| device       | LPDevice                 | Device object                                   |
| listener     | LPAlexaListener          | Callback                                        |

- Response

    N/A

- Sample Code

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

#### Set Alexa Language

- Description

    ``` Java
    setLanguage(LPDevice device, String lan,LPAlexaListener listener)
    ```

- Parameter

| Name         | Type                     | Description                                     |
| :----------- | :----------------------- | :---------------------------------------------- |
| device       | LPDevice                 | Device object                                   |
| lan          | String                   | alexa language                                  |
| listener     | LPAlexaListener          | Callback                                        |

- Response

    N/A

#### Get Alexa Language

- Description

    ``` Java
    getLanguage(LPDevice device, LPAlexaListener listener)
    ```

- Parameter

| Name         | Type                     | Description                                     |
| :----------- | :----------------------- | :---------------------------------------------- |
| device       | LPDevice                 | Device object                                   |
| listener     | LPAlexaListener          | Callback                                        |

- Response

    N/A

#### Get Alexa Audio Ques On/Off

- Description

    ``` Java
    getPromptStatus(LPDevice device, LPAlexaListener listener)
    ```

- Parameter

| Name         | Type                     | Description                                     |
| :----------- | :----------------------- | :---------------------------------------------- |
| device       | LPDevice                 | Device object                                   |
| listener     | LPAlexaListener          | Callback                                        |

- Response

    N/A

#### Set Alexa Audio Ques On/Off

- Description

    ``` Java
    setPromptStatus(LPDevice device, String status, LPAlexaListener listener)
    ```

- Parameter

| Name         | Type                     | Description                                     |
| :----------- | :----------------------- | :---------------------------------------------- |
| device       | LPDevice                 | Device object                                   |
| status       | BOOL                     | On/off                                          |

- Response

    N/A

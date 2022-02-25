# HTTP Utility

# Overview 

We supply some utility functions to help you communicate with firmware.

#### Get

- Description

#### Get

- Description
``` Java
get(String url, List<HttpRequestUtils.Param> headers, final LPNetworkListener listener)
```

- Parameter

| Name      | Type                      | Description                                     |
| :-------- | :------------------------ | :----------------------------------------------  |
| url       | String                    | URL                                         |
| headers       | List                    | request heads                                        |
| listener      | LPNetworkListener            | Callback                    |

- Response

    N/A


#### Post

- Description
``` Java
post(String url, List<HttpRequestUtils.Param> params, final LPNetworkListener listener)
```

- Parameter

| Name      | Type                      | Description                                     |
| :-------- | :------------------------ | :----------------------------------------------  |
| url       | String                    | URL                                         |
| params       | List                    | params                                        |
| listener      | LPNetworkListener            | Callback                    |

- Response

    N/A

#### Listener
LPNetworkListener 
    - public void onSuccess(LPNetworkResponseItem response)
    - public void onFailure(Exception e)
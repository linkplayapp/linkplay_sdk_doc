# 设备网络请求

# Overview 

LPNetwork 提供和设备交互的网络请求方法，有Get、和Post请求。


#### Get 请求

- 接口说明
``` Java
get(String url, List<HttpRequestUtils.Param> headers, final LPNetworkListener listener)
```

- 参数

| 名称       | 类型                      | 接口说明                                          |
| :-------- | :------------------------ | :----------------------------------------------  |
| url       | String                    | 请求的URL                                         |
| headers       | List                    | 请求头                                         |
| listener      | LPNetworkListener            | 网络回调                    |

- 返回值

    无


#### Post 请求

- 接口说明
``` Java
post(String url, List<HttpRequestUtils.Param> params, final LPNetworkListener listener)
```

- 参数

| 名称       | 类型                      | 接口说明                                          |
| :-------- | :------------------------ | :----------------------------------------------  |
| url       | String                    | 请求的URL                                         |
| params       | List                    | 请求参数                                         |
| listener      | LPNetworkListener            | 网络回调                    |

- 返回值

    无

#### 监听
LPNetworkListener 
    - public void onSuccess(LPNetworkResponseItem response)
    - public void onFailure(Exception e)
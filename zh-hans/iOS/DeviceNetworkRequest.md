# 设备网络请求

# Overview 

LPNetwork 提供和设备交互的网络请求方法，有Get、和Post请求。


#### Get 请求

- 接口说明

    ``` ObjectiveC
    +(NSURLSessionDataTask *)commonHTTPMethod:(NSString *)url responseType:(LPResponseType)type success:(void (^)(NSURLSessionDataTask *operation, id _Nullable responseObject))success failure:(void (^)(NSURLSessionDataTask *operation, NSError * _Nullable error))failure;
    ```

- 参数

| 名称       | 类型                      | 接口说明                                          |
| :-------- | :------------------------ | :----------------------------------------------  |
| url       | NSString                  | 请求的URL                                         |
| type      | LPResponseType            | 网络请求格式，XML、JSON、String                     |

- 返回值

    无


#### Post 请求

- 接口说明

    ``` ObjectiveC
    +(NSURLSessionDataTask *)commonPostMethod:(NSString *)url responseType:(LPResponseType)type body:(NSDictionary *_Nullable)body success:(void (^)(NSURLSessionDataTask *operation, NSDictionary *_Nullable responseObject))success failure:(void (^)(NSURLSessionDataTask *operation, NSError *_Nullable error))failure redirect:(void (^)(NSURLSessionTask *operation, NSHTTPURLResponse *_Nullable responseObject))redirect timeout:(NSTimeInterval)time;
    ```

- 参数

| 名称       | 类型                      | 接口说明                                          |
| :-------- | :------------------------ | :----------------------------------------------  |
| url       | NSString                  | 请求的URL                                         |
| type      | LPResponseType            | 网络请求格式，XML、JSON、String                     |
| body      | NSDictionary              | Post 请求参数                                     |
| time      | NSTimeInterval            | 网络请求超时时间                                    |

- 返回值

    无

#### Post 请求(header)

- 接口说明

    ``` ObjectiveC
    +(NSURLSessionDataTask *)PostHTTPMethod:(NSString *)url withParameters:(id _Nullable)parameters httpHeader:(NSDictionary *)headerValue success:(void (^)(NSURLSessionDataTask *operation, NSDictionary * _Nullable responseObject))success failure:(void (^)(NSURLSessionDataTask *operation, NSError *_Nullable error))failure;
    ```

- 参数

| 名称         | 类型                      | 接口说明                                          |
| :---------- | :------------------------ | :----------------------------------------------  |
| url         | NSString                  | 请求的URL                                         |
| parameters  | NSDictionary              | Post 请求参数                                     |
| headerValue | NSDictionary              | 请求的header                                      |

- 返回值

    无

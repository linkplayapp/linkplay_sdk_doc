# HTTP Utility

# Overview 

We supply some utility functions to help you communicate with firmware.

#### Get

- Description

    ``` ObjectiveC
    +(NSURLSessionDataTask *)commonHTTPMethod:(NSString *)url responseType:(LPResponseType)type success:(void (^)(NSURLSessionDataTask *operation, id _Nullable responseObject))success failure:(void (^)(NSURLSessionDataTask *operation, NSError * _Nullable error))failure;
    ```

- Parameter

| Name      | Type                      | Description                                     |
| :-------- | :------------------------ | :---------------------------------------------- |
| url       | NSString                  | URL                                             |
| type      | LPResponseType            | Response format，XML、JSON、String              |

- Response

    N/A


#### Post

- Description

    ``` ObjectiveC
    +(NSURLSessionDataTask *)commonPostMethod:(NSString *)url responseType:(LPResponseType)type body:(NSDictionary *_Nullable)body success:(void (^)(NSURLSessionDataTask *operation, NSDictionary *_Nullable responseObject))success failure:(void (^)(NSURLSessionDataTask *operation, NSError *_Nullable error))failure redirect:(void (^)(NSURLSessionTask *operation, NSHTTPURLResponse *_Nullable responseObject))redirect timeout:(NSTimeInterval)time;
    ```

- Parameter

| Name      | Type                      | Description                                     |
| :-------- | :------------------------ | :---------------------------------------------- |
| url       | NSString                  | URL                                             |
| type      | LPResponseType            | Response format，XML、JSON、String              |
| body      | NSDictionary              | Parameter                                       |
| time      | NSTimeInterval            | Timeout                                         |

- Response

    N/A

#### Post (With Header)

- Description

    ``` ObjectiveC
    +(NSURLSessionDataTask *)PostHTTPMethod:(NSString *)url withParameters:(id _Nullable)parameters httpHeader:(NSDictionary *)headerValue success:(void (^)(NSURLSessionDataTask *operation, NSDictionary * _Nullable responseObject))success failure:(void (^)(NSURLSessionDataTask *operation, NSError *_Nullable error))failure;
    ```

- Parameter

| Name        | Type                      | Description                                     |
| :---------- | :------------------------ | :---------------------------------------------- |
| url         | NSString                  | URL                                       |
| parameters  | NSDictionary              | Parameter                              |
| headerValue | NSDictionary              | header                                    |

- Response

    N/A

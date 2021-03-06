# 多设备同步播放音乐

# 简介

Multi-Room Music 是指同一个局域网内的多台设备同步播放、操控的技术。

每个房间有一个“主设备”（master device），用来同步房间内的播放、控制信息，而其他被动接收同步指令的设备称为“子设备”(slave device)。

你可以通过LPMultiroomManager 来管理多台设备同步播放音乐


#### 不指定主设备的 Multi-Room

- 接口说明

    多个设备组成房间，以达到同步播放音乐的目的

    ``` ObjectiveC
    - (void)deviceMultiroomWithDeviceList:(NSArray<LPDevice *> * _Nonnull)deviceList handler:(LPMultiroomBlock)handler;
    ```

- 参数

| 名称         | 类型                                     | 接口说明                                        |
| :----------- | :-----------------------                 | :---------------------------------------------- |
| deviceList   | NSArray                                  | 需要进行Multiroom组网的设备列表                 |
| handler      | void (^LPMultiroomBlock)(BOOL isSuccess) |                                                 |

- 返回值

    无

#### 指定主设备的 Multi-Room

- 接口说明

    masterDevice “主设备”，slaveDeviceList 是房间内“子设备”列表。<br>

    如果传入的masterDevice 为nil，则slaveDeviceList中的设备，会从房间内删除，不再同步播放masterDevice设备的音乐。<br>

    如果传入的masterDevice 不为nil，则slaveDeviceList中的设备，会和masterDevice组成房间，同步播放音乐。<br>

    ``` ObjectiveC
    - (void)deviceMultiroomWithSlaveDeviceList:(NSArray<LPDevice *> * _Nonnull)slaveDeviceList masterDevice:(LPDevice * _Nullable)masterDevice handler:(LPMultiroomBlock)handler;
    ```

- 参数

| 名称            | 类型                                     | 接口说明                                                                                   |
| :-----------    | :--------------                          | :-------------------------------------------------------------------------------           |
| slaveDeviceList | NSArray                                  | 如果masterDevice为nil,列表中的设备从房间内删除，否则，列表中的设备会和masterDevice组成房间 |
| masterDevice    | LPDevice                                 | 设备对象                                                                                   |
| handler         | void (^LPMultiroomBlock)(BOOL isSuccess) |                                                                                            |

- 返回值

    无

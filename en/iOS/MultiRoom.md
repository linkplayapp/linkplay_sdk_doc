# Multi-Room Music

# Overview

Multi-Room Music refers to the technology of simultaneous playback and control of multiple speakers in the same local area network.

Each room has a "master device" (master device), which is used to synchronize the playback and control information in the room, and other devices that passively receive synchronization commands are called "slave devices".


#### Using Devicelist without "Master"

- Description

    Establish room with multiple devices to play music synchronizely.

    ``` ObjectiveC
    - (void)deviceMultiroomWithDeviceList:(NSArray<LPDevice *> * _Nonnull)deviceList handler:(LPMultiroomBlock)handler;
    ```

- Parameter

| Name         | Type                     | Description                                     |
| :----------- | :----------------------- | :---------------------------------------------- |
| deviceList   | NSArray                  | Devices to play music synchronizely             |

- Response

    N/A

#### With Master and Slave Devicelist

- Description

    MasterDevice is "Master device", slaveDeviceList is a list of "child devices" in the room.

    If the input masterDevice is nil, the devices in the slaveDeviceList will be deleted from the room, and the music of the masterDevice will no longer be played synchronously.

    If the input masterDevice is not nil, the devices in the slaveDeviceList will join a room with the masterDevice and play music in synchronization

    ``` ObjectiveC
    - (void)deviceMultiroomWithSlaveDeviceList:(NSArray<LPDevice *> * _Nonnull)slaveDeviceList masterDevice:(LPDevice * _Nullable)masterDevice handler:(LPMultiroomBlock)handler;    ```

- Parameter

| Name            | Type            | Description                                                                                                                   |
| :-----------    | :-------------- | :-------------------------------------------------------------------------------                                              |
| slaveDeviceList | NSArray         | If masterDevice is nil, devices in this list would remove from room, other wise they would join the same room with the master |
| masterDevice    | LPDevice        | Device object                                                                                                                      |

- Response

    N/A

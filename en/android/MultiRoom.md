# Multi-Room Music

# Overview

Multi-Room Music refers to the technology of simultaneous playback and control of multiple speakers in the same local area network.

Each room has a "master device" (master device), which is used to synchronize the playback and control information in the room, and other devices that passively receive synchronization commands are called "slave devices".


#### Using Devicelist without "Master"

- Description

    Establish room with multiple devices to play music synchronizely.

    ``` Java
    void deviceMultiroomWithDeviceList(List<LPDevice> lpDeviceList, LPMultiroomListener listener)
    ```

- Parameter

| Name         | Type                     | Description                                     |
| :----------- | :----------------------- | :---------------------------------------------- |
| deviceList   | List<LPDevice>           | Devices to play music synchronizely             |
| listener     | LPMultiRoomListener      | Callback                                        |

- Response

    N/A
    
- Sample Code

    ``` Java
    LPMultiroomManager.getInstance().deviceMultiroomWithDeviceList(deviceList,
                       new LPMultiroomListener() {
                           @Override
                           public void success(String result) {
 
                               Log.i(TAG, result);
                           }
 
                           @Override
                           public void failed(Exception e) {
 
                              Log.i(TAG, e.getLocalizedMessage());
                           }
                       });
    ```


#### With Master and Slave Devicelist

- Description

    MasterDevice is "Master device", slaveDeviceList is a list of "child devices" in the room.

    If the input masterDevice is nil, the devices in the slaveDeviceList will be deleted from the room, and the music of the masterDevice will no longer be played synchronously.

    If the input masterDevice is not nil, the devices in the slaveDeviceList will join a room with the masterDevice and play music in synchronization

    ``` Java
    void  deviceMultiroomWithSlaveDeviceList(List<LPDevice> lpDeviceList,  LPDevice masterDevice, LPMultiroomListener listener)
    ```

- Parameter

| Name            | Type                | Description                                                                                                                   |
| :-----------    | :--------------     | :-------------------------------------------------------------------------------                                              |
| slaveDeviceList | List<LPDevice>      | If masterDevice is nil, devices in this list would remove from room, other wise they would join the same room with the master |
| masterDevice    | LPDevice            | Device object                                                                                                                 |
| listener        | LPMultiRoomListener | Callback                                                                                                                      |

- Response

    N/A

- Sample Code

    ``` Java
    LPMultiroomManager.getInstance().deviceMultiroomWithSlaveDeviceList(deviceList,
                        masterDevice, new LPMultiroomListener() {
                            @Override
                            public void success(String result) {
 
                            }
 
                            @Override
                            public void failed(Exception e) {
 
                            }
                        });
    ```

/************************************************************************************************************************************/
/** @file		Accelerometer.swift
 *	@project    0_0 - Sensors
 *
 * 	@author		Justin Reina, Firmware Engineer, Jaostech
 * 	@created	6/8/16
 *
 *  @section    Ref
 *              - https://www.hackingwithswift.com/example-code/system/how-to-use-core-motion-to-read-accelerometer-data
 *
 * 	@section	Opens
 *              - do timed sample retrievals using built-in update queues, e.g. startAccelerometerUpdatesToQueue()
 *
 * 	@section	Legal Disclaimer
 * 			All contents of this source file and/or any other Jaostech related source files are the explicit property on Jaostech
 * 			Corporation. Do not distribute. Do not copy.   Copyright © 2016 Jaostech. All rights reserved.
 */
/************************************************************************************************************************************/
import CoreMotion
import UIKit


class Accelerometer : NSObject {
    
    var lastUpdateTime : NSDate =  NSDate.init(timeIntervalSince1970: 0);
    
    var motionManager: CMMotionManager!;

    override init() {
        
        super.init();

        //init motion manager
        motionManager = CMMotionManager();
        motionManager.accelerometerUpdateInterval = 1;
        motionManager.startAccelerometerUpdates();
        motionManager.gyroUpdateInterval = 1;
        motionManager.startGyroUpdates();

        //wait for available data
        while(!motionManager.accelerometerAvailable) {}
        while(!motionManager.gyroAvailable) {}
        
        //wait for first accelerometer sample
        while(motionManager.accelerometerData == nil) {}

        let accelerometerData : CMAccelerometerData? = motionManager.accelerometerData;
        
        if (accelerometerData != nil) {
            print("accel x: \(accelerometerData!.acceleration.x)");
            print("accel y: \(accelerometerData!.acceleration.y)");
        }

        //wait for first gyro sample
        while(motionManager.gyroData == nil) {}

        let gyroData : CMGyroData? = motionManager.gyroData;
        
        if(gyroData != nil) {
            print("gyro  x: \(gyroData!.rotationRate.x)");
            print("gyro  y: \(gyroData!.rotationRate.y)");
            print("gyro  z: \(gyroData!.rotationRate.z)");
        }

        print(" ");
        print("Accelerometer object initialized");
        print(" ");
        
        return;
    }
}



//
//  CameraVCDelegate.swift
//  AVCam Swift
//
//  Created by 小林 泰 on 2017/03/16.
//  Copyright © 2017年 Apple, Inc. All rights reserved.
//

import Foundation

protocol CameraVCDelegate {
    
    
    func videoRecordingComplete (videoURL: NSURL)
    
    func videoRecordingFailed()
    
    func snapshotTaken(snapshotData: NSData)
    
    func snapshotFailed()
    
    
}

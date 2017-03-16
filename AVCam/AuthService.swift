//
//  AuthService.swift
//  AVCam Swift
//
//  Created by 小林 泰 on 2017/03/16.
//  Copyright © 2017年 Apple, Inc. All rights reserved.
//

import Foundation
import FirebaseAuth

class AuthService {
    private static let _instance = AuthService()
    
    static var instance: AuthService {
        return _instance
    }
    
    func login(email: String,password: String) {
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: {(user,error) in
            
            if error != nil {
                if let errorCode = FIRAuthErrorCode(rawValue: error as! Int) {
                    if errorCode == .errorCodeUserNotFound {
                        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: {(user,error) in
                            
                            if error != nil {
                                
                            } else {
                                if user?.uid != nil {
                                    FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: {(user, error) in
                                        if error != nil {
                                            
                                        } else {
                                            
                                        }
                                    })
                                }
                            }
                        
                        })
                    }
                } else {
                    // handle other errors
                }
            } else {
                // successfully logged in
            }
        
        })
    }
    
}

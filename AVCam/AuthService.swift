//
//  AuthService.swift
//  AVCam Swift
//
//  Created by 小林 泰 on 2017/03/16.
//  Copyright © 2017年 Apple, Inc. All rights reserved.
//

import Foundation
import FirebaseAuth

typealias Completion = (_ errMsg: String?, _ data: AnyObject?) -> Void

class AuthService {
    private static let _instance = AuthService()
    
    static var instance: AuthService {
        return _instance
    }
    
    func login(email: String,password: String, onComplete: @escaping Completion) {
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: {(user,error) in
            
            if error != nil {
                if let errorCode = FIRAuthErrorCode(rawValue: error!._code) {
                    if errorCode == .errorCodeUserNotFound {
                        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: {(user,error) in
                            
                            if error != nil {
                                self.handleFirebaseError(error: error! as NSError, onComplete: onComplete)
                            } else {
                                if user?.uid != nil {
                                    FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: {(user, error) in
                                        if error != nil {
                                            self.handleFirebaseError(error: error! as NSError, onComplete: onComplete)
                                        } else {
                                            onComplete(nil, user!)
                                        }
                                    })
                                }
                            }
                        
                        })
                    }
                } else {
                    // handle other errors
                    self.handleFirebaseError(error: error! as NSError, onComplete: onComplete)
                }
            } else {
                // successfully logged in
                onComplete(nil, user!)
            }
        
        })
    }
    
    func handleFirebaseError(error: NSError, onComplete: Completion?) {
        print(error.debugDescription)
        
        if let errorCode = FIRAuthErrorCode(rawValue: error.code) {
            
            switch (errorCode) {
            case .errorCodeInvalidEmail:
                //print
                onComplete?("Invalid email address", nil)
                break
            case .errorCodeWrongPassword:
                //
                onComplete?("Invalid passs", nil)
                break
            case .errorCodeEmailAlreadyInUse, .errorCodeAccountExistsWithDifferentCredential:
                onComplete?("email already in use", nil)
                break
            default:
                onComplete?("There was a problem authenticating. Try again", nil)
                
            }
            
        }
        
    }
    
}














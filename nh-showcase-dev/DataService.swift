//
//  DataService.swift
//  nh-showcase-dev
//
//  Created by user4355 on 11/21/15.
//  Copyright © 2015 blah. All rights reserved.
//
//

import Foundation
import Firebase

class DataService {
    static let ds = DataService()
    
    private var _REF_BASE = Firebase(url: "\(DATA_STORAGE_PATH)")
    private var _REF_POSTS = Firebase(url: "\(DATA_STORAGE_PATH)/posts")
    private var _REF_USERS = Firebase(url: "\(DATA_STORAGE_PATH)/users")
    
    var REF_BASE: Firebase {
        return _REF_BASE
    }
    
    var REF_POSTS: Firebase {
        return _REF_POSTS
    }
    
    var REF_USERS: Firebase {
        return _REF_USERS
    }
    
    var REF_USER_CURRENT: Firebase {
        let uid = NSUserDefaults.standardUserDefaults().valueForKey(KEY_UID) as! String
        let user = Firebase(url: "\(DATA_STORAGE_PATH)").childByAppendingPath("users").childByAppendingPath(uid)
        return user!
    }
    
    func createFirebaseUser(uid: String, user: Dictionary<String, String>) {
        REF_USERS.childByAppendingPath(uid).setValue(user)
    }
}
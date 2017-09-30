//
//  User.swift
//  TwitterApp
//
//  Created by ashim Dahal on 9/26/17.
//  Copyright © 2017 ashim Dahal. All rights reserved.
//

import UIKit
import SwiftyJSON
import TRON

struct User : JSONDecodable {
    let name : String
    let userName : String
    let bioText : String
    let profileImageURL : String
    
    init(json : JSON){
        self.name = json["name"].stringValue
        self.userName = json["username"].stringValue
        self.bioText = json["bio"].stringValue
        self.profileImageURL = json["profileImageUrl"].stringValue
        
    }
    
}

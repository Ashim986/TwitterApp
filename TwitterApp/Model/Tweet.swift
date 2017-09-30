//
//  Tweet.swift
//  TwitterApp
//
//  Created by ashim Dahal on 9/28/17.
//  Copyright © 2017 ashim Dahal. All rights reserved.
//

import Foundation
import SwiftyJSON
import TRON

struct Tweet : JSONDecodable {
    let user : User
    let message : String
    init(json : JSON){
        let userJson = json["user"]
        self.user = User(json: userJson)
        self.message = json["message"].stringValue
    }
}

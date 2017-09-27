//
//  HomeDataSource.swift
//  TwitterApp
//
//  Created by ashim Dahal on 9/26/17.
//  Copyright © 2017 ashim Dahal. All rights reserved.
//

import LBTAComponents


class HomeDataSource: Datasource {
    
    let users :[User] = {
        let ashimUser = User(name: "Ashim Dahal", userName: "@ashimdahal", bioText: "iPhone, iPad, iOS Programming Community. Join us to learn Swift, Objective - C and build iOS apps!", profileImage : #imageLiteral(resourceName: "profile_image"))
        
        let rayUser = User(name: "Ray Wanderlich", userName: "@rwanderlich", bioText: "Ray Wanderlich is na iphone developer and tweets on topics related to iPhone, software, and gaming. Check out our conference.", profileImage : #imageLiteral(resourceName: "ray_profile_image"))
        
    return [ashimUser,rayUser]
    }()
    
//    let words = ["users1","users2","users3"]
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return[UserFooter.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return users[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return users.count
    }
    
    
}

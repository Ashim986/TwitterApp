//
//  HomeDataSource.swift
//  TwitterApp
//
//  Created by ashim Dahal on 9/26/17.
//  Copyright © 2017 ashim Dahal. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON


class HomeDataSource: Datasource , JSONDecodable {
    
    let users : [User]
    
    required init(json: JSON) throws {
        
        var myusers = [User]()
        
        let array = json["users"] .array
        for userJson in array!{
            
            let name = userJson["name"].stringValue
            let username = userJson["username"].stringValue
            let bio = userJson["bio"].stringValue
            
            let user = User(name: name, userName: username, bioText: bio, profileImage: UIImage())
            
            myusers.append(user)
            
        }
        self.users = myusers
    }
    
    
    
    // this Was hardcoded user value which is replaced by above json parsing
    
//    let users :[User] = {
//        let ashimUser = User(name: "Ashim Dahal", userName: "@ashimdahal", bioText: "iPhone, iPad, iOS Programming Community. Join us to learn Swift, Objective - C and build iOS apps!", profileImage : #imageLiteral(resourceName: "profile_image"))
//
//        let rayUser = User(name: "Ray Wanderlich", userName: "@rwanderlich", bioText: "Ray Wanderlich is na iphone developer and tweets on topics related to iPhone, software, and gaming. Check out our conference. This website is also famous for the swift riddle, various example helps supliment the knowledge acquire while studying from tutorial content", profileImage : #imageLiteral(resourceName: "ray_profile_image"))
//
//        let kindleCourseUser = User(name: "Kindle Courses", userName: "@kindleCourse", bioText: "This recently released course on http:// videos.letbuidththatapp.com/basic-training provides some excelent guidence on how to use UITableView and UICollectionView. This course also teaches some basic on the Swift language, for example If Statements fnd For Loops. This will be an excellent purchase for you.", profileImage: #imageLiteral(resourceName: "profile_image"))
//
//    return [ashimUser,rayUser, kindleCourseUser]
//    }()
//
//    let words = ["users1","users2","users3"]
    
    let tweets : [Tweet] = {
        
        let ashimUser = User(name: "Ashim Dahal", userName: "@ashimdahal", bioText: "iPhone, iPad, iOS Programming Community. Join us to learn Swift, Objective - C and build iOS apps!", profileImage : #imageLiteral(resourceName: "profile_image"))
        
       let tweet = Tweet(user: ashimUser, message: "Welcome to episode 9 of the Twitter Series, really hope you guys are enjoying the series so far. I really really need a long text block to render out so we're going to stop here.")
         let tweet2 = Tweet(user: ashimUser, message: "This is the second tweet message for our sample project . very very exciting message...")
        
        return[tweet, tweet2]
    }()
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return[UserFooter.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self ]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        if indexPath.section == 1 {
            
            return tweets[indexPath.item]
        }
        
        return users[indexPath.item]
    }
    
    override func numberOfSections() -> Int {
        return 2
    }
    override func numberOfItems(_ section: Int) -> Int {
        if section == 1{
            return tweets.count
        }
        return users.count
    }
    
    
}

//
//  Service.swift
//  TwitterApp
//
//  Created by ashim Dahal on 9/28/17.
//  Copyright © 2017 ashim Dahal. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct Service  {
    static let sharedInstance = Service()
    
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    
    func fetchHomeFeed(completion : @escaping (HomeDataSource) -> ()) {
        print("Fetching home feed")
        // start our json fetch
        // this is treditional way of fetching data
        //        URLSession.shared.dataTask(with: <#T##URL#>, completionHandler: <#T##(Data?, URLResponse?, Error?) -> Void#>)
        
        // Using TRON
        
        let request : APIRequest<HomeDataSource,JSONError> = tron.request("/twitter/home")
        
        request.perform(withSuccess: { (homeDataSource) in
            
            completion(homeDataSource)
            
//            self.datasource = homeDataSource
            
            
        }) { (err) in
            
            print("Failed to fetch json...",err)
        }
        
    
    }
    
    class JSONError : JSONDecodable {
        required init(json: JSON) throws {
            print("JSON Error")
        }
    }
}

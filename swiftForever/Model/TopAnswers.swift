//
//  TopAnswers.swift
//  swiftForever
//
//  Created by Zeynep Seyhan on 6/17/19.
//  Copyright © 2019 farukgozoglu. All rights reserved.
//

import Foundation

struct JSONresponse : Decodable{
    let items : [Items]?
}

struct Items : Decodable{
    let user:User?
    let postCount:Int?
    let score:Int?
}

struct User:Decodable{
    let reputation : Int?
    let user_id:Int?
    let user_type:String?
    let accept_rate:Int?
    let profile_image:String?
    let display_name:String?
    let link : String?
    
}

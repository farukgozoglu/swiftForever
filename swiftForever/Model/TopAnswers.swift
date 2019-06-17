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
    let userId:String?
    let userType:Int?
    let acceptRate:Int?
    let profileImage:String?
    let displayName:String?
    let link : String?
    
}

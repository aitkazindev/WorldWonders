//
//  Wonder.swift
//  WorldWonders
//
//  Created by Ibrahim Aitkazin on 07.06.2022.
//


//{
  //  name: "Colosseum",
    //region: "Europe",
    //location: "Rome, Italy",
    //flag:"https://en.wikipedia.org/wiki/Italy#/media/File:Flag_of_Italy.svg",
    //picture:"https://en.wikipedia.org/wiki/Colosseum#/media/File:Colosseo_2020.jpg"
//}
import UIKit
import SwiftyJSON
class Wonder {
    var name: String!
    var region: String!
    var location: String!
    var flag: String!
    var picture: String!
    
    init() {
        name = ""
        region = ""
        location = ""
        flag = ""
        picture = ""
    }
    
    init(json: JSON){
        if let temp = json["name"].string {
            name = temp
        }
        
        if let temp = json["region"].string {
            region = temp
        }
        
        if let temp = json["location"].string {
            location = temp
        }
        
        if let temp = json["picture"].string {
            picture = temp
        }
        
        if let temp = json["flag"].string {
            flag = temp
        }
    }
    
}

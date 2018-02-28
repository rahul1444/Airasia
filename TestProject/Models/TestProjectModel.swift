//
//  TestProjectModel.swift
//  TestProject
//
//  Created by RahulKumar on 28/02/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import Foundation
import Mapper

class TestProjectModel: Mappable {
    
    let name : String
    let address : String
    let email : String
    let phone : String
    
    required init(map: Mapper) throws {
        name = try map.from("name")
        address = try map.from("address")
        
        email = try map.from("email")
        phone = try map.from("phone.mobile")
        
    }
    
}

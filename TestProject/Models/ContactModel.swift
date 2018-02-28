//
//  ContactModel.swift
//  TestProject
//
//  Created by RahulKumar on 28/02/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import Foundation
import Mapper

class ContactModel: Mappable {
    
    var contacts : [TestProjectModel]
    
    init() {
       
        self.contacts = []
    }
    
   convenience required init(map: Mapper) throws {
    
        self.init()
        self.contacts = try map.from("contacts")
        
    }
    
    
}


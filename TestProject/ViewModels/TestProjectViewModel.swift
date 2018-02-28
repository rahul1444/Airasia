//
//  TestProjectViewModel.swift
//
//  Created by RahulKumar on 28/02/18.
//

import Foundation
import Alamofire
import Mapper

class TestProjectViewModel {
    
    var status = Binding<Int>(0)
    var message = Binding<String>("")
    var data = Binding<ContactModel>(ContactModel())
    
    init() {
        
        self.getRemoteData()
    }


}

extension TestProjectViewModel{
    
    private func getRemoteData(){
  
        Alamofire.request("http://api.androidhive.info/contacts/", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (resData) -> Void in
            self.data.value = ContactModel.from(resData.result.value as! NSDictionary)!
            
        }
    }
    
}

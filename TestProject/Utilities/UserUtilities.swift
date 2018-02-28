//
//  UserUtilities.swift
//
//  Created by RahulKumar on 28/02/18.
//

import Foundation

final class UserUtilities{
    
    static let sharedInstance = UserUtilities()
    private init() {}
        
    func validatePassword(_ password:String)->String{
        
        var message:String? = ""
        
        var reGex = "^.*(?=.*[a-z]).*$"
        var predicate = NSPredicate(format: "SELF MATCHES %@", reGex)
        let hasLowerLetter = predicate.evaluate(with: password)
        
        reGex = "^.*(?=.*[A-Z]).*$";
        predicate = NSPredicate(format: "SELF MATCHES %@", reGex)
        let hasUpperLetter = predicate.evaluate(with: password)
        
        reGex = "^.*(?=.*\\d).*$";
        predicate = NSPredicate(format: "SELF MATCHES %@", reGex)
        let hasNumber = predicate.evaluate(with: password)
        
        let set = NSCharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ0123456789@!#$%*?&").inverted
        var hasSpecialChar = false
        if password.rangeOfCharacter(from: set) != nil{
            
            hasSpecialChar = true
        }
        
        if  password.count < 8 || password.count > 30
        {
            message = "Password must be between 8-30 characters"
        }
        else if !hasLowerLetter
        {
            message = "Password must have one or more lowercase letters"
        }
        else if !hasUpperLetter
        {
            message = "Password must have one or more uppercase letters"
        }
        else if !hasNumber
        {
            message = "Password must have one or more numbers"
        }else if hasSpecialChar
        {
            message = "Password not support special characters"
        }
        
        return message!
    }
    
    func getUserDefaults(_ key:String)->Any{
        
        return UserDefaults.value(forKey: key) as Any
    }
    
    func setUserDefaults(_ key:String,_ value:Any){
        
        UserDefaults.setValue(value, forKey: key)
    }
}

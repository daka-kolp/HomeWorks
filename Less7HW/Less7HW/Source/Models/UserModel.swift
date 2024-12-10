//
//  UserModel.swift
//  Less7HW
//

//

import Foundation

struct UserModel {
    let userAvatarName: String
    let userFirstName: String
    let userLastName: String
    let userEmail: String
    let userAdderss: String
}

extension UserModel : ProfileData {
    var avatarName: String {
        return userAvatarName
    }
    
    var firstName: String {
        return userFirstName
    }
    
    var lastName: String {
        return userLastName
    }
    
    var email: String {
        return userEmail
    }
    
    var adderss: String {
       return userAdderss
    }
    
    
}

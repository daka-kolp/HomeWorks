//
//  DataProviderService.swift
//  Less7HW
//

//

import Foundation

typealias Callback = (ProfileData) -> ()

class DataProviderService {
    func loadUserData(_ callback: Callback) {
        let user = UserModel(
            userAvatarName: "userAvatar",
            userFirstName: "John",
            userLastName: "Smith",
            userEmail: "john.smith@gmail.com",
            userAdderss: "Green Bay, 1442 Sycamore Lake Road"
        )
        callback(user)
    }
    
    func loadAdminData(_ callback: Callback) {
        let admin = AdminModel(
            adminAvatarName: "adminAvatar",
            adminFirstName: "Bob",
            adminLastName: "Lester",
            adminEmail: "bob.lester@gmail.com",
            adminAdderss: "Russellville, 1171 Cambridge Court"
        )
        callback(admin)
    }
}

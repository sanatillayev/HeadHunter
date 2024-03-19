//
//  User.swift
//  headHunter
//
//  Created by Bilol Sanatillayev on 15/03/24.
//

import Foundation

struct User {
    let login: String?
    let password: Int?
    
}

extension User {
    static var logins = [
        User(login: "abcd", password: 1234)
    ]
}

//
//  User.swift
//  headHunter
//
//  Created by Bilol Sanatillayev on 15/03/24.
//

import Foundation

public struct User {
    public var email: String?

    public init(email: String?) {
        self.email = email
    }
}

extension User {
    static let logins = [
        User(email: "abcd")
    ]
}

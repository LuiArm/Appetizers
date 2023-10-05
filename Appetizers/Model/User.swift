//
//  User.swift
//  Appetizers
//
//  Created by luis armendariz on 10/5/23.
//

import Foundation

struct User: Codable {
    //Give default value to not have to iniate with values
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthdate = Date()
    var extraNapkins = false
    var extraSauce = false
}

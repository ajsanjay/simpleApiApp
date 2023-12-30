//
//  UserModel.swift
//  APIcall
//
//  Created by jay sabeen on 29/12/23.
//

import Foundation

struct UserModel: Codable {
    var firstName = ""
    var lastName = ""
    var eMail = ""
    var birthDay = Date()
    var extraNapkin = false
    var frequentRefill = false
}

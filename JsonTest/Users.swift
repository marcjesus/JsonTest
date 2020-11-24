//
//  Users.swift
//  JsonTest
//
//  Created by Marc Jesus on 23/11/2020.
//

import Foundation

struct User: Decodable {
    let address: Address
    let company: Company
    let email: String
    let id: Int
    let name: String
    let phone: String
    let username: String
    let website: String
}

struct Company: Decodable{
    let name: String
    let catchPhrase: String
    let bs: String
}

struct Address: Decodable{
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: Geo
}

struct Geo: Decodable {
    let lat: String
    let lng: String
}

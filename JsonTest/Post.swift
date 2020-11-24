//
//  Post.swift
//  JsonTest
//
//  Created by Marc Jesus on 23/11/2020.
//

import Foundation

struct Post: Encodable, Decodable {
    let body: String
    let id: Int
    let title: String
    let userId: Int
}

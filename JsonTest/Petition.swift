//
//  Petition.swift
//  JsonTest
//
//  Created by Marc Jesus on 15/11/2020.
//

import Foundation

struct Petition: Codable{
    var title: String
    var body: String
    var signatureCount: Int 
}

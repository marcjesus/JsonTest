//
//  ApiService.swift
//  JsonTest
//
//  Created by Marc Jesus on 15/11/2020.
//

import Foundation


class ApiService{
    
    //private var filename = "test.json"
    
    func load<T:Decodable> (_ filename:String, as type:T.Type = T.self) -> T {
        
        let data:Data
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else{
            fatalError("Couldn't find \(filename) in main bundle.")
        }
        
        do {
            data = try Data(contentsOf:file)
        } catch {
            fatalError("Couldn't load \(filename) in main bundle. \n\(error)")
        }
        
        do {
            let decoder = JSONDecoder()
            let datastring =  try! decoder.decode(T.self, from: data)
            print("JSON Decoder completed")
            print(datastring)
            return datastring
            
        }catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
        
    }
}

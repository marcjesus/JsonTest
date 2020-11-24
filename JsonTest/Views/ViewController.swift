//
//  ViewController.swift
//  JsonTest
//
//  Created by Marc Jesus on 15/11/2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    
    struct Petition: Codable {
        var title: String
        var body: String
        var signatureCount: Int
    
    }
    
    struct Petitions: Codable {
        var results: [Petition]
        
    }
    
    var petitions = [Petition]()
    
    private var filename = "test.json"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let data:Data
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else{
            fatalError("Couldn't find \(filename) in main bundle.")
            print("File loaded")
        }
        do {
            data = try Data(contentsOf:file)
            
        } catch {
            fatalError("Couldn't load \(filename) in main bundle. \n\(error)")
            print("Couldn't load file")
        }
        
     //   let jsonData = JSON.data(using: .utf8)!
        let decoder = JSONDecoder()
        let jsonPetitions = try? decoder.decode(Petitions.self, from: data)
        print(jsonPetitions as Any)
        
        titleLabel.text = "\(jsonPetitions)"
        
        //petitions = jsonPetitions.results
     //   print(jsonPetitions.title)
     
    }

}



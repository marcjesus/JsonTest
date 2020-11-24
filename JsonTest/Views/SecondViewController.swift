//
//  SecondViewController.swift
//  JsonTest
//
//  Created by Marc Jesus on 16/11/2020.
//

import UIKit


class SecondViewController: UIViewController {
    
    @IBOutlet var apioutput: UILabel!
    
    struct BlogPost: Codable {
        var title: String
        var URL: String
    }
    
    
    private var filename = "test2.json"
    
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
        let blogPost = try? decoder.decode(BlogPost.self, from: data)
        
        apioutput.text = "\(blogPost)"
        
  //      print(blogPost.htmlLink)

    }
}

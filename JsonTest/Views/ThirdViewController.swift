//
//  ThirdViewController.swift
//  JsonTest
//
//  Created by Marc Jesus on 22/11/2020.
//
import UIKit


class ThirdViewController : UIViewController {
  
    @IBAction func onSendPostTapped(_ sender: Any) {
        print("post")
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let newPost = Post(body: "This is body", id: 122, title: "Encoding", userId: 111)
        
        
        do {
            let jsonBody = try JSONEncoder().encode(newPost)
            //let jsonBody = try JSONSerialization.data(withJSONObject: newPost, options: [])
            request.httpBody = jsonBody
        }catch {}
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) {(data, _,_) in
            guard let data = data else {return}
            do{
                let sentPost = try JSONDecoder().decode(Post.self, from: data)
                print(sentPost)
            }catch{}

        }
        task.resume()
 
    }
    
    @IBAction func onGetUsersTapped(_ sender: Any) {
        print("get")
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {return}
        let session = URLSession.shared
        let task = session.dataTask(with: url) {(data, _, _) in
            guard let data = data else {return}
            do {
                let users = try JSONDecoder().decode([User].self, from: data)
                for user in users {
                    print(user.address)
                }
            } catch {}
        }
        task.resume()
        
    }
    
    
    
}

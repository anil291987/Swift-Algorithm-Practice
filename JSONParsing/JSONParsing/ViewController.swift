//
//  ViewController.swift
//  JSONParsing
//
//  Created by Anil Upadhyay on 24/08/17.
//  Copyright © 2017 Anil Upadhyay. All rights reserved.
//

import UIKit
struct WebsiteDescription : Decodable{
    let name: String
    let description: String
    let courses: [Course]
}
struct Course: Decodable {
    let id: Int?
    let name: String?
    let link: String?
    let imageUrl: String?
    
//    init(json: [String: Any]) {
//        id = json["id"] as? Int ?? -1
//        name = json["name"] as? String ?? ""
//        link = json["link"] as? String ?? ""
//        imageUrl = json ["imageUrl"] as? String ?? ""
//    }
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let jsonUrlString = "http://api.letsbuildthatapp.com/jsondecodable/courses_missing_fields"
        guard let url = URL(string: jsonUrlString) else{
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data  else {
                return
            }
//            let dataAsString = String(data: data, encoding: .utf8)
            do {
//                let websiteDescription = try JSONDecoder().decode(WebsiteDescription.self, from: data)
                let courses = try JSONDecoder().decode([Course].self, from: data)
                
//                // Swift 2/3/ObjC
//                guard let json = t ry JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else  {
//                    return
//                }
//                let course = Course(json: json)
                print(courses)
            }catch let jsonError {
                print("Error serializing json:", jsonError)
            }
            
        }.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


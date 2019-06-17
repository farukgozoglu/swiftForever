//
//  NetworkManager.swift
//  swiftForever
//
//  Created by Zeynep Seyhan on 6/17/19.
//  Copyright © 2019 farukgozoglu. All rights reserved.
//

import Foundation

class NetworkManager{
    private let baseURL = "https://api.stackexchange.com/"
    
    func fetchData(path: String, completion:@escaping (JSONresponse?) ->Void){
        let urlString = "\(baseURL)\(path)"
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil{
                print("error:\(error)")
            }
            else{
                guard let data = data else {return}
            do{
                     
                
                let topAnswerer = try JSONDecoder().decode(JSONresponse.self, from: data)
                completion(topAnswerer)
            }
            catch let jsonerror{
                print("jsonerror:\(jsonerror)")
            }
            }
        }.resume()
    }
}

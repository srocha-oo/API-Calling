//
//  MakeupService.swift
//  API Calling
//
//  Created by stephanie rocha marquez on 3/12/26.
//

import Foundation
class MakeupService {
    
    func fetchProducts(completion: @escaping ([Product]) -> Void) {
        
        let url = URL(string: "https://makeup-api.herokuapp.com/api/v1/products.json")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let data = data {
                
                let decoder = JSONDecoder()
                
                if let products = try? decoder.decode([Product].self, from: data) {
                    
                    DispatchQueue.main.async {
                        completion(products)
                    }
                }
            }
            
        }.resume()
    }
}

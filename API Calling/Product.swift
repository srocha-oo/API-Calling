//
//  Product.swift
//  API Calling
//
//  Created by stephanie rocha marquez on 3/12/26.
//

import Foundation
struct Product: Identifiable, Codable {
    let id: Int
    let brand: String?
    let name: String
    let price: String?
}

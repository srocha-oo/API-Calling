//
//  ProductList.swift
//  API Calling
//
//  Created by stephanie rocha marquez on 3/16/26.
//

import SwiftUI

struct ProductListView: View {
    
    let brand: String
    let products: [Product]
    
    var filteredProducts: [Product] {
        products.filter { $0.brand == brand }
    }
    
    var body: some View {
        
        List(filteredProducts) { product in
            
            VStack(alignment: .leading) {
                
                Text(product.name)
                    .font(.headline)
                
                Text("Price: $\(product.price ?? "N/A")")
                    .foregroundColor(.green)
            }
        }
        .navigationTitle(brand.capitalized)
    }
}

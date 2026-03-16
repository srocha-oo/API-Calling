//
//  ContentView.swift
//  API Calling
//
//  Created by stephanie rocha marquez on 3/12/26.
//

import SwiftUI

struct BrandListView: View {
    
    @State private var products: [Product] = []
    
    var brands: [String] {
        let brandNames = products.compactMap { $0.brand }
        return Array(Set(brandNames)).sorted()
    }
    
    var body: some View {
        
        NavigationStack {
            
            List(brands, id: \.self) { brand in
                
                NavigationLink(destination: ProductListView(brand: brand, products: products)) {
                    Text(brand.capitalized)
                }
            }
            .navigationTitle("Makeup Brands")
        }
        .onAppear {
            loadProducts()
        }
    }
    
    func loadProducts() {
        
        let service = MakeupService()
        
        service.fetchProducts { result in
            self.products = result
        }
    }
}
#Preview {
    BrandListView()
}


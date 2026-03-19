//
//  ContentView.swift
//  API Calling
//
//  Created by stephanie rocha marquez on 3/12/26.
//

import SwiftUI

struct BrandListView: View {
    @State private var products: [Product] = []
    @State private var showingAlert = false
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
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Loading Error"),
                  message: Text("There was a problem loading the poetry authors"),
                  dismissButton: .default(Text("OK")))
        }
    }
    func loadProducts() {
        let service = MakeupService()
        service.fetchProducts { result in
            if result.isEmpty {
                showingAlert = true
            }
            self.products = result
        }
    }
}

#Preview {
    BrandListView()
}


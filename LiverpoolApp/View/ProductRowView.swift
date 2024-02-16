//
//  ProductRowView.swift
//  LiverpoolApp
//
//  Created by Gil CasRam on 15/02/24.
//
import SwiftUI

struct ProductRow: View {
    let product: RecommendedItems
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(product.salePrice ?? 0.0)")
                .font(.headline)
            Text("Precio: \(product.salePrice ?? 0.0)")
            Text("Marca: \(product.brand ?? "")")
            Text("Categoría: \(product.category ?? "")")
        }
        .padding()
    }
}


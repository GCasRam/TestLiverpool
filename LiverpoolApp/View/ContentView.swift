//
//  ContentView.swift
//  LiverpoolApp
//
//  Created by Gil CasRam on 15/02/24.
//

import SwiftUI


struct ContentView: View {
    @State private var searchTerm: String = ""
    @ObservedObject private var viewModel = ProductViewModel()

    var body: some View {
        VStack {
            TextField("Buscar productos", text: $searchTerm, onCommit: {
                viewModel.fetchDataFromAPI()
            })
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())

            List(viewModel.products, id: \.id) { product in
                ProductRow(product: product)
            }
        }
        .padding()
        .onAppear{
//            viewModel.fetchProducts(for: "predefinida")
            viewModel.fetchDataFromAPI()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


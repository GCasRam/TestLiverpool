//
//  ViewModel.swift
//  LiverpoolApp
//
//  Created by Gil CasRam on 15/02/24.
//

import SwiftUI
import Foundation

class ProductViewModel: ObservableObject {
    @Published var products: [RecommendedItems] = []
    
    // Función para realizar la llamada a la API y obtener los datos
    func fetchDataFromAPI() {
        // Crear la URL de la API
        guard let url = URL(string: "https://shoppapp.liverpool.com.mx/appclienteservices/services/v7/plp/sf?page-number=1&search-string=\("mayor precio")&force-plp=false&number-of-items-per-page=40&cleanProductName=false") else {
            print("URL inválida")
            return
        }

        // Crear una tarea de URLSession para realizar la solicitud HTTP
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Comprobar si hay errores
            if let error = error {
                print("Error al realizar la solicitud: \(error.localizedDescription)")
                return
            }

            // Comprobar si se recibió una respuesta válida
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Respuesta de la API inválida")
                return
            }

            // Comprobar si se recibieron datos
            guard let responseData = data else {
                print("No se recibieron datos")
                return
            }
            if let jsonString = String(data: responseData, encoding: .utf8) {
                   print("Datos recibidos: \(jsonString)")
               } else {
                   print("No se pudo convertir los datos a una cadena UTF-8")
               }


            // Convertir los datos JSON en objetos Swift
            do {
                let decodedData = try JSONDecoder().decode(ApiResponse.self, from: responseData)
                // Procesar los datos recibidos
                print(decodedData)
            } catch {
                print("Error al decodificar los datos JSON: \(error.localizedDescription)")
            }
        }

        // Iniciar la tarea
        task.resume()
    }
}

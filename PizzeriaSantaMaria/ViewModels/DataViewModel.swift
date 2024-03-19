//
//  DataViewModel.swift
//  PizzeriaSantaMaria
//
//  Created by Maria Tkachenkova on 18.03.2024.
//

import SwiftUI
import Alamofire

class DataViewModel: ObservableObject {
    
    @Published var pizzas: [PizzaItem] = []
    
//    func fetchData() {
//        AF.request("https://raw.githubusercontent.com/MariiaTkachenkova/PizzaOrderingApp/main/Pizzas.json").responseJSON { response in
//            switch response.result {
//            case .success(let data):
//                print(data)
//                if let jsonData = try? JSONSerialization.data(withJSONObject: data),
//                   let decodedPizzas = try? JSONDecoder().decode([PizzaItem].self, from: jsonData) {
//                    self.pizzas = decodedPizzas
//                }
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
    
    func fetchData() {
        AF.request("https://raw.githubusercontent.com/MariiaTkachenkova/PizzaOrderingApp/main/Pizzas.json").responseData { response in
            switch response.result {
            case .success(let data):
                print(data)
                do {
                    let decodedPizzas = try JSONDecoder().decode([PizzaItem].self, from: data)
                    self.pizzas = decodedPizzas
                    PersistenceController.shared.clear()
                    let viewContext = PersistenceController.shared.container.viewContext
                    for pizzaItem in decodedPizzas {
                        let pizza = Pizza(context: viewContext)
                        pizza.title = pizzaItem.title
                        pizza.image = pizzaItem.imageUrl.absoluteString
                        pizza.imageHQ = pizzaItem.imageHQUrl.absoluteString
                        pizza.price = pizzaItem.price
                        pizza.desc = pizzaItem.description
                        pizza.ingred = pizzaItem.ingredients
                    }
                    try viewContext.save()
                } catch {
                    print("Error decoding JSON or saving to CoreData: \(error)")
                }
            case .failure(let error):
                print("Error fetching data: \(error)")
            }
        }
    }

    
}


//class ViewModel: ObservableObject {
//    @Published var data: [PizzaItem] = []
//
//    func fetchData() {
//        guard let url = URL(string: "https://raw.githubusercontent.com/MariiaTkachenkova/PizzaOrderingApp/main/Pizzas33_album.json") else {
//            print("Invalid URL")
//            return
//        }
//
//        AF.request(url).responseDecodable(of: [PizzaItem].self) { response in
//            switch response.result {
//            case .success(let decodedData):
//                print("Raw JSON data: \(decodedData)")
//                self.data = decodedData
//            case .failure(let error):
//                print("Error fetching data: \(error.localizedDescription)")
//            }
//        }
//    }
//}

//class ViewModel: ObservableObject {
//    @Published var data: [PizzaItem] = []
//
//    func fetchData() {
//        guard let url = URL(string: "https://raw.githubusercontent.com/MariiaTkachenkova/PizzaOrderingApp/main/Pizzas33_album.json") else {
//            print("Invalid URL")
//            return
//        }
//
//        AF.request(url).responseJSON { response in
//            switch response.result {
//            case .success(let value):
//                print("Raw JSON data: \(value)")
//                do {
//                    let jsonData = try JSONSerialization.data(withJSONObject: value)
//                    let decodedData = try JSONDecoder().decode([PizzaItem].self, from: jsonData)
//                    DispatchQueue.main.async {
//                        self.data = decodedData
//                    }
//                } catch {
//                    print("Error decoding JSON: \(error.localizedDescription)")
//                }
//            case .failure(let error):
//                print("Error fetching data: \(error.localizedDescription)")
//            }
//        }
//    }
//}



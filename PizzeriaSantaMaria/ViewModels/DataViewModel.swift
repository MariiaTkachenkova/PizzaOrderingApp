//
//  DataViewModel.swift
//  PizzeriaSantaMaria
//
//  Created by Maria Tkachenkova on 18.03.2024.
//

import Foundation
import Alamofire
import CoreData

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
    
    func fetchData(viewContext: NSManagedObjectContext) {
        PersistenceController.shared.clear()
        
        AF.request("https://raw.githubusercontent.com/MariiaTkachenkova/PizzaOrderingApp/main/Pizzas.json").responseData { response in
            switch response.result {
            case .success(let data):
                print(data)
                do {
                    let decodedPizzas = try JSONDecoder().decode([PizzaItem].self, from: data)
                    self.pizzas = decodedPizzas
                    PersistenceController.shared.clear()
                    //let viewContext = PersistenceController.shared.container.viewContext
                    for pizzaItem in decodedPizzas {
                        let pizza = Pizza(context: viewContext)
                        pizza.title = pizzaItem.title
                        pizza.image = pizzaItem.imageUrlS.absoluteString
                        pizza.imageHQ = pizzaItem.imageUrl.absoluteString
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

//
//  PizzaItem.swift
//  PizzeriaSantaMaria
//
//  Created by Maria Tkachenkova on 18.03.2024.
//

import Foundation

struct Pizzas: Decodable, Identifiable, Hashable {
    var id = UUID()
    let title: String
    let imageUrl: URL
    let price: String
    let ingredients: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case imageUrl = "image"
        case price = "price"
        case ingredients = "category"
        case description = "description"
        
    }
}


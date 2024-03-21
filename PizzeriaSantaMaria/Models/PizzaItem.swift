//
//  PizzaItem.swift
//  PizzeriaSantaMaria
//
//  Created by Maria Tkachenkova on 18.03.2024.
//

import Foundation

struct PizzaItem: Decodable, Identifiable, Hashable {
    var id = UUID()
    let title: String
    let imageUrlS: URL
    let imageUrl: URL
    let price: String
    let ingredients: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case imageUrl = "imageUrl"
        case imageUrlS = "imageUrlS"
        case price = "price"
        case ingredients = "ingredients"
        case description = "description"
    }
}


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
    let imageUrl: URL
    let imageHQUrl: URL
    let price: String
    let ingredients: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case imageUrl = "imageUrl"
        case imageHQUrl = "imageHQUrl"
        case price = "price"
        case ingredients = "ingredients"
        case description = "description"
    }
}


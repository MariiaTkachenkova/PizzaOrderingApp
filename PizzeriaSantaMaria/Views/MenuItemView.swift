//
//  MenuItemView.swift
//  PizzeriaSantaMaria
//
//  Created by Maria Tkachenkova on 19.03.2024.
//

import SwiftUI

struct MenuItemView: View {
    
    let pizza:Pizza
    
    init(pizza: Pizza) {
        self.pizza = pizza
    }
    
    var body: some View {
        
        ZStack {
            HStack {
                VStack(alignment: .leading){
                    Text("\(pizza.title ?? "")")
                        .padding(EdgeInsets(top: 2, leading: 0, bottom: 2, trailing: 0))
                    Text("\(pizza.desc ?? "")")
                        .lineLimit(2)
                        .fontWeight(.light)
                    Text("$ \(pizza.price ?? "")")
                        .fontWeight(.heavy)
                        .padding(EdgeInsets(top: 2, leading: 0, bottom: 2, trailing: 0))
                }
                Spacer()
                AsyncImage(
                    url:URL(string: "\(pizza.image ?? "")"),
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 100, maxHeight: 100)
                    },
                    placeholder: {
                        Rectangle().frame(width:  100, height: 70).foregroundColor(.black)
                    }
                )
            }
        }
    }
}



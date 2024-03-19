//
//  ItemProfileView.swift
//  PizzeriaSantaMaria
//
//  Created by Maria Tkachenkova on 19.03.2024.
//

import SwiftUI

struct ItemDetailView: View {
    
    let pizza:Pizza
    
    init(pizza: Pizza) {
        self.pizza = pizza
    }
    
    var body: some View {
        ScrollView{
            VStack{
                AsyncImage(
                    url:URL(string: "\(pizza.image ?? "")"),
                    content: { image in
                        image.resizable()
                            .frame(maxWidth: .infinity)
                            .aspectRatio(contentMode: .fit)
                    },
                    placeholder: {
                       Image("pizza_desk")
                            .frame(maxWidth: .infinity, minHeight:300, maxHeight:300)
                    }
                )
                Text("$ \(pizza.price ?? "")")
                    .fontWeight(.heavy)
                    .font(
                        Font.custom("Karla", size: 15)
                            .weight(.medium)
                    )
                    .frame(maxWidth: .infinity,alignment: .trailing)
                    .padding(.horizontal,10)
                    .padding(.vertical,5)
                Text("\(pizza.desc ?? "")")
                    .lineLimit(2)
                    .fontWeight(.light)
                    .font(
                        Font.custom("Karla", size: 15)
                            .weight(.medium)
                    )
                    .padding(.horizontal,10)
                    .padding(.vertical,5)
            }.navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("\(pizza.title ?? "")")
                            .font(
                                Font.custom("Karla", size: 15)
                                    .weight(.medium)
                            )
                            .padding(EdgeInsets(top: 2, leading: 0, bottom: 2, trailing: 0))
                    }
                }
        }
    }
}


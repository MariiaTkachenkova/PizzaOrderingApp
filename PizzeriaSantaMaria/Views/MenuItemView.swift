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
                        .font(.system(size: 20)) 
                        .padding([.top, .bottom], 2)
                    Text("$ \(pizza.price ?? "")")
                        .fontWeight(.heavy)
                        .padding(.top, 2)
                }
                Spacer()
                AsyncImage(
                    url:URL(string: "\(pizza.image ?? "")"),
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 110, maxHeight: 110)
                    },
                    placeholder: {
                        ZStack {
                            Image("pizza_desk")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 110, maxHeight: 110)
                            ProgressView()
                        }
                    }
                )
            }
        }
    }
}



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
        
        ScrollView {
            VStack {
                AsyncImage(
                    url:URL(string: "\(pizza.imageHQ ?? "")"),
                    content: { image in
                        image.resizable()
                            .frame(maxWidth: .infinity)
                            .aspectRatio(contentMode: .fit)
                    },
                    placeholder: {
                        ZStack {
                            Image("pizza_desk2")
                                .resizable()
                                .frame(maxWidth: .infinity)
                                .aspectRatio(contentMode: .fit)
                            ProgressView()
                        }
                    }
                )
                
                Text("\(pizza.desc ?? "")")
                    .lineLimit(2)
                //.fontWeight(.light)
                    .font(.leadText())
                    .padding(.horizontal,10)
                    .padding(.vertical,5)
                HStack {
                    Text("\(pizza.ingred ?? "")")
                        .lineLimit(3)
                        .fontWeight(.light)
                        .font(.paragraphText())
                        .padding(.horizontal,10)
                        .padding(.vertical,5)
                    Text("$ \(pizza.price ?? "")")
                        .fontWeight(.heavy)
                        .font(.leadText())
                        .frame(maxWidth: .infinity,alignment: .trailing)
                        .padding(.horizontal,10)
                        .padding(.vertical,5)
                }
                

                Button("Add to Cart") {
                }
                .buttonStyle(ButtonStyleYellowColorWide())
            }
            .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItemGroup() {
                        Text("\(pizza.title ?? "")")
                            .font(Font.custom("Karla", size: 15).weight(.medium))
                            .padding(EdgeInsets(top: 2, leading: 0, bottom: 2, trailing: 0))
                        Button {
                        } label: {
                            Image(systemName: "cart.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .foregroundStyle(.gray)
                                .frame(width: 30, height: 30)
                                .offset(x: -20)
                        }
                    }
                }
        }
    }
}


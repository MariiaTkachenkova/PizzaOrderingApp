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
                    .font(Font.custom("Karla", size: 15).weight(.medium))
                    .padding(.horizontal,10)
                    .padding(.vertical,5)
                Text("\(pizza.ingred ?? "")")
                    .lineLimit(3)
                    .fontWeight(.light)
                    .font(Font.custom("Karla", size: 11).weight(.medium))
                    .padding(.horizontal,10)
                    .padding(.vertical,5)
                Text("$ \(pizza.price ?? "")")
                    .fontWeight(.heavy)
                    .font(Font.custom("Karla", size: 15).weight(.medium))
                    .frame(maxWidth: .infinity,alignment: .trailing)
                    .padding(.horizontal,10)
                    .padding(.vertical,5)
                
                Button(action: {
                }) {
                    Text("Add to Cart")
                        .font(Font.custom("Karla", size: 15).bold())
                        .foregroundColor(Color.black)
                        .frame(width: 150, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    //.padding(.horizontal, 60)
                        .background(Color(red: 0.96, green: 0.81, blue: 0.08))
                        .cornerRadius(15)
                        .shadow(color: .black.opacity(0.04), radius: 0.5, x: 0, y: 4)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItemGroup(placement: .principal) {
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


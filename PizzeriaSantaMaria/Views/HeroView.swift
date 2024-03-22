//
//  HeroView.swift
//  PizzeriaSantaMaria
//
//  Created by Maria Tkachenkova on 20.03.2024.
//

import SwiftUI

struct HeroView: View {
    
    @Binding var searchText: String
    var subtitleText = "We are a family owned Italian pizzeria, focused on traditional recipes served with a modern twist."
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            Rectangle()
                .foregroundColor(.primaryColor1)
                .frame(height: 300)
            
            VStack(spacing: 0) {
                
                HStack {
                    Text("Santa Maria")
                        .font(.displayFont(size: 60))
                        .foregroundColor(.primaryColor2)
                    
                    Spacer()
                    
                    NavigationLink {
                        CartView()
                    } label: {
                        Image(systemName: "cart.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .foregroundStyle(.white)
                            .frame(width: 25, height: 25)
                    }
                }
                .offset(y: 10)
                .padding(.horizontal)
                
                HStack(spacing: 0) {
                    VStack(alignment: .leading) {
                        Text("Roma")
                            .font(.subTitleFont())
                            .foregroundColor(.white)
                        
                        Text(subtitleText)
                            .font(Font.custom("Inter", size: 16))
                            .foregroundColor(.white)
                            .frame(width: 200)
                            .multilineTextAlignment(.leading)
                    }
                    Image("pizza_cut")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 130)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                .padding(.bottom, 10)
                
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 378, height: 37)
                    .background(Color.white)
                    .cornerRadius(7)
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .padding(.leading, 10)
                            Spacer()
                            TextField("Search", text: $searchText)
                                .padding(.horizontal)
                        })
            }
            .padding(.bottom, 10)
        }
    }
}

#Preview {
    HeroView(searchText: .constant(""))
}



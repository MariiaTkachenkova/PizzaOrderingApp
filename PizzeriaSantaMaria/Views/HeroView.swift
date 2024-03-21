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
        
        ZStack {
            Rectangle()
                .foregroundColor(.primaryColor1)
                .frame(width: 428, height: 260)
                .ignoresSafeArea(edges: .top)
            
            Image("pizza_cut")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 160, height: 125)
                .cornerRadius(16)
                .frame(width: 200, height: 100)
                .frame(width: 1, alignment: .leading)
            
            VStack(spacing: 0) {
                Text("Santa Maria")
                    .font(.displayFont())
                    .foregroundColor(.primaryColor2)
                    .frame(width: 350, alignment: .leading)
                
                Text("Roma")
                    .font(.subTitleFont())
                    .foregroundColor(.white)
                    .frame(width: 350, height: 30, alignment: .leading)
                
                Text(subtitleText)
                    .font(Font.custom("Inter", size: 16))
                    .foregroundColor(.white)
                    .frame(width: 200, height: 100)
                    .frame(width: 350, alignment: .leading)
                
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



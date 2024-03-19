//
//  MenuView.swift
//  PizzeriaSantaMaria
//
//  Created by Maria Tkachenkova on 19.03.2024.
//

import SwiftUI

struct MenuView: View {
    
    @ObservedObject var viewModel = DataViewModel()
    
    @State private var searchText = ""
    @State private var menuItems: [PizzaItem] = []
    @State private var selectedCategory: String? = nil
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Pizza.entity(), sortDescriptors: []) var pizzas: FetchedResults<Pizza>
    
    var body: some View {
        
        NavigationView {
            VStack {
                HStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 250, height: 40)
                        .background(
                            Image("Logo")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 185, height: 40)
                                .clipped()
                        )
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 6, height: 54)
                        .background(
                            Image("profile-image-placeholder")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 56, height: 54)
                                .clipped()
                        )
                }
                
                ZStack {
                    Rectangle()
                        .foregroundColor(Color(red: 0.29, green: 0.37, blue: 0.34))
                        .frame(width: 428, height: 309)
                    
                    Image("Hero image")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 139, height: 144)
                        .clipped()
                        .cornerRadius(16)
                        .frame(width: 200, height: 100)
                        .frame(width: 1, alignment: .leading)
                    
                    VStack(spacing: 20) {
                        Text("Little Lemon")
                            .font(
                                Font.custom("Markazi Text", size: 64)
                                    .weight(.medium)
                            )
                            .foregroundColor(Color(red: 0.96, green: 0.81, blue: 0.08))
                            .frame(width: 350, alignment: .leading)
                            .padding(.top)
                        
                        Text("Chicago")
                            .font(Font.custom("Markazi Text", size: 60))
                            .foregroundColor(.white)
                            .frame(height: 30)
                            .frame(width: 350, alignment: .leading)
                        
                        Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
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
                                    
                                }
                            )
                    }
                }
                Text("ORDER FOR DELIVERY!")
                    .font(
                        Font.custom("Karla", size: 20)
                            .weight(.medium)
                    )
                    .foregroundColor(.black)
                    .frame(width: 350, alignment: .leading)
                 
                
                List {
                    ForEach(pizzas, id: \.self) { pizza in
                        NavigationLink(destination: ItemDetailView(pizza: pizza)) {
                            MenuItemView(pizza: pizza)
                        }
                    }
                }
                .onAppear {
                    viewModel.fetchData()
                }
                
            }
        }
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare))]
        
    }
    
    func buildPredicate(_ pizza: Pizza) -> Bool {
        if searchText.isEmpty {
            return true
        } else {
            return (pizza.title ?? "").localizedStandardContains(searchText)
        }
        
    }
}

#Preview {
    MenuView()
}

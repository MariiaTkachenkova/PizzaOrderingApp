//
//  MenuView.swift
//  PizzeriaSantaMaria
//
//  Created by Maria Tkachenkova on 19.03.2024.
//

import SwiftUI
import CoreData

struct MenuView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @ObservedObject var viewModel = DataViewModel()

    @State private var searchText = ""
    @State private var selectedCategory: String? = nil

    private var subtitleText = "We are a family owned Italian pizzeria, focused on traditional recipes served with a modern twist."
    
    @FetchRequest(entity: Pizza.entity(), sortDescriptors: []) var pizzas: FetchedResults<Pizza>
    
    var body: some View {
        
        NavigationView {
            VStack {
                ZStack {
                    Rectangle()
                        .foregroundColor(Color(red: 0.29, green: 0.37, blue: 0.34))
                        .frame(width: 428, height: 309)
                    
                    Image("pizza_cut")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 139, height: 144)
                        .cornerRadius(16)
                        .frame(width: 200, height: 100)
                        .frame(width: 1, alignment: .leading)
                    
                    VStack(spacing: 10) {
                        Text("Santa Maria")
                            .font(Font.custom("Markazi Text", size: 64).weight(.medium))
                            .foregroundColor(Color(red: 0.96, green: 0.81, blue: 0.08))
                            .frame(width: 350, alignment: .leading)
                        
                        Text("Roma")
                            .font(Font.custom("Markazi Text", size: 55))
                            .foregroundColor(.white)
                            .frame(height: 30)
                            .frame(width: 350, alignment: .leading)
                        
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
                
                FetchedObjects(predicate: buildPredicate(),
                               sortDescriptors: buildSortDescriptors()) {
                    (pizzas: [Pizza]) in
                    List {
                        ForEach(pizzas, id: \.self) { pizza in
                            NavigationLink(destination: ItemDetailView(pizza: pizza)) {
                                MenuItemView(pizza: pizza)
                            }
                        }
                    }
                    .listStyle(.plain)
                    .onAppear {
                        if pizzas.isEmpty {
                            viewModel.fetchData(viewContext: viewContext)
                        }
                    }}
                
            }
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Text("SANTA MARIA")
                        .font(Font.custom("Markazi Text", size: 37)
                            .weight(.medium))
                        .foregroundColor(Color(red: 0.29, green: 0.37, blue: 0.34))
                        .frame(width: 350, alignment: .center)
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
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare))]
    }
    
    func buildPredicate() -> NSPredicate {
        if searchText != "" {
            return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        }
        else {
            return NSPredicate(format: "TRUEPREDICATE")
        }
    }
}

#Preview {
    MenuView()
}

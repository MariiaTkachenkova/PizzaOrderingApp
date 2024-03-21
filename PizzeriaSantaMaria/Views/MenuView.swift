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
    
    @FetchRequest(entity: Pizza.entity(), sortDescriptors: []) var pizzas: FetchedResults<Pizza>
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                HeroView(searchText: $searchText)
                
                Text("ORDER FOR DELIVERY!")
                    .font(.sectionTitle())
                    .frame(width: 350, alignment: .leading)
                
                FetchedObjects(predicate: buildPredicate(),
                               sortDescriptors: buildSortDescriptors()) {
                    (pizzas: [Pizza]) in
                    List {
                        ForEach(pizzas, id: \.self) { pizza in
                            ZStack {
                                NavigationLink(destination: ItemDetailView(pizza: pizza)) {
                                    EmptyView()
                                }
                                .opacity(0)
                                MenuItemView(pizza: pizza)
                            }
                        }
                    }
                    .onAppear {
                        if pizzas.isEmpty {
                            viewModel.fetchData(viewContext: viewContext)
                        }
                    }}
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

//
//  HomeView.swift
//  PizzeriaSantaMaria
//
//  Created by Maria Tkachenkova on 19.03.2024.
//

import SwiftUI

struct HomeView: View {
    
    let persistence = PersistenceController.shared
    
    var body: some View {
        
        TabView {
            MenuView()
                .tabItem {
                    Text("Menu")
                    Image(systemName: "fork.knife")
                }
                .navigationBarHidden(true)
                .environment(\.managedObjectContext, persistence.container.viewContext)
            
            UserProfileView()
                .tabItem {
                    Text("Profile")
                    Image(systemName: "square.and.pencil")
                }
        }
    }
}

#Preview {
    HomeView()
}

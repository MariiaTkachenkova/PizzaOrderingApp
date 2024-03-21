//
//  PizzeriaSantaMariaApp.swift
//  PizzeriaSantaMaria
//
//  Created by Maria Tkachenkova on 31.01.2024.
//

import SwiftUI

@main
struct PizzeriaSantaMariaApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            OnboardingView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

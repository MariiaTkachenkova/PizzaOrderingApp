//
//  RegisterView.swift
//  PizzeriaSantaMaria
//
//  Created by Maria Tkachenkova on 20.03.2024.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject private var viewModel = ViewModel()
    
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var phoneNumber = ""
    @State var password = ""
    
    @State var isLoggedIn = false
    @Binding var isSheetOpen: Bool
    
    var body: some View {
        
        VStack {
            
            Text("Please, fill the registration form")
                .font(.highlightText(size: 13))
                .padding(.top, 30)
            
            VStack {
                
                VStack {
                    Text("First name *")
                        .onboardingTextStyle()
                    TextField("First Name", text: $firstName)
                }
                VStack {
                    Text("Last name *")
                        .onboardingTextStyle()
                    TextField("Last Name", text: $lastName)
                }
                VStack {
                    Text("E-mail *")
                        .onboardingTextStyle()
                    TextField("E-mail", text: $email)
                        .keyboardType(.emailAddress)
                }
                VStack {
                    Text("Password *")
                        .onboardingTextStyle()
                    SecureField("Password", text: $password)
                        .keyboardType(.emailAddress)
                }
            }
            .textFieldStyle(.roundedBorder)
            .disableAutocorrection(true)
            .padding()
            
            if viewModel.errorMessageShow {
                withAnimation() {
                    Text(viewModel.errorMessage)
                        .font(.highlightText(size: 12))
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                }
            }
            
            Button("Register") {
                if viewModel.validateUserRegistrationInput(firstName: firstName, lastName: lastName, email: email, phoneNumber: phoneNumber, password: password) {
                    UserDefaults.standard.set(firstName, forKey: kFirstName)
                    UserDefaults.standard.set(lastName, forKey: kLastName)
                    UserDefaults.standard.set(email, forKey: kEmail)
                    UserDefaults.standard.set(password, forKey: kPassword)
                    UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                    UserDefaults.standard.set(true, forKey: kOrderStatuses)
                    UserDefaults.standard.set(true, forKey: kPasswordChanges)
                    UserDefaults.standard.set(true, forKey: kSpecialOffers)
                    UserDefaults.standard.set(true, forKey: kNewsletter)
                    firstName = ""
                    lastName = ""
                    email = ""
                    password = ""
                    isSheetOpen = false
                }
            }
            .buttonStyle(ButtonStyleYellowColorWide())
            
            Spacer()
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    RegisterView(isSheetOpen: .constant(true))
}

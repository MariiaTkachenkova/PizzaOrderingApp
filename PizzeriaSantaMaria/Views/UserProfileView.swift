//
//  UserProfileView.swift
//  PizzeriaSantaMaria
//
//  Created by Maria Tkachenkova on 19.03.2024.
//

import SwiftUI

struct UserProfileView: View {
    
    @ObservedObject private var viewModel = ViewModel()
    
    @Environment(\.presentationMode) var presentation
    
    @State private var orderStatuses = true
    @State private var passwordChanges = true
    @State private var specialOffers = true
    @State private var newsletter = true
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var phoneNumber = ""
    @State private var password = ""
    
    @State private var isLoggedOut = false
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            NavigationLink(destination: OnboardingView(), isActive: $isLoggedOut) { }
            
            VStack(spacing: 5) {
                
                HStack {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .aspectRatio( contentMode: .fit)
                        .foregroundStyle(.gray.opacity(0.5))
                        .frame(maxHeight: 50)
                    Spacer()
                }
                .padding(.vertical)
                
                VStack {
                    Text("First name")
                        .onboardingTextStyle()
                    TextField("First Name", text: $firstName)
                }
                VStack {
                    Text("Last name")
                        .onboardingTextStyle()
                    TextField("Last Name", text: $lastName)
                    
                }
                VStack {
                    Text("Phone number")
                        .onboardingTextStyle()
                    TextField("Phone number", text: $phoneNumber)
                        .keyboardType(.default)
                }
                Text("E-mail: " + email)
                    .onboardingTextStyle()
            }
            .textFieldStyle(.roundedBorder)
            .disableAutocorrection(true)
            .padding()
            
            VStack {
                Divider()
                Text("Email notifications")
                    .font(.leadText(size: 16).bold())
                    .foregroundColor(.primaryColor1)
                Toggle("Order statuses", isOn: $orderStatuses)
                Toggle("Password changes", isOn: $passwordChanges)
                Toggle("Special offers", isOn: $specialOffers)
                Toggle("Newsletter", isOn: $newsletter)
                Divider()
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 30)
            .font(Font.leadText(size: 16))
            .foregroundColor(.primaryColor1)
            
            HStack {
                Button("Save changes") {
                    if viewModel.validateUserRegistrationInput(firstName: firstName, lastName: lastName, email: email, phoneNumber: phoneNumber, password: password) {
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        UserDefaults.standard.set(password, forKey: kPassword)
                        UserDefaults.standard.set(phoneNumber, forKey: kPhoneNumber)
                        UserDefaults.standard.set(orderStatuses, forKey: kOrderStatuses)
                        UserDefaults.standard.set(passwordChanges, forKey: kPasswordChanges)
                        UserDefaults.standard.set(specialOffers, forKey: kSpecialOffers)
                        UserDefaults.standard.set(newsletter, forKey: kNewsletter)
                        //self.presentation.wrappedValue.dismiss()
                    }
                }
                .buttonStyle(ButtonStylePrimaryColor1())
                Spacer()
            }
            Spacer(minLength: 20)
            Button("Log out") {
                UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                UserDefaults.standard.set("", forKey: kFirstName)
                UserDefaults.standard.set("", forKey: kLastName)
                UserDefaults.standard.set("", forKey: kEmail)
                UserDefaults.standard.set("", forKey: kPhoneNumber)
                UserDefaults.standard.set(false, forKey: kOrderStatuses)
                UserDefaults.standard.set(false, forKey: kPasswordChanges)
                UserDefaults.standard.set(false, forKey: kSpecialOffers)
                UserDefaults.standard.set(false, forKey: kNewsletter)
                isLoggedOut = true
            }
            .buttonStyle(ButtonStyleYellowColorWide())
            
            
            if viewModel.errorMessageShow {
                withAnimation() {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                }
            }
        }//
        .toolbar(content: {
            ToolbarItem(placement: .status) {
                Text("My Account")
            }
        })
        .onAppear {
            firstName = viewModel.firstName
            lastName = viewModel.lastName
            email = viewModel.email
            phoneNumber = viewModel.phoneNumber
            password = viewModel.password
            
            orderStatuses = viewModel.orderStatuses
            passwordChanges = viewModel.passwordChanges
            specialOffers = viewModel.specialOffers
            newsletter = viewModel.newsletter
        }
        .navigationTitle(Text("Personal information"))
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    UserProfileView()
}

//
//  Onboarding.swift
//  PizzeriaSantaMaria
//
//  Created by Maria Tkachenkova on 19.03.2024.
//

import SwiftUI

struct OnboardingView: View {
    
    @StateObject private var viewModel = ViewModel()
    
    @State private var email = ""
    @State private var password = ""
    @State private var isLoggedIn = false
    @State private var isSheetOpen = false
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: HomeView(), isActive: $isLoggedIn) {
                    EmptyView()
                }
                Image("pizza_hands")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .ignoresSafeArea(.all)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 26)
                        .foregroundStyle(.white)
                        .offset(y: -75)
                    
                    VStack {
                        Text("PIZZERIA SANTA MARIA")
                            .font(.displayFont(size: 37))
                            .foregroundColor(.primaryColor1)
                            .frame(width: 350, alignment: .center)
                            .offset(y: -50)
                        
                        Text("Login to your Account")
                            .font(.highlightText(size: 13))
                            .foregroundColor(.black)
                            .frame(width: 300, alignment: .leading)
                        
                        TextField("E-mail", text: $email)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .cornerRadius(5)
                            .shadow(color: .black.opacity(0.04), radius: 0.5, x: 0, y: 4)
                            .padding(.horizontal)
                        
                        SecureField("Password", text: $password)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .cornerRadius(5)
                            .shadow(color: .black.opacity(0.04), radius: 0.5, x: 0, y: 4)
                            .padding(.horizontal)
                        
                        Text(viewModel.errorMessage)
                            .font(.highlightText(size: 12))
                            .foregroundColor(viewModel.errorMessageShow ? .red : .clear)
                            .frame(width: 300, alignment: .leading)
                            .padding(.top, 5)
                        
                        Button("Sign In") {
                            if viewModel.validateUserSignInInput(email: email, password: password) {
                                UserDefaults.standard.set("User", forKey: kFirstName)
                                UserDefaults.standard.set(email, forKey: kEmail)
                                UserDefaults.standard.set(password, forKey: kPassword)
                                UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                                UserDefaults.standard.set(true, forKey: kOrderStatuses)
                                UserDefaults.standard.set(true, forKey: kPasswordChanges)
                                UserDefaults.standard.set(true, forKey: kSpecialOffers)
                                UserDefaults.standard.set(true, forKey: kNewsletter)
                                email = ""
                                password = ""
                                if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                                    isLoggedIn = true
                                }
                            }
                        }
                        .buttonStyle(ButtonStyleGreenColorWide())
                        .padding(.vertical)
                        
                        Text("Or sign in with:")
                            .font(Font.custom("Karla", size: 13))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .frame(width: 107, alignment: .center)
                            .padding(.top)
                        
                        HStack(spacing: 16) {
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(.white)
                                .frame(width: 52, height: 39)
                                .overlay(
                                    Image("google")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 23, height: 23)
                                )
                                .shadow(color: Color.black.opacity(0.04), radius: 0.5, x: 0, y: 4)
                            
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(.white)
                                .frame(width: 52, height: 39)
                                .overlay(
                                    Image("facebook")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 23, height: 23)
                                )
                                .shadow(color: Color.black.opacity(0.04), radius: 0.5, x: 0, y: 4)
                        }
                        .padding(.top)
                        
                        HStack(spacing: 0) {
                            Text("Don’t have an account?")
                                .font(.highlightText(size: 12))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black)
                                .frame(width: 135, alignment: .center)
                            
                            Button("Sign Up") {
                                isSheetOpen = true
                            }
                            .font(.highlightText(size: 13))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.primaryColor1)
                            .frame(width: 50, alignment: .leading)
                        }
                        .padding(.top)
                    }
                    .padding()
                }
                .onAppear() {
                    if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                        isLoggedIn = true
                    }
                }
            }
            .ignoresSafeArea(.keyboard)
        }
        .toolbar(.hidden)
        .sheet(isPresented: $isSheetOpen, content: {
            RegisterView(isSheetOpen: $isSheetOpen)
                .onDisappear(perform: {
                    if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                        isLoggedIn = true
                    }
                })
        })
    }
}

#Preview {
    OnboardingView()
}

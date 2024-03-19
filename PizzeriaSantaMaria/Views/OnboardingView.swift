//
//  Onboarding.swift
//  PizzeriaSantaMaria
//
//  Created by Maria Tkachenkova on 19.03.2024.
//

import SwiftUI

let kFirstName = "fisrt name key"
let kLastName = "last name key"
let kEmail = "email key"
let kIsLoggedIn = "kIsLoggedIn"

struct OnboardingView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var name = ""
    @State private var password = ""
    @State private var isLoggedIn = false
    
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
                        .offset(y: -80)
                    
                    VStack {
                        Text("PIZZERIA SANTA MARIA")
                            .font(Font.custom("Markazi Text", size: 37)
                                .weight(.medium))
                            .foregroundColor(Color(red: 0.29, green: 0.37, blue: 0.34))
                            .frame(width: 350, alignment: .center)
                            .offset(y: -50)
                        
                        Text("Login to your Account")
                            .font(Font.custom("Karla", size: 15)
                                .weight(.medium))
                            .foregroundColor(.black)
                            .frame(width: 350, alignment: .leading)
                        
                        TextField("Name", text: $name)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(5)
                            .shadow(color: .black.opacity(0.04), radius: 0.5, x: 0, y: 4)
                            .padding()
                        
                        SecureField("Password", text: $password)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(5)
                            .shadow(color: .black.opacity(0.04), radius: 0.5, x: 0, y: 4)
                            .padding()
                        
                        Button(action: {
                            if !name.isEmpty && !password.isEmpty {
                                UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                                if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                                    isLoggedIn = true
                                }
                            }
                            
                        }) {
                            Text("Sign in")
                                .font(Font.custom("Karla", size: 15))
                                .foregroundColor(Color.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color(red: 0.29, green: 0.37, blue: 0.34))
                                .cornerRadius(5)
                                .shadow(color: .black.opacity(0.04), radius: 0.5, x: 0, y: 4)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        
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
                                .font(Font.custom("Karla", size: 12).weight(.regular))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black)
                                .frame(width: 135, alignment: .center)
                            
                            Button("Sign Up") {
                                if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty {
                                    UserDefaults.standard.set(firstName, forKey: kFirstName)
                                    UserDefaults.standard.set(lastName, forKey: kLastName)
                                    UserDefaults.standard.set(email, forKey: kEmail)
                                    isLoggedIn = true
                                }
                            }
                            .font(Font.custom("Karla", size: 13).weight(.medium))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.29, green: 0.37, blue: 0.34))
                            .frame(width: 50, alignment: .leading)
                        }
                        .padding(.top)
                    }
                    .padding()
                }//vstack
            }//zstack
        }
        .toolbar(.hidden)
        //добавить sheet
        
    }
}

#Preview {
    OnboardingView()
}

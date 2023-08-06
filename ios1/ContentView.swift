//
//  ContentView.swift
//  ios1
//
//  Created by SAI BHANU SEKHAR REDDY BANDI on 06/08/23.
//

import SwiftUI

struct ContentView: View {
    @State private var Username = "";
    @State private var Password = "";
    @State private var showingLoginScreen = false
    
    var body : some View {
        NavigationView{
            ZStack {
                Color.brown.ignoresSafeArea()
                Circle().scale(1.7).foregroundColor(.white).opacity(0.4)
                Circle().scale(1.35).foregroundColor(.white.opacity(0.6))
                Circle().scale(1.1).foregroundColor(.green).opacity(0.5)
                VStack {
                    Text("Login").font(.largeTitle).foregroundColor(.blue).padding()
                    TextField("Username", text: $Username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(20)
                    SecureField("Password", text: $Password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(20)
                    Button("Login") {
                        authenticateUser(username: Username, password: Password)
                    }
                    .frame(width: 200, height: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(20).font(.title)
                    NavigationLink(destination: Text("Logged in Credentials\n").foregroundColor(.green).bold().underline()  +  Text("Username: " + Username + "\n" + "Password: " + Password), isActive: $showingLoginScreen) {
                        EmptyView()
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }
    
    func authenticateUser(username: String, password: String) {
        if(username.count > 5) {
            if(password.count > 4) {
                showingLoginScreen = true
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

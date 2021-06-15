//
//  ContentView.swift
//  SwiftUI FormsAndTextFields
//
//  Created by Amben on 6/15/21.
//

import SwiftUI

class FormViewModelUserCredentials: ObservableObject {
    @State var firstName = ""
    @State var lastName = ""
    @State var password = ""
    @State var passwordAgain = ""
}

class FormViewModelUserInformation: ObservableObject {
    @State var uStreet = ""
    @State var uCity = ""
    @State var uState = ""
    @State var uPostalCode = ""
    @State var uCountry = ""

}

struct ContentView: View {
    
    @StateObject var viewModelUserCredentials = FormViewModelUserCredentials()
    @StateObject var viewModelUserInfo = FormViewModelUserInformation()
    
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        TextField("First Name", text: $viewModelUserCredentials.firstName)
                        TextField("Last Name", text: $viewModelUserCredentials.lastName)
                    }
                    
                    Section(footer: Text("Your password must be at least 8 characters long")) {
                        SecureField("Create Password", text: $viewModelUserCredentials.password)
                        SecureField("Confirm Password", text: $viewModelUserCredentials.passwordAgain)
                    }
                    
                    Section(header: Text("Mailing Address")) {
                        TextField("Street Name", text: $viewModelUserInfo.uStreet)
                        TextField("City", text: $viewModelUserInfo.uCity)
                        TextField("State", text: $viewModelUserInfo.uState)
                        TextField("Postal Code", text: $viewModelUserInfo.uPostalCode)
                        TextField("Country", text: $viewModelUserInfo.uCountry)
                    }
                }//end of form
                
                Button(action: {
                    
                }, label: {
                    Text("Continue")
                        .frame(width: 400, height: 50, alignment: .center)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                })
                .padding()
            }//end of vstack
            .navigationTitle("Create Account")
        }//end of navigation view
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            
    }
}


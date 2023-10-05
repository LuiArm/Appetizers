//
//  AccountView.swift
//  Appetizers
//
//  Created by luis armendariz on 9/22/23.
//

import SwiftUI

struct AccountView: View {
    
    //Give default value to not have to iniate with values
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var birthdate = Date()
    @State private var extraNapkins = false
    @State private var extraSauce = false
    
    
    var body: some View {
        NavigationStack{
            Form {
                Section(header: Text("Personal Info")){
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                    DatePicker("Birthdate", selection: $birthdate, displayedComponents: .date)
                    
                    Button{
                       print("saved")
                    }label: {
                        Text("Save Changes")
                    }
                }
                
                Section(header: Text("Requests")) {
                    Toggle("Extra Napkins", isOn: $extraNapkins)
                    Toggle("Extra Sauce", isOn: $extraSauce)
                }
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
               
            }
            .navigationTitle("🧾 Accounts")
        }
    }
}

#Preview {
    AccountView()
}

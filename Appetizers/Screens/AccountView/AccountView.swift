//
//  AccountView.swift
//  Appetizers
//
//  Created by luis armendariz on 9/22/23.
//

import SwiftUI

struct AccountView: View {
    @StateObject var vm = AccountViewModel()
    
  
    
    
    var body: some View {
        NavigationStack{
            Form {
                Section(header: Text("Personal Info")){
                    TextField("First Name", text: $vm.firstName)
                    TextField("Last Name", text: $vm.lastName)
                    TextField("Email", text: $vm.email)
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                    DatePicker("Birthdate", selection: $vm.birthdate, displayedComponents: .date)
                    
                    Button{
                        vm.saveChanges()
                    }label: {
                        Text("Save Changes")
                    }
                }
                
                Section(header: Text("Requests")) {
                    Toggle("Extra Napkins", isOn: $vm.extraNapkins)
                    Toggle("Extra Sauce", isOn: $vm.extraSauce)
                }
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
               
            }
            .navigationTitle("🧾 Accounts")
        }
        .alert(item: $vm.alertItem){ alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    AccountView()
}

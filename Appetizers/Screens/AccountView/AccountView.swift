//
//  AccountView.swift
//  Appetizers
//
//  Created by luis armendariz on 9/22/23.
//

import SwiftUI

struct AccountView: View {
    @StateObject var vm = AccountViewModel()
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField {
        case firstName, lastName, email
    }
  
    
    
    var body: some View {
        NavigationStack{
            Form {
                Section(header: Text("Personal Info")){
                    TextField("First Name", text: $vm.user.firstName)
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit { focusedTextField = .lastName }
                        .submitLabel(.next)
                    
                    TextField("Last Name", text: $vm.user.lastName)
                        .focused($focusedTextField, equals: .lastName)
                        .onSubmit { focusedTextField = .email }
                        .submitLabel(.next)
                    
                    TextField("Email", text: $vm.user.email)
                        .focused($focusedTextField, equals: .email)
                        .onSubmit { focusedTextField = nil }
                        .submitLabel(.done)
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                    DatePicker("Birthdate", selection: $vm.user.birthdate, displayedComponents: .date)
                    
                    Button{
                        vm.saveChanges()
                    }label: {
                        Text("Save Changes")
                    }
                }
                
                Section(header: Text("Requests")) {
                    Toggle("Extra Napkins", isOn: $vm.user.extraNapkins)
                    Toggle("Extra Sauce", isOn: $vm.user.extraSauce)
                }
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
               
            }
            .navigationTitle("🧾 Accounts")
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    Button("Dismiss"){
                        focusedTextField = nil
                    }
                }
            }
        }
        .onAppear{
            vm.retrieveUser()
        }
        .alert(item: $vm.alertItem){ alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    AccountView()
}

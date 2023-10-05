//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by luis armendariz on 10/4/23.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    //Give default value to not have to iniate with values
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var birthdate = Date()
    @Published var extraNapkins = false
    @Published var extraSauce = false
    
    @Published var alertItem: AlertItem?
    var isValidForm: Bool {
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
         
        guard email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        
        return true
    }
    
    func saveChanges () {
        guard isValidForm  else { return }
        print("Changes have been saved succesfuly")
    }
}

//
//  AddView.swift
//  TodoList
//
//  Created by kavi17311 on 21/08/24.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewmodel: ListVIewModel
    @State private var textFieldText: String = ""
    
    @State private var alertTitle: String = ""
    @State private var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    //.foregroundColor(Color.black)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                Button {
                    saveButtonPressed()
                } label: {
                    Text("Save".uppercased())
                        .frame(height: 40)
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color.white)
                        .font(.headline)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }

            }
            .padding(16)
        }
        .navigationTitle("Start Adding Now 🌟")
        .alert(isPresented: $showAlert) {
            Alert(title: Text(alertTitle), dismissButton: .default(Text("OK")))
        }
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewmodel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 10 {
            alertTitle = "Hold up! Your todo item must be 10 characters long or longer. No shortcuts! 😤🚫"
            showAlert.toggle()
            return false
        }
        return true
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
       
            NavigationView {
                AddView()
            }
            .environmentObject(ListVIewModel())
    
    }
}

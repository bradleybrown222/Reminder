//
//  AddView.swift
//  Reminder
//
//  Created by Bradley Brown on 3/20/22.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    var body: some View {
        ScrollView {
            VStack{
                TextField("Enter a Reminder", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 50)
                    .cornerRadius(10)
                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                })
            }
            .padding(10)
        }
        .navigationTitle("Add an Item")
    }
    func saveButtonPressed() {
        listViewModel.addItem(title: textFieldText)
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}

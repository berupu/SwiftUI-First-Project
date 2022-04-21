//
//  Settings.swift
//  FirstSwiftUIbeRUPU
//
//  Created by be RUPU on 18/12/21.
//

import SwiftUI

struct Settings: View {
    @State var recieve = false
    @State var number = 1
    @State var selection = 1
    @State var email = ""
    @State var date = Date()
    @State var submit = false
    
    var body: some View {
        NavigationView {
            Form {
                Toggle(isOn: $recieve) {
                    Text("Recieve Notification")
                }
                Stepper(value: $number, in: 1...10) {
                    Text("\(number) Notification\(number > 1 ? "s" : "") per week")
                }
                
                Picker(selection: $selection, label: Text("Favourite course")) {
                    Text("SwiftUI").tag(1)
                    Text("React").tag(2)
                }
                DatePicker(selection: $date, label: { Text("Date") })
                Section {
                    TextField("Your mail", text: $email)
                        .textFieldStyle(.roundedBorder)
                } header: {
                    Text("Email")
                        
                }
                Button("Submit") {
                    self.submit.toggle()
                }
                .alert(isPresented: $submit){
                    Alert(title: Text("Thanks"), message: Text("Email: \(email)"))
                }

            }
            .navigationTitle("Settings")
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}

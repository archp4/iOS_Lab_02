//
//  ContentView.swift
//  lab_02
//
//  Created by Arch Umeshbhai Patel on 2025-05-16.
//

import SwiftUI

struct ContentView: View {
    
    
    private var kitList : [String] = [
        "survival kits",
        "radiation protection kit",
        "gas masks",
        "fire protection kits"
    ]
    
    @State private var homeAddress : String = "";
    @State private var number_of_people : Int = 1;
    @State private var haveKit : Bool = false;
    @State private var selectKit : String = "fire protection kits";
    @State private var isPresented : Bool = false
    @State private var alertMessage: String = "";
    
    var body: some View {
        NavigationStack{
            Form{
                Section(header: Text("Home Address")){
                    TextField("Enter Home Address", text: $homeAddress)
                } // Section
                Section(header: Text("Number of people in household")){
                    Stepper(value: $number_of_people, in: 1...10) {
                        Text("\(number_of_people)")
                    }
                } // Section
                Section(header: Text("Kit")){
                    Toggle("Already have kit? ", isOn: $haveKit)
                } // Section
                Section(header: Text("Kit Selection")){
                    Picker("Pick the Kit: ",selection: $selectKit){
                        ForEach(kitList, id: \.self){ kit in
                            Text(kit)
                        }
                    }
                } // Section
                Button{
                    if(self.homeAddress.isEmpty)
                    {
                        alertMessage = "Please Enter Homer Address"
                    }
                    else if (!(self.number_of_people > 0)){
                        alertMessage = "Minimum of One per Household is required";
                    }
                    else if (self.haveKit){
                        alertMessage = "You have already kit so you can get another"
                    }
                    else{
                        alertMessage = "We have Successfully recieve order of \(selectKit) and will be processed soon and delivered at \(homeAddress)";
                    }
                    isPresented = true;
                } label: {
                    Text("Place Order")
                }.alert(isPresented: $isPresented, content: {
                    Alert(
                        title: Text("Alert"),
                        message: Text(alertMessage),
                        dismissButton: .default(Text("OK"))
                    )
                }) // Alert
                .frame(
                    maxWidth: .infinity, alignment: .center
                )  //Button
            } // Form
            .navigationTitle("Arch Patel")
            .navigationBarTitleDisplayMode(.inline)
        } // NavigationStack
    }
}

#Preview {
    ContentView()
}

//
//  AddTodoView.swift
//  Todo App
//
//  Created by Dzaky Saputra on 15/02/21.
//

import SwiftUI

struct AddTodoView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var name: String = ""
    @State private var priority: String = "Normal"
    
    let priorities = ["High", "Normal", "Low"]
    
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    TextField("Todo", text: $name)
                    
                    Picker("Priority" ,selection: $priority){
                        ForEach(priorities, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Button(action: {
                        print("Save a new todo item")
                    }){
                        Text("Save")
                    }
                }
                Spacer()
            }
            .navigationBarTitle("New Todo", displayMode: .inline)
            .navigationBarItems(trailing:
                                    Button(action:{
                                        self.presentationMode.wrappedValue.dismiss()
                                    }){
                                        Image(systemName: "xmark")
                                    }
            )
        }
    }
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView()
    }
}

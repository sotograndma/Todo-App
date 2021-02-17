//
//  ContentView.swift
//  Todo App
//
//  Created by Dzaky Saputra on 15/02/21.
//

import SwiftUI

struct ContentView: View {
  
    @Environment(\.managedObjectContext) var managedObjectContext
  
  @FetchRequest(entity: Todo.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Todo.name, ascending: true)]) var todos: FetchedResults<Todo>
    
    @State private var showingAddTodoView: Bool = false
    var body: some View {
        NavigationView{
          List{
            ForEach(self.todos, id: \.self){ todo in
              HStack{
                Text(todo.name ?? "Unknown")
                
                Spacer()
                
                Text(todo.priority ?? "Unknown")
              }
            }
            .onDelete(perform: deleteTodo)
          }
            .navigationBarTitle("Todo",displayMode: .inline)
            .navigationBarItems(
              leading: EditButton(),
              trailing:
                                    Button(action: {
                                        self.showingAddTodoView.toggle()
                                        
                                    }){
                                        Image(systemName: "plus")
                                    }
                                    .sheet(isPresented: $showingAddTodoView){
                                      AddTodoView().environment(\.managedObjectContext, self.managedObjectContext)
                                    }
                                    )
        }
    }
  
  private func deleteTodo(at offsets: IndexSet){
    for index in offsets{
      let todo = todos[index]
      managedObjectContext.delete(todo)
      
      do{
        try managedObjectContext.save()
      } catch{
        print(error)
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
      return ContentView()
        .environment(\.managedObjectContext, context)
    }
}

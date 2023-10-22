//
//  ContentView.swift
//  Bookworm
//
//  Created by Muhammad Fahmi on 19/10/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var books: FetchedResults<Book>
    
    //found on stackoverflow
//        @Environment(\.managedObjectContext) var viewContext
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView{
            List{
                ForEach(books){ book in
                    NavigationLink{
                        Text(book.title ?? "Unknown")
                    } label: {
                        HStack{
                            EmojiView(rating: book.rating)
                                .font(.largeTitle)
                            VStack(alignment: .leading){
                                Text(book.title ?? "Unknown")
                                    .font(.headline)
                                Text(book.author ?? "Unknown")
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
                
//                found on stackoverflow
//                                .onDelete { indexSet in
//                                    deleteTodo(section: Array(books), offsets: indexSet)
//                                }
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        showingAddScreen.toggle()
                    } label: {
                        Label("Add Book", systemImage: "plus")
                    }
                }
                
            }
            .sheet(isPresented: $showingAddScreen){
                AddBookView()
            }
            .navigationTitle("Bookworm")
        }
    }
    
    //found on stackoverflow
//        func deleteTodo(section: [Book], offsets: IndexSet) {
//            for index in offsets {
//                let todo = section[index]
//                viewContext.delete(todo)
//            }
//            try? viewContext.save()
//        }
}

struct ContentView_Previews: PreviewProvider {
    // idk swiftUI previews doenst work here, so running on simulator instead
    //    static var dataController = DataController()
    
    static var previews: some View {
        ContentView()
        //            .environment(\.managedObjectContext, dataController.container.viewContext)
    }
}

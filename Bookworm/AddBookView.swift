//
//  AddBook.swift
//  Bookworm
//
//  Created by Muhammad Fahmi on 22/10/23.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var genre = ""
    @State private var genres = ["Fantasy", "Drama", "Thriller", "Comedy", "Romance", "Action"]
    @State private var review = ""
    @State private var rating = 3
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Title", text: $title)
                    TextField("Author", text: $author)
                    Picker("Genre", selection: $genre){
                        ForEach(genres, id: \.self){
                            Text($0)
                        }
                    }
                }
                Section{
                    TextEditor(text: $review)
//                    Picker("Rating", selection: $rating){
//                        ForEach(1..<6){
//                            Text("\($0)")
//                        }
//                    }
                    RatingView(rating: $rating)
                } header: {
                    Text("Write a review")
                }
                Section{
                    
                }
                Section{
                    Button("Save"){
                        let newBook = Book(context: moc)
                        
                        newBook.id = UUID()
                        newBook.title = title
                        newBook.author = author
                        newBook.review = review
                        newBook.genre = genre
                        newBook.rating = Int16(rating)
                        
                        try? moc.save()
                        
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add book")
        }
    }
}

struct AddBook_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}

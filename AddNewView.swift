//
//  AddNewView.swift
//  manga_vault
//
//  Created by Benjie Tigley on 9/17/24.
//

import SwiftUI

struct AddNewView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var readingList: [Manga] // Bind to the list of Manga objects
    
    @State private var newTitle: String = ""     // Holds the new manga title
    @State private var newImageName: String = "" // Holds the new image name
    @State private var newURL: String = ""       // Holds the new URL
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Manga Title", text: $newTitle)
                TextField("Image Name", text: $newImageName)
                TextField("Manga URL", text: $newURL)

                Button(action: {
                    addNewManga()
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Add New Manga")
                    }
                    .foregroundColor(.blue)
                }
            }
            .navigationTitle("Add New Manga")
            .navigationBarItems(leading: Button("Cancel") {
                presentationMode.wrappedValue.dismiss() // Dismiss on cancel
            })
        }
    }

    private func addNewManga() {
        // Only add if all fields are filled
        if !newTitle.isEmpty && !newImageName.isEmpty && !newURL.isEmpty {
            // Create a new Manga object and append it to the list
            let newManga = Manga(title: newTitle, imageName: newImageName, url: newURL)
            readingList.append(newManga)
            presentationMode.wrappedValue.dismiss() // Close the sheet after adding
        }
    }
}

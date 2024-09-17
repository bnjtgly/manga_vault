//
//  AddNewView.swift
//  manga_vault
//
//  Created by Benjie Tigley on 9/17/24.
//

import Foundation
import SwiftUI

struct AddNewView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var readingList: [String] // Bind the reading list to update it
    @State private var newTitle: String = "" // Holds the new title

    var body: some View {
        NavigationView {
            Form {
                TextField("Manga Title", text: $newTitle)
                
                Button(action: {
                    addNewTitle()
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Add New Title")
                    }
                    .foregroundColor(.blue)
                }
            }
            .navigationTitle("Add New Manga")
            .navigationBarItems(leading: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }

    private func addNewTitle() {
        // Add the new title to the reading list
        if !newTitle.isEmpty {
            readingList.append(newTitle)
            presentationMode.wrappedValue.dismiss() // Close the sheet after adding
        }
    }
}

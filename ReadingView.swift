//
//  ReadingView.swift
//  manga_vault
//
//  Created by Benjie Tigley on 9/17/24.
//

import SwiftUI
import WebKit

struct ReadingView: View {
    var mangaTitle: String
    var mangaURL: String  // URL of the current chapter
    
    @State private var currentChapterURL: URL

    init(mangaTitle: String, mangaURL: String) {
        self.mangaTitle = mangaTitle
        self.mangaURL = mangaURL
        _currentChapterURL = State(initialValue: URL(string: mangaURL)!)  // Initialize the current chapter URL
    }

    var body: some View {
        VStack {
            WebView(url: currentChapterURL)  // Load the current chapter URL
                .edgesIgnoringSafeArea(.all)
        }
        .navigationTitle(mangaTitle)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Next Chapter") {
                    loadNextChapter()
                }
            }
        }
    }

    private func loadNextChapter() {
        saveChapterURL(currentURL: currentChapterURL)
    }
    
    private func saveChapterURL(currentURL: URL) {
        // Convert the URL to a string for manipulation
        let currentURLString = currentURL.absoluteString
        
        guard let range = currentURLString.range(of: "/chapter/"),
              let chapterNumber = Int(currentURLString[range.upperBound...]) else {
            print("Invalid URL format")
            return
        }
        
        let nextChapterNumber = chapterNumber + 1
        let newURLString = currentURLString.replacingOccurrences(of: "/chapter/\(chapterNumber)", with: "/chapter/\(nextChapterNumber)")
        
        // Convert the new URL string back to a URL object
        guard let newURL = URL(string: newURLString) else {
            print("Invalid new URL")
            return
        }
        
        // Save the new URL to the database
        saveToDatabase(newURL.absoluteString)
        
        // Update the current chapter URL
        currentChapterURL = newURL
    }
    
    private func saveToDatabase(_ url: String) {
        // Database saving logic here (use CoreData, SQLite, or your preferred database solution)
        print("URL saved to the database: \(url)")
    }
}

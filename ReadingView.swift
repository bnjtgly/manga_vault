//
//  ReadingView.swift
//  manga_vault
//
//  Created by Benjie Tigley on 9/17/24.
//

import Foundation
import SwiftUI
import WebKit

struct ReadingView: View {
    var mangaTitle: String
    @State private var webView = WKWebView()

    var body: some View {
        VStack {
            WebView(url: URL(string: "https://example.com/manga-chapter")!, webView: webView)
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
        // Replace this URL dynamically for next chapter handling
        let nextChapterURL = URL(string: "https://example.com/next-chapter")!
        webView.load(URLRequest(url: nextChapterURL))
    }
}

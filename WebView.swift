//
//  WebView.swift
//  manga_vault
//
//  Created by Benjie Tigley on 9/17/24.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL
    let webView: WKWebView

    func makeUIView(context: Context) -> WKWebView {
        let request = URLRequest(url: url)
        webView.load(request)
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        // No updates needed here for now
    }
}

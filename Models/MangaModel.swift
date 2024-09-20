//
//  MangaModel.swift
//  manga_vault
//
//  Created by Benjie Tigley on 9/18/24.
//

import Foundation

// Define the Manga struct with an Identifiable protocol
struct Manga: Identifiable {
    let id = UUID()  // Automatically generates a unique identifier
    var title: String  // The title of the manga
    var imageName: String  // The name of the image for the thumbnail
    var url: String  // The URL link to the manga content
}

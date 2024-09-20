//
//  ContentView.swift
//  manga_vault
//
//  Created by Benjie Tigley on 9/17/24.
//

import SwiftUI

struct ContentView: View {
    // List of Manga objects, each containing the title, image name, and URL
    @State var readingList = [
        Manga(title: "Solo Max-Level Newbie", imageName: "smln", url: "https://asuracomic.net/series/solo-max-level-newbie-55c30889/chapter/1"),
        Manga(title: "Omniscient Reader’s Viewpoint", imageName: "orv", url: "https://example.com/omniscient-readers-viewpoint"),
        Manga(title: "Martial God Regressed to Level 2", imageName: "mgrl", url: "https://example.com/martial-god-regressed"),
        Manga(title: "Weapon Maker", imageName: "wm", url: "https://example.com/weapon-maker"),
        Manga(title: "Swordmaster’s Youngest Son", imageName: "sys", url: "https://example.com/swordmasters-youngest-son"),
        Manga(title: "Boundless Necromancer", imageName: "bn", url: "https://example.com/boundless-necromancer"),
        Manga(title: "Player Who Returned 10,000 Years Later", imageName: "pwr", url: "https://example.com/player-returned"),
        Manga(title: "I Killed an Academy Player", imageName: "ikap", url: "https://example.com/i-killed-an-academy-player")
    ]

    @State private var showingAddNew = false

    var body: some View {
        NavigationView {
            ZStack {
                List(readingList) { manga in
                    NavigationLink(destination: ReadingView(mangaTitle: manga.title, mangaURL: manga.url)) {
                        HStack {
                            Image(manga.imageName)
                                .resizable()
                                .frame(width: 40, height: 40)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .padding(.trailing, 10)
                            
                            Text(manga.title)
                                .font(.headline)
                        }
                    }
                }
                .navigationTitle("Library")

                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            showingAddNew = true
                        }) {
                            Image(systemName: "plus")
                                .font(.system(size: 24))
                                .frame(width: 60, height: 60)
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .clipShape(Circle())
                                .shadow(color: .gray, radius: 4, x: 2, y: 2)
                        }
                        .padding(.trailing, 20)
                        .padding(.bottom, 20)
                        
                    }
                }
            }
            .sheet(isPresented: $showingAddNew) {
                AddNewView(readingList: $readingList)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

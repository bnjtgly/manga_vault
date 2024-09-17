//
//  ContentView.swift
//  manga_vault
//
//  Created by Benjie Tigley on 9/17/24.
//

import SwiftUI

struct ContentView: View {
    @State var readingList = [
        "Solo Max-Level Newbie", 
        "Omniscient Reader’s Viewpoint",
        "Martial God Regressed to Level 2",
        "Weapon Maker",
        "Swordmaster’s Youngest Son",
        "Boundless Necromancer",
        "Player Who Returned 10,000 Years Later",
        "I Killed an Academy Player"
    ]
    @State private var showingAddNew = false

    let imageMappings = [
        "Solo Max-Level Newbie": "smln",
        "Omniscient Reader’s Viewpoint": "orv",
        "Martial God Regressed to Level 2": "mgrl",
        "Weapon Maker": "wm",
        "Swordmaster’s Youngest Son": "sys",
        "Boundless Necromancer": "bn",
        "Player Who Returned 10,000 Years Later": "pwr",
        "I Killed an Academy Player": "ikap"
    ]

    var body: some View {
        NavigationView {
            ZStack {
                List(readingList, id: \.self) { title in
                    NavigationLink(destination: ReadingView(mangaTitle: title)) {
                        HStack {
                            Image(imageMappings[title] ?? "default_image")  //
                                .resizable()
                                .frame(width: 40, height: 40)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .padding(.trailing, 10)
                            
                            Text(title)
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

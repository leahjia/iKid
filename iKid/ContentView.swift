//
//  ContentView.swift
//  iKid
//
//  Created by Leah on 4/29/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            JokeView(jokes: [
                ("What did the buffalo say to his son who was leaving for college?", "Bison"),
                ("How do you make Budweiser?", "Send him to school"),
                ("What do you call a broken clock?", "A waste of time"),
                ("Why does the scarecrow win an award?", "He was outstanding in his field")
            ], tabLabel: "Good", icon: "book")
            .tabItem {
                Label("Good", systemImage: "book")
            }
            JokeView(jokes: [
                ("No matter what happens, at the end of the day,", "It's night."),
                ("I stayed up all night to see where the sun went", "Then it dawned on me."),
                ("Why don't skeletons fight each other?", "They don't have the guts.")
            ], tabLabel: "Pun", icon: "flame")
            .tabItem {
                Label("Pun", systemImage: "flame")
            }
            JokeView(jokes: [
                ("What do you call cheese that isn't yours?", "Nacho cheese."),
                ("Why did the old man fall down the well?", "He couldn’t see that well."),
                ("Why should you never throw grandpa's false teeth at a vehicle?", "You might denture car.")
            ], tabLabel: "Dad", icon: "person.fill")
            .tabItem {
                Label("Dad", systemImage: "person.fill")
            }
            KnockKnockJokeView()
            .tabItem {
                Label("Knock Knock", systemImage: "house")
            }
        }
    }
}

struct JokeView: View {
    var jokes: [(question: String, answer: String)]
    var tabLabel: String
    var icon: String

    @State private var flipped = false
    @State private var jokeIndex = 0

    var body: some View {
        VStack(spacing: 80) {
            Spacer()
            Spacer()
            ZStack {
                Group {
                    if !flipped {
                        Text(jokes[jokeIndex].question)
                    } else {
                        Text(jokes[jokeIndex].answer)
                    }
                }
                .font(.title)
                .padding()
                .rotation3DEffect(.degrees(flipped ? 0 : 360), axis: (x: 1, y: 0, z: 0))
                .animation(.linear(duration: 0.3), value: flipped)
            }
            .frame(width: 300, height: 200)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 5)

            Button("Show/Hide Answer") {
                withAnimation {
                    flipped.toggle()
                }
            }
            .buttonStyle(.borderedProminent)
            .padding()

            Button("Next Joke") {
                withAnimation {
                    flipped = false
                    jokeIndex = (jokeIndex + 1) % jokes.count
                }
            }
            .buttonStyle(.bordered)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            .padding(30)
        }
        .padding()
        .navigationTitle(tabLabel)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct KnockKnockJokeView: View {
    @State private var step = 0
    @State private var jokeIndex = 0

    let jokes = [
        ["Knock, knock.", "Who's there?", "Yoda lady.", "Yoda lady who?", "Stop yodeling."]
    ]

    var body: some View {
        VStack(spacing: 140) {
            Spacer()
            Spacer()
            Text(step < jokes[jokeIndex].count ? jokes[jokeIndex][step] : "Start over?")
                .font(.title)
                .padding()

            Spacer()

            Button(step < jokes[jokeIndex].count - 1 ? "Next?" : "Next Joke") {
                withAnimation {
                    if step < jokes[jokeIndex].count - 1 {
                        step += 1
                    } else {
                        step = 0
                        jokeIndex = (jokeIndex + 1) % jokes.count
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

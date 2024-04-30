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
            GoodJokeView()
                .tabItem {
                    Label("Good", systemImage: "book")
                }
            PunJokeView()
                .tabItem {
                    Label("Pun", systemImage: "flame")
                }
            DadJokeView()
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

struct GoodJokeView: View {
    @State private var showingAnswer = false
    @State private var jokeIndex = 0

    let jokes = [
        (question: "Why did the coffee file a police report?", answer: "It got mugged"),
        (question: "How does a penguin build its house?", answer: "Igloos it together"),
        (question: "Why does the scarecrow win an award?", answer: "He was outstanding in his field")
    ]

struct PunJokeView: View {
    @State private var showingAnswer = false
    @State private var jokeIndex = 0

    let jokes = [
        (question: "What do you get from a pampered cow?", answer: "Spoiled milk."),
        (question: "What's orange and sounds like a parrot?", answer: "A carrot."),
        (question: "Why don't skeletons fight each other?", answer: "They don't have the guts.")
    ]

    var body: some View {
        VStack(spacing: 20) {
            Text(jokes[jokeIndex].question)
                .font(.title)
                .padding()
                .transition(.scale)

            if showingAnswer {
                Text(jokes[jokeIndex].answer)
                    .font(.title)
                    .padding()
                    .transition(.opacity)
            } else {
                Button("Show Answer") {
                    withAnimation {
                        showingAnswer = true
                    }
                }
                .buttonStyle(.borderedProminent)
                .transition(.opacity)
            }

            Button("Next Joke") {
                withAnimation {
                    showingAnswer = false
                    jokeIndex = (jokeIndex + 1) % jokes.count
                }
            }
            .buttonStyle(.bordered)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            .padding(30)
        }
        .padding()
    }
}

struct DadJokeView: View {
    @State private var showingAnswer = false
    @State private var jokeIndex = 0

    let jokes = [
        (question: "Did you hear about the cheese factory that exploded in France?", answer: "There was nothing left but de Brie."),
        (question: "I'm reading a book on anti-gravity.", answer: "It's impossible to put down!"),
        (question: "Can February March?", answer: "No, but April May!"),
    ]

    var body: some View {
        VStack(spacing: 20) {
            Text(jokes[jokeIndex].question)
                .font(.title)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                .padding(30)

            if showingAnswer {
                Text(jokes[jokeIndex].answer)
                    .font(.title)
                    .padding()
                    .transition(.opacity)
            } else {
                Button("Show Answer") {
                    withAnimation {
                        showingAnswer = true
                    }
                }
                .buttonStyle(.borderedProminent)
                .transition(.opacity)
            }

            Button("Next Joke") {
                withAnimation {
                    showingAnswer = false
                    jokeIndex = (jokeIndex + 1) % jokes.count
                }
            }
            .buttonStyle(.bordered)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
        }
        .padding()
    }
}

        }
        .padding()
    }
}

#Preview {
    ContentView()
}

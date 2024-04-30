//
//  ContentView.swift
//  iKid
//
//  Created by Leah on 4/29/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
struct GoodJokeView: View {
    @State private var showingAnswer = false
    @State private var jokeIndex = 0

    let jokes = [
        (question: "Why did the coffee file a police report?", answer: "It got mugged"),
        (question: "How does a penguin build its house?", answer: "Igloos it together"),
        (question: "Why does the scarecrow win an award?", answer: "He was outstanding in his field")
    ]

    var body: some View {
        VStack(spacing: 20) {
            Text(jokes[jokeIndex].question)
                .font(.title)
                .padding()
                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))

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


            Button("Next Joke") {
                withAnimation {
                    showingAnswer = false
                    jokeIndex = (jokeIndex + 1) % jokes.count
                }
            }
            .buttonStyle(.bordered)
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

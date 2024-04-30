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
    @State private var flipped = false
    @State private var jokeIndex = 0

    let jokes = [
        (question: "Why did the coffee file a police report?", answer: "It got mugged"),
        (question: "How does a penguin build its house?", answer: "Igloos it together"),
        (question: "Why does the scarecrow win an award?", answer: "He was outstanding in his field")
    ]

    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Spacer()
            ZStack {
                if !flipped {
                    Text(jokes[jokeIndex].question)
                        .font(.title)
                        .padding()
                        .rotation3DEffect(.degrees(flipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
                        .animation(.linear(duration: 0.3), value: flipped)
                } else {
                    Text(jokes[jokeIndex].answer)
                        .font(.title)
                        .padding()
                        .rotation3DEffect(.degrees(flipped ? 0 : -180), axis: (x: 0, y: 1, z: 0))
                        .animation(.linear(duration: 0.3), value: flipped)
                }
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
    }
}

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
                Spacer()
                    Spacer()
                    ZStack {
                        if !showingAnswer {
                            Text(jokes[jokeIndex].question)
                                .font(.title)
                                .padding()
                                .rotation3DEffect(.degrees(showingAnswer ? 180 : 0), axis: (x: 0, y: 1, z: 0))
                                .animation(.linear(duration: 0.3), value: showingAnswer)
                        } else {
                            Text(jokes[jokeIndex].answer)
                                .font(.title)
                                .padding()
                                .rotation3DEffect(.degrees(showingAnswer ? 0 : -180), axis: (x: 0, y: 1, z: 0))
                                .animation(.linear(duration: 0.3), value: showingAnswer)
                        }
                    }
                .frame(width: 300, height: 200)
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(radius: 5)

                    Button("Show Answer") {
                        withAnimation {
                            showingAnswer.toggle()
                        }
                    }
                .buttonStyle(.borderedProminent)
                    .padding()

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
                    Spacer()
                        Spacer()
                        ZStack {
                            if !showingAnswer {
                                Text(jokes[jokeIndex].question)
                                    .font(.title)
                                    .padding()
                                    .rotation3DEffect(.degrees(showingAnswer ? 180 : 0), axis: (x: 0, y: 1, z: 0))
                                    .animation(.linear(duration: 0.3), value: showingAnswer)
                            } else {
                                Text(jokes[jokeIndex].answer)
                                    .font(.title)
                                    .padding()
                                    .rotation3DEffect(.degrees(showingAnswer ? 0 : -180), axis: (x: 0, y: 1, z: 0))
                                    .animation(.linear(duration: 0.3), value: showingAnswer)
                            }
                        }
                    .frame(width: 300, height: 200)
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(radius: 5)

                        Button("Show Answer") {
                            withAnimation {
                                showingAnswer.toggle()
                            }
                        }
                    .buttonStyle(.borderedProminent)
                        .padding()

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

struct KnockKnockJokeView: View {
    @State private var step = 0
        @State private var jokeIndex = 0

        let jokes = [
        ["Knock, knock.", "Who's there?", "Yoda lady.", "Yoda lady who?", "Stop yodeling."]
        ]

            var body: some View {
                VStack(spacing: 20) {
                    Text(step < jokes[jokeIndex].count ? jokes[jokeIndex][step] : "Start over?")
                        .font(.title)
                        .padding()

                        Spacer()

                        Button(step < jokes[jokeIndex].count - 1 ? "next" : "Next") {
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

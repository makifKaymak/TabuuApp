//
//  GameViewModel.swift
//  TabuuApp
//
//  Created by Mehmet Akif Kaymak on 21.08.2024.
//

import Foundation
import FirebaseFirestore

class GameViewModel: ObservableObject {
    
    @Published var atakimi = ""
    @Published var btakimi = ""
    
    @Published var timeRemaining: Int = 60
    @Published var currentQuestion: String = ""
    @Published var tabooWords: [String] = []
    //@Published var score = 0
    
    @Published var teamAScore = 0
    @Published var teamBScore = 0
    @Published var currentTeam = "" // Current team will hold the active team's name
    
    private var db = Firestore.firestore()
    private var unusedQuestions: [QueryDocumentSnapshot] = []
    private var timer: Timer?
    
    @Published var showScorePage = false
    @Published var showEndViewPage = false
    @Published var startGame = false
    @Published var endGameReturnStartView = false
    
    init() {
        fetchQuestions()
    }
    
    func fetchQuestions() {
        db.collection("games").getDocuments { snapshot, error in
            if let error = error {
                print("Error fetching questions: \(error)")
                return
            }
            
            if let documents = snapshot?.documents {
                self.unusedQuestions = documents.shuffled()
                self.loadNextQuestion()
            }
        }
    }
    
    func loadNextQuestion() {
        guard !unusedQuestions.isEmpty else {
            self.currentQuestion = "No more questions available."
            self.tabooWords = []
            return
        }
        
        let nextQuestion = unusedQuestions.removeFirst()
        self.currentQuestion = nextQuestion.get("question") as? String ?? "No Question"
        self.tabooWords = nextQuestion.get("tabooWords") as? [String] ?? []
    }
    
    func startTimer() {
        timeRemaining = 60
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                timer.invalidate()
                //self.updateScores()
                self.showScorePage = true
                
                if self.currentTeam == self.btakimi {
                    self.endGame()
                }
            }
        }
    }
    
    /*
    func updateScores() {
        if currentTeam == atakimi {
            teamAScore += 1
        } else if currentTeam == btakimi {
            teamBScore += 1
        }
    }*/
    
    func switchTeam() {
        currentTeam = btakimi
        // Reset score
        //updateScores()
        //score = 0
        
        loadNextQuestion()
        //timeRemaining = 60
        startTimer()
        
    }
    
    func endGame() {
        // Actions to perform when the game ends
        showEndViewPage = true
    }
}

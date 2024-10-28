//
//  LearningViewModel.swift
//  learningF
//
//  Created by layan alwasaidi on 28/10/2024.
//

import SwiftUI
import Foundation
import Combine

class LearningViewModel: ObservableObject {
    // MARK: - Properties for GreetPage
     @Published var userInput: String = "Swift"
     @Published var duration: String = "Month"

     // MARK: - Properties for LogdayPage
     @Published var streakCount = 0
     @Published var freezeCount = 0
     @Published var maxFreezesPerMonth = 6
     @Published var dayLogged = false
     @Published var dayFrozen = false
     @Published var date = Date()
     @Published var dateStatuses: [Date: String] = [:]
     @Published var days: [Date] = []

     // MARK: - Properties for UpdatePage
     @Published var learningGoal: String = "Swift"
     @Published var selectedDuration: String = "Month" // For Week, Month, Year selection

     // Constants for grid columns and day labels
     let daysOfWeek = Date.capitalizedFirstThreeLettersOfWeekdays
     let columns = Array(repeating: GridItem(.flexible()), count: 7)

     // Initialize to set up initial state
     init() {
         updateCalendarDays()
     }

     // MARK: - Methods for GreetPage
     func setDuration(forGreetPage duration: String) {
         self.duration = duration
     }

     // MARK: - Methods for LogdayPage

     func updateCalendarDays() {
         days = date.calendarDisplayDays
     }
     
    func changeWeek(by value: Int) {
        date = Calendar.current.date(byAdding: .weekOfYear, value: value, to: date) ?? date
        updateCalendarDays()
    }

     func toggleLogDay() {
         guard !dayFrozen else { return }
         withAnimation {
             dayLogged.toggle()
             streakCount += dayLogged ? 1 : -1
         }
     }
     
     func toggleFreezeDay() {
         withAnimation {
             if dayFrozen {
                 freezeCount -= 1
             } else if freezeCount < maxFreezesPerMonth {
                 freezeCount += 1
             }
             dayFrozen.toggle()
         }
     }

     // MARK: - Methods for UpdatePage

     func setLearningGoal(_ goal: String) {
         self.learningGoal = goal
     }
     
     func setDuration(forUpdatePage duration: String) {
         self.selectedDuration = duration
     }

     // MARK: - Helper functions for date formatting
     func formattedDate(_ date: Date) -> String {
         let formatter = DateFormatter()
         formatter.dateFormat = "MMMM yyyy"
         return formatter.string(from: date)
     }

     func getFormattedDate(_ date: Date) -> String {
         let formatter = DateFormatter()
         formatter.dateFormat = "EEEE, dd MMM"
         return formatter.string(from: date)
     }
 }

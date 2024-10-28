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
    //  Properties for GreetPage
    @Published var userInput: String = "Swift"
    @Published var duration: String = "Month"

    //  Properties for LogdayPage
    @Published var streakCount = 0
    @Published var freezeCount = 0
    @Published var maxFreezesPerMonth = 6
    @Published var dayLogged = false
    @Published var dayFrozen = false
    @Published var date = Date()
    @Published var dateStatuses: [Date: String] = [:]
    @Published var days: [Date] = []

    //  Properties for UpdatePage
    @Published var learningGoal: String = "Swift"
    @Published var selectedDuration: String = "Month" // For Week, Month, Year selection

    // Constants for grid columns and day labels
    let daysOfWeek = Date.capitalizedFirstThreeLettersOfWeekdays
    let columns = Array(repeating: GridItem(.flexible()), count: 7)

    // Initialize to set up initial state
    init() {
        updateCalendarDays()
    }

    //  Methods for GreetPage
    func setDuration(forGreetPage duration: String) {
        self.duration = duration
    }

    //  Methods for LogdayPage
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

    //  Methods for UpdatePage
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

// Extension for hexadecimal color support
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

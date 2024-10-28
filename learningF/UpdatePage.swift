//
//  UpdatePage.swift
//  learningF
//
//  Created by layan alwasaidi on 28/10/2024.
//
import SwiftUI

struct UpdatePage: View {
    @ObservedObject var viewModel: LearningViewModel  // Use the shared ViewModel
    @State private var selectedTimeframe: String = "Week"
    @State private var searchText: String = ""

    // Dismiss action
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                // Top Navigation Bar
                HStack {
                    Button(action: {
                        dismiss() // Navigate back action
                    }) {
                        HStack(spacing: 5) {
                            Image(systemName: "chevron.left") // Arrow for back button
                            Text("Back")
                                .font(.title3)
                        }
                        .foregroundColor(.orange)
                    }
                    
                    Spacer()
                    
                    Text("Learning goal")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Button(action: {
                        // Update action - can be used to save the goal if needed
                    }) {
                        Text("Update")
                            .font(.title3)
                            .foregroundColor(.orange)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 10)
            
                // Goal Input Section
                VStack(alignment: .leading, spacing: 10) {
                    Text("I want to learn")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                    
                    // Bind TextField to learningGoal in the ViewModel
                    TextField("Enter goal", text: $viewModel.learningGoal)
                        .font(.title3)
                        .foregroundColor(.white)
                        .padding(8)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.gray.opacity(0.3))
                        )
                }
                .padding(.horizontal, 10)
                .padding(.top, 10)
                
                // Duration Selection Section
                VStack(alignment: .leading, spacing: 10) {
                    Text("I want to learn it in a")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.top, 10)
                    HStack(spacing: 16) {
                        Button(action: {
                            selectedTimeframe = "Week"
                        }) {
                            Text("Week")
                                .foregroundColor(selectedTimeframe == "Week" ? .black : .orange)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 16)
                                .background(selectedTimeframe == "Week" ? Color.orange : Color.gray)
                                .cornerRadius(8)
                        }
                        
                        Button(action: {
                            selectedTimeframe = "Month"
                        }) {
                            Text("Month")
                                .foregroundColor(selectedTimeframe == "Month" ? .black : .orange)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 16)
                                .background(selectedTimeframe == "Month" ? Color.orange : Color.gray)
                                .cornerRadius(8)
                        }
                        
                        Button(action: {
                            selectedTimeframe = "Year"
                        }) {
                            Text("Year")
                                .foregroundColor(selectedTimeframe == "Year" ? .black : .orange)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 16)
                                .background(selectedTimeframe == "Year" ? Color.orange : Color.gray)
                                .cornerRadius(8)
                        }
                    }
                }
                .padding(.horizontal, 20)
                
                Spacer()
            }
            .padding(.vertical, 20)
        }
    }
}

// Preview
struct UpdatePage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            UpdatePage(viewModel: LearningViewModel())
        }
    }
}

//
//  new.swift
//  learningF
//
//  Created by layan alwasaidi on 28/10/2024.
//

import SwiftUI

struct new: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    new()
}

import SwiftUI

struct LearningGoalView: View {
    @State private var selectedTimeframe: String = "Week"
    @State private var searchText: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Button(action: {
                    // Add back button functionality here
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.orange)
                        Text("Back")
                            .foregroundColor(.orange)
                    }
                }
                
                Spacer()
                
                Text("Learning Goal")
                    .bold()
                    .foregroundColor(.white)
                
                Spacer()
                
                Button(action: {
                    // Add update button functionality here
                }) {
                    Text("Update")
                        .foregroundColor(.orange)
                }
            }
            
            Text("I want to learn")
                .font(.headline)
            TextField("Swift", text: $searchText)
                .font(.headline)
                .padding(.vertical, 8)
                .padding(.horizontal, 12)
                .background(Color(.systemGray6))
                .cornerRadius(8)
            
            Text("I want to learn in a")
                .font(.headline)
            
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
        .padding(.bottom, 530)
    }
}

struct LearningGoalView_Previews: PreviewProvider {
    static var previews: some View {
        LearningGoalView()
    }
}

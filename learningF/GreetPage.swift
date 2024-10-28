//
//  GreetPage.swift
//  learningF
//
//  Created by layan alwasaidi on 28/10/2024.
//

import SwiftUI

struct GreetPage: View {
    @StateObject private var vm = LearningViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                // Flame icon with circle background
                Circle()
                    .fill(Color(hex: "#2C2C2E") )
                    .frame(width: 120, height: 120)
                    .overlay(
                        Text("🔥")
                            .font(.system(size: 50))
                    )
                    .padding(.top, 80)
                
                // Greeting text
                Group {
                    Text("Hello Learner!")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text("This app will help you learn everyday")
                        .font(.system(size: 16))
                        .foregroundColor(Color.white)
                }
                
                // Learning input field
                Group {
                    Text("I want to learn")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    TextField("Swift", text: $vm.userInput)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(8)
                        .foregroundColor(.gray)
                        .overlay(Divider().background(Color.gray), alignment: .bottom)
                }
                .padding(.horizontal, 30)
                
                // Duration selection buttons
                Group {
                    Text("I want to learn it in a")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack(spacing: 14) {
                        ForEach(["Week", "Month", "Year"], id: \.self) { period in
                            Button(action: { vm.duration = period }) {
                                Text(period)
                                    .frame(width: 80, height: 40)
                                    .background(vm.duration == period ? Color(hex: "#FF9F0A")  : Color.gray.opacity(0.3))
                                    .foregroundColor(vm.duration == period ? .black : .orange)
                                    .cornerRadius(10)
                                
                            }
                        }
                    }
                }
                .padding(.horizontal, 4)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                // Start button
                NavigationLink(destination: LogdayPage().navigationBarBackButtonHidden(true)) {
                    Text("Start")
                        .fontWeight(.bold)
                        .frame(maxWidth: 150, minHeight: 55)
                        .background(Color(hex: "#FF9F0A"))
                        .foregroundColor(.black)
                        .cornerRadius(5)
                        .padding(.horizontal, 30)
                }
                .padding(.top, 20)
                
                Spacer()
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

struct GreetPage_Previews: PreviewProvider {
    static var previews: some View {
        GreetPage()
    }
}

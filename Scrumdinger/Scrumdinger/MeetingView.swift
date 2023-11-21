//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Ariel Merino on 17/11/23.
//

import SwiftUI

struct MeetingView: View {
    @State private var secondsElapsed: Float = 0.0
    private let totalSeconds: Float = 122.3
    
    var body: some View {
        VStack{
            ProgressView(value: secondsElapsed, total: totalSeconds){
                Text("\(Int(secondsElapsed.rounded(.up))) seconds elapsed")
            }
            HStack(spacing: 20){
                Label("Time elapsed: \(Int(secondsElapsed))s", systemImage: "clock.fill")
                    .font(.caption)
                    
                Spacer()
                Label("Remaining time: \(Int(totalSeconds - secondsElapsed))s", systemImage: "clock")
                    .font(.caption)
            }
            HStack(alignment: .center, spacing: 8){
                Button{
                    secondsElapsed <= 122.3 ? secondsElapsed += Float(1 * Int.random(in: 1...10)) : nil
                } label: {
                    Image(systemName: "timer")
                    Text("Start")
                        .font(.caption)
                    
                }
                .foregroundStyle(.white)
                .padding()
                .background(Color(.systemGreen))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                
                
                Button{
                    secondsElapsed = 0
                } label: {
                    Image(systemName: "arrow.circlepath")
                    Text("Restart")
                        .font(.caption)
                }
                .foregroundStyle(.white)
                .padding()
                .background(Color(.systemRed))
                .clipShape(RoundedRectangle(cornerRadius: 8))

                
                Button{
                    secondsElapsed = 122.3
                } label: {
                    Image(systemName: "battery.100percent")
                    Text("Fill")
                        .font(.caption)
                }
                .foregroundStyle(.white)
                .padding()
                .background(Color(.systemBlue))
                .clipShape(RoundedRectangle(cornerRadius: 8))

            }
            .padding(.top)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(Text("Time remaining"))
        .padding()
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .padding()
        Spacer()
        Circle()
            .strokeBorder(lineWidth: 25)
            .padding(.horizontal)
        HStack{
            Text("Speaker 1 of 3")
                .font(.custom("SF rounded", fixedSize: 16))
            Spacer()
            Button{
                    
            } label: {
                    Image(systemName: "forward.fill")
            }
            .accessibilityLabel("Next speaker")

        }
        .padding(.horizontal)
    }
}

#Preview {
    MeetingView()
}

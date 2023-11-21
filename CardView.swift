//
//  CardView.swift
//  Scrumdinger
//
//  Created by Ariel Merino on 18/11/23.
//

import SwiftUI

struct CardView: View {
    
    let scrum: DailyScrum
    
    
    var body: some View {
        VStack(alignment: .leading){
            Text(scrum.title)
                .padding(.horizontal)
                .padding(.bottom)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
            HStack{
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                    .padding(.horizontal)
                    .labelStyle(.leadingStyle)
                    .accessibilityLabel("\(scrum.attendees.count) attendees")
                Spacer()
                Label("\(scrum.lengthInMinutes)min", systemImage: "clock")
                    .padding(.horizontal)
                    .labelStyle(.trailingIcon)
                    .accessibilityLabel("\(scrum.lengthInMinutes) minutes meeting")
            }
        }
        .font(.caption)
        .foregroundStyle(scrum.theme.accentColor)
        .padding()
        .background(scrum.theme.maincolor)

    }
}

#Preview {
    CardView(scrum: DailyScrum.sampleData[2])
}

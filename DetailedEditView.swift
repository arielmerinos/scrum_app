//
//  DeailedEditView.swift
//  Scrumdinger
//
//  Created by Ariel Merino on 20/11/23.
//

import SwiftUI

struct DetailedEditView: View {
    @Binding var scrum: DailyScrum
    @State private var newAttendeeName = ""
    
    
    var body: some View {
        Form{
            Section(header: Text("header")){
                TextField("title", text: $scrum.title)
                HStack{
                    Slider(value: $scrum.lenghtInMinutesAsDouble, in: 5...30, step: 1){
                        Text("longitud")
                    }
                    .accessibilityValue("\(scrum.lengthInMinutes) minutes")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) min")
                        .accessibilityHidden(true)
                }
            }
            Section(header: Text("Attendees")){
                ForEach(scrum.attendees){ attendee in
                    Text(attendee.name)
                }
                .onDelete{ indices in
                    scrum.attendees.remove(atOffsets: indices)
                }
                HStack{
                    TextField("New Attendee", text: $newAttendeeName)
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.25)){
                            let attendee = DailyScrum.Attendee(name: newAttendeeName)
                            scrum.attendees.append(attendee)
                            newAttendeeName = ""
                        }
                    }){
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add attendee")
                    }
                    .disabled(newAttendeeName.isEmpty)
                }
                ThemePicker(selection: $scrum.theme)
            }
        }

    }
}

#Preview {
    DetailedEditView(scrum: .constant(DailyScrum.sampleData[0]))
}

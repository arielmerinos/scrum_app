//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Ariel Merino on 18/11/23.
//

import SwiftUI

struct DetailView: View {
    
    @State private var isPresentingEditView = false
    @State private var editingScrum = DailyScrum.emptyScrum
    
    @Binding var scrum: DailyScrum
    
    var body: some View {
        List{
            Section(header: Text("Detailed view")){
                NavigationLink(destination: MeetingView()){
                    Label("Start meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundStyle(Color(.systemBlue))
                }

                HStack{
                    Label("Lenght", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine)
                HStack{
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text("\(scrum.theme.name)")
                        .padding(4)
                        .foregroundStyle(Color(scrum.theme.accentColor))
                        .background(Color(scrum.theme.maincolor))
                        .clipShape(RoundedRectangle(cornerRadius: 4 ))
                }
                .accessibilityElement(children: .combine)
            }
            Section(header: Text("Attendees list")){
                ForEach(scrum.attendees){ atendee in
                    Label(atendee.name, systemImage: "person.circle.fill")

                    
                }
            }
        }
        .navigationTitle(scrum.title)
        .sheet(isPresented: $isPresentingEditView){
            NavigationStack{
                DetailedEditView(scrum: $editingScrum)
                    .navigationTitle(scrum.title)
                    .toolbar{
                        ToolbarItem(placement: .cancellationAction){
                            Button("Cancel"){
                                isPresentingEditView = false
                            }
                        }
                        
                        ToolbarItem(placement: .confirmationAction){
                            Button("Done"){
                                scrum = editingScrum
                                isPresentingEditView = false
                            
                            }
                        }
                    }
            }
            
        }
        .toolbar{
            Button{
                isPresentingEditView = true
                editingScrum = scrum
            } label: {
                Text("Edit")
            }
        }

    }
}

#Preview {
    NavigationStack{
        DetailView(scrum: .constant(DailyScrum.sampleData[0]))
    }
}

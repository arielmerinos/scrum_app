//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Ariel Merino on 18/11/23.
//

import SwiftUI

struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]
    
    
    var body: some View {
        NavigationStack{
            List($scrums){ $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)){
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.maincolor)
            }
            .navigationTitle("Scrums")
            .toolbar{
                Button(action: {}){
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New scrum")
            }
        }
        .preferredColorScheme(.light)
    }
}

#Preview {
    ScrumsView(scrums: .constant(DailyScrum.sampleData))
}

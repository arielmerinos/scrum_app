//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Ariel Merino on 17/11/23.
//

import Foundation

struct DailyScrum: Identifiable{
    var id: UUID
    
    var title: String
    var attendees: [Attendee]
    var lengthInMinutes: Int
    var lenghtInMinutesAsDouble: Double{
        get{
            Double(lengthInMinutes)
        }
        set{
            lengthInMinutes = Int(newValue)
        
        }
    }
    var theme: Theme
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees.map{ Attendee(name: $0 )}
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
}

extension DailyScrum{
    static let sampleData: [DailyScrum] =
    [
        DailyScrum(title: "Design", attendees: ["Cathy", "Daisy", "Simon", "Jonathan"], lengthInMinutes: 10, theme: .blue),
        DailyScrum(title: "App Dev", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"], lengthInMinutes: 5, theme: .purple),
        DailyScrum(title: "Web Dev", attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Dennis"], lengthInMinutes: 1, theme: .teal),
        DailyScrum(title: "Marketing", attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Dennis"], lengthInMinutes: 1, theme: .purple),
    ]
}


extension DailyScrum{
    struct Attendee: Identifiable{
        var id: UUID = UUID()
        var name: String
        
        init(id: UUID = UUID(), name: String){
            self.id = id
            self.name = name
        }
    }
    
    static var emptyScrum: DailyScrum{
        DailyScrum(title: "", attendees: [], lengthInMinutes: 5, theme: .sky)
    }
}

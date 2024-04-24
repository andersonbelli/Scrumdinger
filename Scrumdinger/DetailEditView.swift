//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Belli on 24/4/24.
//

import SwiftUI

struct DetailEditView: View {
    @State private var scrum = DailyScrum.emptyScrum
    @State private var newAttendeeName = ""
    
    var body: some View {
        Form {
            Section(
                header: Text("Meeting info")) {
                    TextField("Title", text: $scrum.title)
                    HStack {
                        Slider(value: $scrum.lengthInMinutesAsDouble, in: 5...30, step: 1){
                            Text("Length")
                        }
                        Spacer()
                        Text("\(scrum.lengthInMinutes) minutes")
                    }
                }
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    Text(attendee.name)
                }
                .onDelete { indices in
                    scrum.attendees.remove(atOffsets: indices)
                }
                HStack {
                    TextField("New attendee", text: $newAttendeeName)
                    Button(action: {
                        withAnimation {
                            let attendee = DailyScrum.Attendee(name: newAttendeeName)
                            scrum.attendees.append(attendee)
                            newAttendeeName = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(newAttendeeName.isEmpty)
                }
            }
        }
    }
}

#Preview {
    DetailEditView()
}

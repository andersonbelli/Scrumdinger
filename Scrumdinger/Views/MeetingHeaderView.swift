//
//  MeetingHeaderView.swift
//  Scrumdinger
//
//  Created by Belli on 26/4/24.
//

import SwiftUI

struct MeetingHeaderView: View {
    let secondsElapsed: Int
    let secondsRemaning: Int
    let theme: Theme
    
    private var totalSeconds: Int {
        secondsElapsed + secondsRemaning
    }
    
    private var progress: Double {
        guard totalSeconds > 0 else { return 1 }
        return Double(secondsElapsed) / Double(totalSeconds)
    }
    
    private var minutesRemaning: Int {
        secondsRemaning / 60
    }
    
    var body: some View {
        VStack {
            ProgressView(value: progress)
                .progressViewStyle(
                    ScrumProgressViewStyle(theme: theme))
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds elapsed")
                        .font(.caption)
                    Label("\(secondsElapsed)", systemImage: "hourglass.tophalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds remaning")
                        .font(.caption)
                        .labelStyle(.trailingIcon)
                    Label("\(secondsRemaning)", systemImage: "hourglass.bottomhalf.fill")
                }
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Time remaining")
        .accessibilityValue("\(minutesRemaning) minutes")
        .padding([.top, .horizontal])
    }
}

#Preview {
    MeetingHeaderView(secondsElapsed: 60, secondsRemaning: 180, theme: .bubblegum)
        .previewLayout(.sizeThatFits)
}

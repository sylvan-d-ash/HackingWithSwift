//
//  BetterRestView.swift
//  BetterRest
//
//  Created by Sylvan  on 02/05/2025.
//

import CoreML
import SwiftUI

public struct BetterRestView: View {
    @State private var wakeUp = Date.now
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false

    public init() {}

    public var body: some View {
        VStack {
            Text("When do you want ot wake up?")
                .font(.headline)

            DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                .labelsHidden()

            Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)

            Text("Daily coffe intake")
                .font(.headline)

            Stepper("\(coffeeAmount) cup(s)", value: $coffeeAmount, in: 1...20)
        }
        .navigationTitle("Better Rest")
        .toolbar {
            Button("Calculate", action: calculateBedtime)
        }
        .alert(alertTitle, isPresented: $showingAlert) {
            Button("OK") {}
        } message: {
            Text(alertMessage)
        }
    }

    private func calculateBedtime() {
        do {
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60

            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))

            let sleepTime = wakeUp - prediction.actualSleep
            alertTitle = "Your ideal bedtime is..."
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            showingAlert = true
        } catch {
            print("Error creating model: \(error.localizedDescription)")
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
            showingAlert = true
        }
    }
}

#Preview {
    NavigationStack {
        BetterRestView()
    }
}

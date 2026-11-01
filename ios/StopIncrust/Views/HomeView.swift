import SwiftUI

struct HomeView: View {
    @EnvironmentObject var session: SessionStore
    @State private var eventName = ""
    @State private var location = ""
    @State private var date = Date().addingTimeInterval(86400 * 30)
    @State private var maxIncrustes: String = "0"
    @State private var error: String?

    var body: some View {
        NavigationStack {
            Form {
                Section("New event (Host)") {
                    TextField("Name", text: $eventName)
                    TextField("Location", text: $location)
                    DatePicker("Date", selection: $date)
                    TextField("Max incruste per guest (0 = none, empty = unlimited)", text: $maxIncrustes)
                        .keyboardType(.numberPad)
                    Button("Create event") { Task { await create() } }
                }
                if let error { Text(error).foregroundColor(.red) }
                Section {
                    NavigationLink("Scan mode (scanner)") { ScannerView() }
                }
            }
            .navigationTitle("StopIncrust")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Sign out") { session.signOut() }
                }
            }
        }
    }

    private func create() async {
        let max: Int? = maxIncrustes.isEmpty ? nil : Int(maxIncrustes)
        do {
            _ = try await ApiClient.shared.createEvent(name: eventName, date: date, location: location, maxIncrustes: max)
            eventName = ""; location = ""
        } catch { self.error = error.localizedDescription }
    }
}

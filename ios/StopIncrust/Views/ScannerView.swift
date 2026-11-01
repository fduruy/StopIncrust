import SwiftUI

struct ScannerView: View {
    @State private var lastResult: ScanResult?
    @State private var error: String?

    var body: some View {
        VStack(spacing: 16) {
            Text("Scan a guest QR code").font(.headline)
            // TODO: integrate AVFoundation QR capture; paste manually for now
            Text("QR capture placeholder — paste payload below")
            if let last = lastResult {
                Text(last.valid ? "VALID \(last.type ?? "")" : "INVALID \(last.reason ?? "")")
                    .foregroundColor(last.valid ? .green : .red).bold()
                if let guest = last.guest {
                    Text("\(guest.first_name ?? "") \(guest.last_name ?? "")")
                }
            }
            if let error { Text(error).foregroundColor(.red).font(.caption) }
        }
        .padding()
        .navigationTitle("Scanner")
    }
}

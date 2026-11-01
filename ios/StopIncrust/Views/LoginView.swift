import SwiftUI

struct LoginView: View {
    @EnvironmentObject var session: SessionStore
    @State private var phone = ""
    @State private var otp = ""
    @State private var otpSent = false
    @State private var error: String?

    var body: some View {
        VStack(spacing: 16) {
            Text("StopIncrust").font(.largeTitle).bold()
            if !otpSent {
                TextField("Phone (+336...)", text: $phone)
                    .keyboardType(.phonePad).textContentType(.telephoneNumber)
                Button("Send OTP") { Task { await sendOtp() } }
            } else {
                SecureField("SMS code", text: $otp)
                Button("Verify") { Task { await verify() } }
            }
            if let error { Text(error).foregroundColor(.red).font(.caption) }
        }
        .padding()
    }

    private func sendOtp() async {
        do {
            try await ApiClient.shared.sendOtp(phone: phone)
            otpSent = true
        } catch { self.error = error.localizedDescription }
    }

    private func verify() async {
        do {
            let token = try await ApiClient.shared.verifyOtp(phone: phone, token: otp)
            session.signIn(accessToken: token)
        } catch { self.error = error.localizedDescription }
    }
}

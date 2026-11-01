import Foundation
import Combine

final class SessionStore: ObservableObject {
    @Published var isAuthenticated = false
    @Published var phone: String = ""

    func signIn(accessToken: String) {
        ApiClient.shared.setSession(accessToken: accessToken)
        isAuthenticated = true
    }

    func signOut() {
        ApiClient.shared.setSession(accessToken: nil)
        isAuthenticated = false
    }
}

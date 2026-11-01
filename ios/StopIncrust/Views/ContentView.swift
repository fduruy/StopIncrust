import SwiftUI

struct ContentView: View {
    @EnvironmentObject var session: SessionStore

    var body: some View {
        if session.isAuthenticated {
            HomeView()
        } else {
            LoginView()
        }
    }
}

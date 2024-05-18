import SwiftUI

class UserData: ObservableObject {
    @Published var currentUser: User?
    
    func signUp(user: User) {
        currentUser = user
    }
}

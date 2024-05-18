import SwiftUI

struct HomePage: View {
    @ObservedObject var userData: UserData
    @State private var isLoggedIn = false
    
    var body: some View {
        if isLoggedIn {
            VStack {
                HStack {
                    Spacer()
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .padding()
                    Spacer()
                    Image("Pokee")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .padding()
                }
                Spacer()
                Text("Welcome, \(userData.currentUser?.firstName ?? "")!")
                    .padding()
                Button("Log Out") {
                    userData.currentUser = nil
                    isLoggedIn = false
                }
                .padding()
                Spacer()
            }
        } else {
            Text("You need to log in first")
        }
    }
}

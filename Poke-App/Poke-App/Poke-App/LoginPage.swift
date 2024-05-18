import SwiftUI

struct LoginPage: View {
    @State private var username = ""
    @State private var password = ""
    @ObservedObject var userData: UserData
    @State private var isSignUpPagePresented = false
    @State private var showAlert = false
    @State private var isLoggedIn = false

    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 30/255, green: 30/255, blue: 30/255)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    Spacer()
                    Spacer()
                    Image("Poke")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 300)
                        .offset(y: -30)
                    TextField("Username", text: $username)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .padding(.horizontal)
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .padding(.horizontal)
                    Spacer()
                    Button(action: login) {
                        Text("Login")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue.opacity(0.7))
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Wrong Password"),
                            message: Text("Try again"),
                            dismissButton: .default(Text("OK"))
                        )
                    }
                    NavigationLink(destination: SignUpPage(userData: userData), isActive: $isSignUpPagePresented) {
                        Text("Don't have an account? Click here")
                            .foregroundColor(.white)
                            .padding(.top, 20)
                    }
                    Spacer()
                }
            }
        }
    }

    func login() {
        if let user = userData.currentUser {
            if user.username == username && user.password == password {
                isLoggedIn = true
            } else {
                showAlert = true
            }
        }
    }
}

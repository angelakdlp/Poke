import SwiftUI

struct StartPage: View {
    @StateObject var userData = UserData()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 30/255, green: 30/255, blue: 30/255)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    Image("Poke")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 300)
                    Spacer()
                    NavigationLink(destination: SignUpPage(userData: userData)) {
                        Text("Sign Up")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                    Divider()
                        .background(Color.white)
                        .frame(width: 150, height: 25)
                    NavigationLink(destination: LoginPage(userData: userData)) {
                        Text("Log In")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                    Spacer()
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct StartPage_Previews: PreviewProvider {
    static var previews: some View {
        StartPage()
    }
}

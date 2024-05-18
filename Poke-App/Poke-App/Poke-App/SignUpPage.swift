import SwiftUI

struct SignUpPage: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var dob = Date()
    @State private var sex = ""
    @State private var username = ""
    @State private var password = ""
    @ObservedObject var userData: UserData
    
    let sexes = ["Sex", "Male", "Female", "Other"]
    
    @State private var isSignUpSuccess = false // Track if sign-up was successful
    
    var body: some View {
        ZStack {
            Color(red: 30/255, green: 30/255, blue: 30/255)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("Pokee")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 200)
                HStack {
                    TextField("First Name", text: $firstName)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                    
                    TextField("Last Name", text: $lastName)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                }
                .padding(.horizontal)
                
                DatePicker("Date of Birth", selection: $dob, displayedComponents: .date)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                Picker(selection: $sex, label: Text("Sex")) {
                    ForEach(sexes, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .padding(.horizontal)
                
                Spacer()
                Spacer()
                VStack {
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
                }
                
                Spacer()
                
                Button(action: signUp) {
                    Text("Sign Up Now")
                        .font(.title2)
                        .foregroundColor(.blue)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue.opacity(0.7))
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                .padding(.bottom)
                .alert(isPresented: $isSignUpSuccess) {
                    Alert(title: Text("Sign Up Successful"), message: Text("You can now log in."), dismissButton: .default(Text("OK")))
                }
                NavigationLink(destination: LoginPage(userData: userData), isActive: $isSignUpSuccess) {
                    EmptyView()
                }
            }
        }
    }
    
    func signUp() {
        let newUser = User(firstName: firstName, lastName: lastName, dob: dob, sex: sex, username: username, password: password)
        userData.signUp(user: newUser)
        isSignUpSuccess = true
    }
}

struct SignUpPage_Previews: PreviewProvider {
    static var previews: some View {
        SignUpPage(userData: UserData())
    }
}

//
//  SignInView.swift
//  DawaaiSwiftUi
//
//  Created by user3 on 23/02/24.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct SignInView: View {
    
    @State var usernameTitle : String = "Username"
    @State var passwordTitle : String = "Password"
    
    @State var username : String = ""
    @State var password : String = ""
    
    
    @Binding public var user : DawaaiUser
    @Binding public var isLoggedIn : Bool;
    
    
    func usernameFromEmail(_ email: String) -> String? {
      guard let atIndex = email.firstIndex(of: "@") else { return nil }
      return String(email[..<atIndex]) // Slice up to, but not including "@"
    }


    func login() {
        print("trying auth")
        print(username,password)
        Auth.auth().signIn(withEmail: username, password: password ) { (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
            } else {
                print("success")
                print(String(result!.user.uid))
                user = DawaaiUser(email: result!.user.email!, uid: result!.user.uid, photo: result!.user.photoURL , username: usernameFromEmail(result!.user.email!));
                isLoggedIn=true;
            }
        }
        }
    
    var body: some View {
        ZStack {
            Color("bgColor")
                .ignoresSafeArea()
            VStack{
                Text("Welcome Back !").font(.largeTitle).fontWeight(.bold).padding(.bottom,42)
                VStack(spacing:16.0){
                    InputFieldView(data: $username, title: usernameTitle).autocorrectionDisabled()
                    InputFieldView(data: $password, title: passwordTitle).autocorrectionDisabled()
                }.padding(.bottom,25)
                Button(action: {
                    login()
                }) {
                    Text("Sign In")
                        .fontWeight(.heavy)
                        .font(.title3)
                        .frame(width:300)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color("boColor"))
                        .cornerRadius(40)
                }
                HStack {
                    Spacer().frame(maxWidth: 160)
                    Text("Forgot Password?")
                        .fontWeight(.light)
                        .foregroundColor(Color.blue)
                        .underline()
                }.padding(.top, 20)
                VStack{
                    Text(" or sign in with").font(.title3)
                    HStack{
                        Button(action: {
                                   
                               }) {
                                   Image("apple")
                                       .resizable()
                                       .aspectRatio(contentMode: .fit)
                                       .frame(width: 55, height: 55)
                                       .foregroundColor(.black)
                               }
                               .padding(.horizontal)
                        Button(action: {
                                   login()
                               }) {
                                   Image("google")
                                       .resizable()
                                       .aspectRatio(contentMode: .fit)
                                       .frame(width: 55, height: 55)
                                       .foregroundColor(.black)
                               }
                               .padding(.horizontal)
                        
                        
                    }
                }.padding(.top,30)
               
//                VStack{
//                   
//                    Text("Don't have an account? Create one !")
//                }.frame(alignment: .bottom)
                
            }
        }
    }
}
//#Preview {
//    SignInView()
//}

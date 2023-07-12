//
//  SplashScreenView.swift
//  splashScreen
//
//  Created by Chihiro Asanoma on 2023/07/11.
//

import SwiftUI

struct SplashScreenView: View {
    
    @State var isActive: Bool = false
    @State private var size = 0.7
    @State private var opacity = 0.4
    
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            VStack{
                Image("bart")
                Text("Welcome to The Simpsons")
                    .font(.system(size: 35))
                    .foregroundColor(.black)
                    .opacity(0.6)
            }
            .scaleEffect(size)
            .opacity(opacity)
            .onAppear{
                withAnimation(.easeIn(duration: 1.0)){
                    self.size = 1.0
                    self.opacity = 1.0
                }
            }
            .onAppear{
                self.onAppear()
            }
        }
    }
}

extension SplashScreenView {
    func onAppear(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            withAnimation {
                self.isActive = true
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}

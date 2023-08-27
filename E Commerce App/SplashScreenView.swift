//
//  ContentView.swift
//  E Commerce App
//
//  Created by Olsera on 19/08/23.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            HomeView()
        } else {
            VStack{
                VStack{
                    Image(systemName: "hare.fill")
                        .font(.system(size: 80))
                        .foregroundColor(.blue)
                    Text("Make a Wist")
                        .font(Font.custom("Helvetica-Bold", size: 26))
                        .foregroundColor(.black)
                        .padding(20)
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.2)){
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                    withAnimation(){
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}

//
//  ContentView.swift
//  SwiftUICombineAndData
//
//  Created by Елена Русских on 2023-09-05.
//

import SwiftUI

struct ContentView: View {
  @State private var contentOffset = CGFloat(0)
  var body: some View {
    NavigationView {
      ZStack(alignment: .top) {
        Color.primaryBackground
          .edgesIgnoringSafeArea(.all)
        TrackableScrollView { offset in
          contentOffset = offset.y
        } content: {
          Text("Hello, world!")
            .foregroundColor(.white)
            .padding()
        }
        Color.secondaryBackground
          .opacity(contentOffset < -16 ? 1 : 0)
          .animation(.easeIn)
          .ignoresSafeArea()
          .frame(height: 0)
      }
      .frame(maxHeight: .infinity, alignment: .top)
      .navigationBarHidden(true)
    }
    .navigationViewStyle(StackNavigationViewStyle())
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

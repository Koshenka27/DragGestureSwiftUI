//
//  ContentView.swift
//  DragGestureDemo
//
//  Created by Logan Koshenka on 5/30/21.
//

import SwiftUI

struct ContentView: View {
    @State var isDragging = false
    @State var position = CGSize.zero
    
    var body: some View {
        ZStack {
            Color(isDragging ? .gray : .white)
            
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: 250, height: 200)
                .offset(x: position.width, y: position.height)
                .foregroundColor(.blue)
                .animation(.linear)
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            position = value.translation
                            isDragging = true
                        })
                        .onEnded({ value in
                            position = .zero
                            isDragging = false
                        })
            )
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

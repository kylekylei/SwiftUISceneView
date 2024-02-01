//
//  ContentView.swift
//  SwiftUI SceneView
//
//  Created by admin on 2024/2/1.
//

import SwiftUI

struct ContentView: View {
    @State private var appearance: Appearance = .light
    @Namespace var appearanceTransition
    @State private var showSettings = true
    
    var body: some View {
        ZStack {
            Color(appearance.background)
                .ignoresSafeArea(.all)
            
            switch appearance {
            case .light:
                LightView(background: appearance.background)
                    .transition(.move(edge: .bottom).combined(with: .scale).combined(with: .opacity))
            case .dark:
                DarkView(background: appearance.background)
                    .transition(.move(edge: .top).combined(with: .scale).combined(with: .opacity))
            }
        }
        .onTapGesture {
            withAnimation {
                showSettings.toggle()
            }
        }
        
        .sheet(isPresented: $showSettings) {
            VStack(alignment: .leading) {
                Text("Appearance")
                    .font(.title)
                    .fontWeight(.semibold)
                    .opacity(0.87)
                    .padding()
   
                ColorSchemeRow()
                    .padding(.vertical, 64)
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .presentationCornerRadius(24)
            .presentationBackground(.ultraThinMaterial)
            .presentationDetents([.medium])
            .presentationBackgroundInteraction(.enabled)
            .preferredColorScheme(appearance.scheme)
            
        }
    
    }
    
    func ColorSchemeRow() -> some View {
        VStack(alignment: .leading, spacing: 12) {
            ForEach(Appearance.allCases) { scheme in
                Text(scheme.rawValue.capitalized)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(alignment: .leading) {
                        if scheme == appearance {
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .foregroundColor(.yellow.opacity(0.3))
                                .matchedGeometryEffect(id: "appearance", in: appearanceTransition)
                        }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        withAnimation(.spring) {
                            appearance = scheme
                        }
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}

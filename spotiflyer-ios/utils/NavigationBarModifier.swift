//
//  NavigationBarModifier.swift
//  spotiflyer-ios
//
//  Created by Shabinder Singh on 23/04/21.
//

import Foundation
import SwiftUI

struct NavigationBarModifier: ViewModifier {

    var backgroundColor: UIColor?
    var titleColor: UIColor?

    init(
        backgroundColor: UIColor?,
        titleColor: UIColor? = .white
    ) {
        self.backgroundColor = backgroundColor
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithTransparentBackground()
        coloredAppearance.backgroundColor = backgroundColor
        coloredAppearance.titleTextAttributes = [.foregroundColor: titleColor ?? .white]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: titleColor ?? .white]

        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    }

    func body(content: Content) -> some View {
        ZStack{
            VStack {
                GeometryReader { geometry in
                    Color(self.backgroundColor ?? .clear)
                        .frame(height: geometry.safeAreaInsets.top)
                        .edgesIgnoringSafeArea(.top)
                        
                    Spacer()
                }
            }
            VStack {
                GeometryReader { geometry in
                    LinearGradient(gradient: Gradient(colors: [Color("PrimaryDarkColor").opacity(0.7), Color(.clear)]), startPoint: .top, endPoint: .bottom)
                        .frame(height: geometry.size.height * 0.45)
                        .edgesIgnoringSafeArea(.top)
                    Spacer()
                }
            }
            content
        }
    }
}

extension View {
    func navigationBarColor(backgroundColor: UIColor?, titleColor: UIColor?) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor, titleColor: titleColor))
    }
}

struct NavBarModifier_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            MainScreen()
                .previewDevice("iPhone 12")
        }
    }
}


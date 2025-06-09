//
//  SpotifyCloneApp.swift
//  SpotifyClone
//
//  Created by Henok_Cheklie on 25/02/2025.
//

import SwiftUI
import SwiftfulRouting
import UIKit

@main
struct SpotifyCloneApp: App {
    var body: some Scene {
        WindowGroup {
            RouterView { _ in
                ContentView()
            }
        }
    }
}

// Custom UINavigationController subclass
class CustomNavigationController: UINavigationController, UIGestureRecognizerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}




//extension UINavigationController: UIGestureRecognizerDelegate {
//     override open func viewDidLoad(){
//         super.viewDidLoad()
//         interactivePopGestureRecognizer?.delegate = self
//    }
//    public func gestureRecognitionShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
//        return viewControllers.count > 1
//    }
//}

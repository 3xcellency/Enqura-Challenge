//
//  AppDelegate.swift
//  Enqura Challenge
//
//  Created by Ozan on 8.03.2023.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import RxSwift
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var appCoordinator : AppCoordinator!
    private var disposeBag  = DisposeBag()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        self.window = UIWindow()
        window?.overrideUserInterfaceStyle = .light
        appCoordinator = AppCoordinator(window: self.window!)
        appCoordinator.start().subscribe().disposed(by: disposeBag)
        return true
    }
}


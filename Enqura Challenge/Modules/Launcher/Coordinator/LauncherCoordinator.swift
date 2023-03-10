//
//  LauncherCoordinator.swift
//  Enqura Challenge
//
//  Created by Ozan on 9.03.2023.
//
import UIKit
import RxSwift

class LauncherCoordinator: ReactiveCoordinator<Void> {
    
    private let rootViewController: UIViewController
    
    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }
    
    override func start() -> Observable<Void> {
        let vc = rootViewController as! LauncherVC
        let vm = MainVM()
        vc.viewModel = vm
        
        vm.goToMainVC.subscribe  { _ in
         _ = self.coordinate(to: MainCoordinator(rootViewController: vc))
        }.disposed(by: disposeBag)
 
        return  Observable.never()
    }
}

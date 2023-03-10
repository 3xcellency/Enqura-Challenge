//
//  BaseVC.swift
//  Enqura Challenge
//
//  Created by Ozan on 8.03.2023.
//
import UIKit
import RxSwift
class BaseVC<T>: UIViewController where T : BaseVM {
    var viewModel : T?
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.showLoading.subscribe(onNext: {(isLoading) in
            isLoading ? self.startIndicatingActivity() :  self.stopIndicatingActivity()
        }).disposed(by: disposeBag)
        viewModel?.error.subscribe(onNext : {(data) in
            let alert = UIAlertController(title: "Hata", message: data, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
            self.present(alert, animated: true)
        }).disposed(by: disposeBag)
    }
    
    func showMessage(withTitle _title: String? = "Enqura",
                     withMessage _message: String,
                     buttonTitle: String? = "Ok",
                     callBack: (()->())? = nil) {
        
        let alert = UIAlertController(title: _title!,
                                      message: _message,
                                      preferredStyle: .alert)
        
        let cancelAction:UIAlertAction!
        if let cb = callBack{
            cancelAction = UIAlertAction(title: buttonTitle!,
                                         style: .destructive,
                                         handler: { (action) in
                cb()
            })
        }
        else{
            cancelAction = UIAlertAction(title: buttonTitle!,
                                         style: .destructive)
        }
        
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
}

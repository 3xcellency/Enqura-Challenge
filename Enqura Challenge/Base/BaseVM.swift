//
//  BaseVM.swift
//  Enqura Challenge
//
//  Created by Ozan on 8.03.2023.
//
import RxSwift

class BaseVM {
    let showLoading = BehaviorSubject<Bool>(value: false)
    var error = PublishSubject<String>()
}

//
//  TableView+Extension.swift
//  Enqura Challenge
//
//  Created by Ozan on 9.03.2023.
//

import UIKit

extension UITableView {
    
    func registerCell<T:UITableViewCell>(cell:T.Type) {
        let nib = UINib(nibName: T.className, bundle: nil)
        register(nib, forCellReuseIdentifier: T.className)
    }
    
    func cellWithIdentifier<T:UITableViewCell>(cell:T.Type) -> T {
        let genericCell = self.dequeueReusableCell(withIdentifier: T.className) as! T
        return genericCell
    }
}

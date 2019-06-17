//
//  UIKit.swift
//  swiftForever
//
//  Created by Zeynep Seyhan on 6/16/19.
//  Copyright © 2019 farukgozoglu. All rights reserved.
//

import UIKit

protocol ResuableView : class{
    static var defaultReuseIdetifier : String{get}
}

extension ResuableView where Self:UIView{
    static var defaultReuseIdetifier:String{
        return NSStringFromClass(self)
    }
}

extension UITableViewCell: ResuableView{}

extension UITableView{
    func register<T: UITableViewCell>(_: T.Type){
        register(T.self, forCellReuseIdentifier: T.defaultReuseIdetifier)
    }
    
    func dequeueReusableCell<T:UITableViewCell>(_ type:T.Type, forIndexPath indexPath:IndexPath) -> T{
        register(type)
        guard let cell = dequeueReusableCell(withIdentifier: type.defaultReuseIdetifier, for: indexPath) as? T else{
            fatalError("COULD NOT DEQUEUE CELL WITH IDENTIFIER :\(type.defaultReuseIdetifier)")
        }
        return cell
    }
}

extension UIView{
    open func add(subview:UIView, createConstraints: (_ view:UIView, _ parent: UIView) -> [NSLayoutConstraint]){
        addSubview(subview)
        
        subview.activate(constraints: createConstraints(subview,self))
    }
    
    open func activate(constraints: [NSLayoutConstraint]){
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
    }
    
}


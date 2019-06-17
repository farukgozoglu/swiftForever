//
//  bottomBox.swift
//  swiftForever
//
//  Created by Zeynep Seyhan on 6/17/19.
//  Copyright © 2019 farukgozoglu. All rights reserved.
//

import UIKit

 class bottomBox : UIView{
    override init(frame:CGRect){
        super.init(frame:frame)
        
        setupView()
    }
    
    private let square : UIView = {
        let square = UIView(frame:CGRect(x: 10, y: 60, width: 100, height: 100))
        //square.backgroundColor = .orange
        return square
    }()
    
    private func setupView(){
        square.backgroundColor = .green
        configureConstraints()
    }
    private func configureConstraints(){
        let constraints = [
            heightAnchor.constraint(equalToConstant: 50),
        widthAnchor.constraint(equalToConstant: 50)]
        
        NSLayoutConstraint.activate(constraints)
        
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

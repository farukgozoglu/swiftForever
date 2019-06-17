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
    private func setupView(){
        backgroundColor = .red
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

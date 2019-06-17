//
//  TableHeaderView.swift
//  swiftForever
//
//  Created by Zeynep Seyhan on 6/16/19.
//  Copyright © 2019 farukgozoglu. All rights reserved.
//

import UIKit

class TableHeaderView : UIView{
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Master Swift5"
        label.adjustsFontSizeToFitWidth = true
        label.font = label.font.withSize(30)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        return label
        
    }()
    
    private let square : UIView{
        let square = UIView()
        squ
    }
    
    override init(frame:CGRect){
        super.init(frame:frame)
        setupView()
        let square = UIView(frame:CGRect(x: 10, y: 60, width: 100, height: 100))
        square.backgroundColor = .orange
        addSubview(square)
    }
    
    private func setupView(){
        backgroundColor = .systemBlue
        configureConstraints()
    }
    
    private func configureConstraints(){
        add(subview: titleLabel) { (v, p) -> [NSLayoutConstraint] in
            [v.centerYAnchor.constraint(equalTo: p.centerYAnchor),
             v.leadingAnchor.constraint(equalTo: p.leadingAnchor, constant: 30),
             v.trailingAnchor.constraint(equalTo: p.trailingAnchor, constant: -30)
             ]
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

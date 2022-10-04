//
//  View.swift
//  Daaily qoutes app
//
//  Created by Nikola Jeremic on 3.10.22..
//

import Foundation
import SnapKit
import Lottie


    class MainView: UIView {
        
        init() {
            super.init(frame: UIScreen.main.bounds)
                
        self.addSubview(container2)
        self.addSubview(container)
       
        
        container2.snp.remakeConstraints { make in
            make.width.equalTo(340)
            make.height.equalTo(230)
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        container.snp.remakeConstraints { make in
            make.width.equalTo(330)
            make.height.equalTo(220)
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
      
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    lazy var container: UIView = {
        let contish: UIView = UIView()
        contish.backgroundColor = .black
        contish.layer.cornerRadius = contish.frame.width / 2
        contish.layer.cornerRadius = 20
       return contish
    }()
    lazy var container2: UIView = {
        let contish: UIView = UIView()
        contish.backgroundColor = .white
        contish.layer.shadowColor = UIColor.white.cgColor
        contish.layer.shadowOffset = CGSize(width: 0.5, height: 0.0)
        contish.layer.masksToBounds = false
        contish.layer.shadowRadius = 20.0
        contish.layer.shadowOpacity = 0.3
        contish.layer.cornerRadius = contish.frame.width
        contish.layer.borderColor = UIColor.white.cgColor
        contish.layer.borderWidth = 2.0
        contish.layer.cornerRadius = 20
        
       return contish
    }()
    
    lazy var logoView: UIImageView = {
        let contish: UIImageView = UIImageView()
        contish.layer.shadowColor = UIColor.white.cgColor
        contish.layer.shadowOffset = CGSize(width: 0.5, height: 0.0)
        contish.layer.masksToBounds = false
        contish.layer.shadowRadius = 20.0
        contish.layer.shadowOpacity = 0.3
        contish.layer.cornerRadius = contish.frame.width
       
        contish.layer.cornerRadius = 20
       return contish
    }()
    
    }


//
//  ViewController.swift
//  Daaily qoutes app
//
//  Created by Nikola Jeremic on 3.10.22..
//

import UIKit
import SnapKit
import Lottie

class ViewController: UIViewController {

   //MARK: - Api call
    @objc func factClick(clickMe: UIButton) {
        
        UIView.animate(withDuration: 0.1,
            animations: {
                self.button.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            },
            completion: { _ in
                UIView.animate(withDuration: 0.1) {
                    self.button.transform = CGAffineTransform.identity
                }
            })
        
        var request = URLRequest(url: URL(string: "https://catfact.ninja/fact")!)
        request.httpMethod = "GET"

        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            print(response!)
            do {
                if let data = data {
                    let myObject = try JSONDecoder().decode(CatFact.self, from: data)
                    DispatchQueue.main.async {
                        self.factLabel.text = myObject.fact
                        
                    }
                }
            } catch {
                print("error")
            }
        })

        task.resume()
    }
    //MARK: - Constraints
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        view.addSubview(viewV)
        
        view.addSubview(animationView)
        viewV.addSubview(factLabel)
        factLabel.numberOfLines = 0
        setupAnimation()
        
        
        
        factLabel.snp.remakeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(-40)
            make.right.equalToSuperview().offset(40)
            
        }
        
        viewV.snp.remakeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.height.equalTo(200)
            
        }
        
        button.snp.remakeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(300)
        }
    }
    
    
    //MARK: - Animation View/Button
    
    let animationView = AnimationView()
    
    func setupAnimation() {

        animationView.frame = CGRect(x: 100, y: 50, width: 200, height: 200)
        animationView.animation = Animation.named("cat2")
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
    }
    
    
    lazy var viewV: MainView = {
        let lbl: MainView = MainView()
        return lbl
    }()
    
     lazy var factLabel: UILabel = {
         let lbl: UILabel = UILabel()
         lbl.textColor = .white
         return lbl
     }()
   
    lazy var button: UIButton = {
        let btn: UIButton = UIButton()
        btn.backgroundColor = .black
        btn.setTitle("Get a Daily Qoute", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.shadowColor = UIColor.white.cgColor
        btn.layer.shadowOffset = CGSize(width: 0.5, height: 0.0)
        btn.layer.masksToBounds = false
        btn.layer.shadowRadius = 20.0
        btn.layer.shadowOpacity = 0.3
        btn.layer.cornerRadius = btn.frame.width
        btn.layer.borderColor = UIColor.white.cgColor
        btn.layer.borderWidth = 2.0
        btn.layer.cornerRadius = 20
        btn.addTarget(self, action: #selector(factClick), for: .touchUpInside)
        return btn
    }()
    
    
}

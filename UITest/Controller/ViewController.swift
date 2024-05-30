//
//  ViewController.swift
//  UITest
//
//  Created by 박승환 on 5/27/24.
//

import UIKit

class ViewController: UIViewController {

    // 박승환
    @IBOutlet weak var parkprofile: UIButton!
    @IBOutlet weak var parkbackground: UIView!
      
    // 김광현
    @IBOutlet weak var kimprofile: UIButton!
    @IBOutlet weak var kimbackground: UIView!
      
    // 김동현
    @IBOutlet weak var kimdhprofile: UIButton!
    @IBOutlet weak var kimdhbackground: UIView!
    
    // 이주희
    @IBOutlet weak var leejhprofile: UIButton!
    @IBOutlet weak var leejhbackground: UIView!
      
    // 최건
    @IBOutlet weak var geonprofile: UIButton!
    @IBOutlet weak var geonbackground: UIView!
    // 유민우
    @IBOutlet weak var minprofile: UIButton!
    @IBOutlet weak var minbackground: UIView!
    
    
    // 개인 정보를 저장할 클래스
    let info = Infomation()
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // 정보 세팅
        info.setting()
        
        setUP(parkprofile, parkbackground, info.names[2])
        setUP(kimprofile, kimbackground, info.names[1])
        setUP(kimdhprofile, kimdhbackground, info.names[0])
        setUP(leejhprofile, leejhbackground, info.names[4])
        setUP(geonprofile, geonbackground, info.names[5])
        setUP(minprofile, minbackground, info.names[3])
        
    }
    
    func setUP(_ imageView: UIButton, _ view:UIView, _ name: String) {
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner)
        imageView.setTitle(name, for: .normal)
        imageView.addTarget(self, action: #selector(triggerSegue(sender: )), for: .touchUpInside)
        
        view.layer.cornerRadius = 10
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.masksToBounds = false
        view.layer.shadowOffset = CGSize(width: 3, height: 3)
        view.layer.shadowRadius = 3
        view.layer.shadowOpacity = 0.5
    }
    
    
    
    
//    func createButton(_ name: String) -> UIButton {
//        let button = CustomButton()
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle(name, for: .normal)
//        button.setTitleColor(.black, for: .normal)
//        
//        let image = UIImage(named: info.images[name]!)?.withRenderingMode(.alwaysOriginal)
//        button.setImage(image, for: .normal)
//        button.imageView?.contentMode = .scaleAspectFill
//
//        // imageView가 버튼 영역을 채우도록 함
//        button.imageView?.topAnchor.constraint(equalTo: button.topAnchor).isActive = true
//        button.imageView?.bottomAnchor.constraint(equalTo: button.bottomAnchor).isActive = true
//        button.imageView?.leadingAnchor.constraint(equalTo: button.leadingAnchor).isActive = true
//        button.imageView?.trailingAnchor.constraint(equalTo: button.trailingAnchor).isActive = true
//        
//        button.addTarget(self, action: #selector(triggerSegue(sender:)), for: .touchUpInside)
//        
//        return button
//    }

    // 데이터 전송을 위한 함수 override
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let button = sender as? UIButton, let title = button.titleLabel?.text {
                print(title)
                if let destinatiorVC = segue.destination as? DetailViewController {
                    let infomation = info.findUser(title)
                    destinatiorVC.info = infomation
                }
            }
        }
    }
    
    // 화면전환 메서드
    @objc func triggerSegue(sender: UIButton) {
        performSegue(withIdentifier: "showDetail", sender: sender)
    }

}

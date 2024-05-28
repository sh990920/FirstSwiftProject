//
//  DetailViewController.swift
//  UITest
//
//  Created by 박승환 on 5/27/24.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController {
    
    var info: Info?
    
    // 프로필 사진
    @IBOutlet weak var imageView: UIImageView!
    // 이름 Label
    @IBOutlet weak var name: UILabel!
    // 나이 Label
    @IBOutlet weak var age: UILabel!
    // 지역 Label
    @IBOutlet weak var area: UILabel!
    // MBTI Label
    @IBOutlet weak var MBTI: UILabel!
    // 역할 Label
    @IBOutlet weak var position: UILabel!
    // 한마디 Label(자기 소개로 변경 가능)
    @IBOutlet weak var introduce: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = "이름 : \(info!.name)"
        age.text = "나이 : \(info!.age)"
        area.text = "지역 : \(info!.area)"
        MBTI.text = "MBTI : \(info!.MBTI)"
        position.text = "역할 : \(info!.position)"
        introduce.text = "한마디 : \(info!.introduce)"
        let image = UIImage(named: info!.name)
        imageView.image = image
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
    }

    @IBAction func goToBlog(_ sender: Any) {
        // 실제 사파리 어플을 통해서 보여주기
//        if let url = URL(string: info!.blogURL) {
//            //UIApplication.shared.open(url, options: [:])
//        }
        // 컨트롤러 객체를 생성해서 화면 보여주기
        let url = URL(string: info!.blogURL)
        let safariViewController = SFSafariViewController(url: url!)
        present(safariViewController, animated: true)
    }
}

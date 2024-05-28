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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(named: info!.name)
        imageView.image = image
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        let stackView = createInfoStackView()
        
        view.addSubview(stackView)
        
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        stackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
    }
    
    
    func createInfoStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        let nameLable = createLable("name")
        let ageLabel = createLable("age")
        let areaLable = createLable("area")
        let MBTILable = createLable("MBTI")
        let positionLabel = createLable("position")
        let introduceLabel = createLable("introduce")
        let buttonStackView = createButtonStackView()
        
        stackView.addArrangedSubview(nameLable)
        stackView.addArrangedSubview(ageLabel)
        stackView.addArrangedSubview(areaLable)
        stackView.addArrangedSubview(MBTILable)
        stackView.addArrangedSubview(positionLabel)
        stackView.addArrangedSubview(introduceLabel)
        stackView.addArrangedSubview(buttonStackView)
        
        return stackView
    }
    
    func createButtonStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        let gitButton = createButton("git")
        let blogButton = createButton("blog")
        
        stackView.addArrangedSubview(gitButton)
        stackView.addArrangedSubview(blogButton)
        
        return stackView
    }
    
    func createButton(_ platform: String) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.black, for: .normal)
        switch(platform) {
        case "git":
            button.setTitle("git", for: .normal)
        case "blog":
            button.setTitle("blog", for: .normal)
        default:
            button.setTitle("nil", for: .normal)
        }
        button.addTarget(self, action: #selector(didTabButton), for: .touchUpInside)
        return button
    }
    
    func createLable(_ type: String) -> UILabel {
        let label = UILabel()
        switch(type) {
        case "name":
            if let name = info?.name {
                label.text = "이름 : \(name)"
            }
        case "age":
            if let age = info?.age {
                label.text = "나이 : \(age)"
            }
        case "area":
            if let area = info?.area {
                label.text = "사는 곳 : \(area)"
            }
        case "MBTI":
            if let mbti = info?.MBTI {
                label.text = "MBTI : \(mbti)"
            }
        case "position":
            if let position = info?.position {
                label.text = "역할 : \(position)"
            }
        case "introduce":
            if let introduce = info?.introduce {
                label.text = "자기소개 : \(introduce)"
            }
        default:
            label.text = "nil"
        }
        label.textAlignment = .center
        
        return label
    }
    
    // 나중에 tag 로 수정 예정
    @objc func didTabButton(_ sender: UIButton) {
        if let buttonText = sender.titleLabel?.text {
            switch(buttonText) {
            case "git":
                let url = info?.gitHubURL
                goToPlatform(url!)
            case "blog":
                let url = info?.blogURL
                goToPlatform(url!)
            default:
                return
            }
        }
        
    }
    
    func goToPlatform(_ url: String) {
        let url = URL(string: url)
        let safariViewController = SFSafariViewController(url: url!)
        present(safariViewController, animated: true)
    }
}

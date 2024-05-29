//
//  ViewController.swift
//  UITest
//
//  Created by 박승환 on 5/27/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleOutlet: UILabel!
    // 버튼을 만들 때 사용할 count
    var count = 0
    // 개인 정보를 저장할 클래스
    let info = Infomation()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 정보 세팅
        info.setting()
        
        view.addSubview(stackView)

        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        stackView.topAnchor.constraint(equalTo: titleOutlet.bottomAnchor, constant: 30).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        
        for _ in 0..<3 {
            let buttonStackView = createButtonStackView()
            stackView.addArrangedSubview(buttonStackView)
        }
    }
    
    func createButtonStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        for i in count..<count+2 {
            // 버튼의 이름 설정
//            let name = info.peoples[i].name
            let button = createButtonTitle(info.peoples[i].name)
            stackView.addArrangedSubview(button)
            count += 1
        }
        return stackView
    }
    
    func createButtonTitle(_ name: String) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 1
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let button = createButton(name)
        let label = UILabel()
        
        label.text = name
        label.textAlignment = .center
        stackView.addArrangedSubview(button)
        stackView.addArrangedSubview(label)
        
        button.heightAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.75).isActive = true
        button.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.75).isActive = true
        label.heightAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.25).isActive = true
        return stackView
    }
    
    func createButton(_ name: String) -> UIButton {
        let button = CustomButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(name, for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        let image = UIImage(named: info.images[name]!)?.withRenderingMode(.alwaysOriginal)
        button.setImage(image, for: .normal)
        button.imageView?.contentMode = .scaleAspectFill

        // imageView가 버튼 영역을 채우도록 함
        button.imageView?.topAnchor.constraint(equalTo: button.topAnchor).isActive = true
        button.imageView?.bottomAnchor.constraint(equalTo: button.bottomAnchor).isActive = true
        button.imageView?.leadingAnchor.constraint(equalTo: button.leadingAnchor).isActive = true
        button.imageView?.trailingAnchor.constraint(equalTo: button.trailingAnchor).isActive = true
        
        button.addTarget(self, action: #selector(triggerSegue(sender:)), for: .touchUpInside)
        
        return button
    }

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

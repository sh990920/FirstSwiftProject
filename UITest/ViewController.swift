//
//  ViewController.swift
//  UITest
//
//  Created by 박승환 on 5/27/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleOutlet: UILabel!
    let buttonTitles = ["1", "2", "3", "4", "5", "6"]
    var count = 0
    
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
        
        view.addSubview(stackView)
        // Do any additional setup after loading the view.
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        stackView.topAnchor.constraint(equalTo: titleOutlet.bottomAnchor, constant: 30).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        
        for _ in 0..<3 {
            let buttonStackView = createButtonStackView()
            stackView.addArrangedSubview(buttonStackView)
        }
    }
    
    
//    // 다른 페이지로 이동할 메서드
//    @IBAction func ChangeView(_ sender: Any) {
//        guard let detailViewController = self.storyboard?.instantiateViewController(withIdentifier: "detailView") as? DetailViewController else { return }
//        detailViewController.modalTransitionStyle = .coverVertical
//        detailViewController.modalPresentationStyle = .fullScreen
//        self.present(detailViewController, animated: true, completion: nil)
//    }
    
    func createButtonStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        for i in count..<count+2 {
            let name = buttonTitles[i]
            let button = createButtonTitle(name)
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
        
//        let image = UIImage(named: "testImage")?.withRenderingMode(.alwaysOriginal)
//        button.setImage(image, for: .normal)
//        button.imageView?.contentMode = .scaleAspectFill
        
        let image = UIImage(named: "testImage")?.withRenderingMode(.alwaysOriginal)
        button.setImage(image, for: .normal)
        button.imageView?.contentMode = .scaleAspectFill

        // imageView가 버튼 영역을 채우도록 함
        button.imageView?.topAnchor.constraint(equalTo: button.topAnchor).isActive = true
        button.imageView?.bottomAnchor.constraint(equalTo: button.bottomAnchor).isActive = true
        button.imageView?.leadingAnchor.constraint(equalTo: button.leadingAnchor).isActive = true
        button.imageView?.trailingAnchor.constraint(equalTo: button.trailingAnchor).isActive = true
        
        
        return button
    }

}




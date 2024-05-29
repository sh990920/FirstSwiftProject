//
//  EditViewController.swift
//  UITest
//
//  Created by 김동현 on 5/28/24.
//

import UIKit

protocol EditViewContreollerDelegate: AnyObject {
    func didSaveInfo(_ info: Info)
}

class EditViewController: UIViewController {
    
    weak var delegate: EditViewContreollerDelegate?
    var info: Info?
    
    // 프로필 사진
    @IBOutlet weak var imageView: UIImageView!
    // 이름 TextField
    @IBOutlet weak var name: UITextField!
    // 나이 TextField
    @IBOutlet weak var age: UITextField!
    // 지역 TextField
    @IBOutlet weak var area: UITextField!
    // MBTI TextField
    @IBOutlet weak var MBTI: UITextField!
    // 역할 TextField
    @IBOutlet weak var position: UITextField!
    // 한마디 TextField(자기 소개로 변경 가능)
    @IBOutlet weak var introduce: UITextField!
    // 블로그 주소 TextField
    @IBOutlet weak var blog: UITextField!
    // 깃허브 주소 TextField
    @IBOutlet weak var github: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let info = info {
            
            name.text = "\(info.name)"
            age.text = "\(info.age)"
            area.text = "\(info.area)"
            MBTI.text = "\(info.MBTI)"
            position.text = "\(info.position)"
            introduce.text = "\(info.introduce)"
            blog.text = "\(info.blogURL)"
            github.text = "\(info.gitHubURL)"
        }
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        guard let name = name.text,
              let age = Int(age.text ?? ""),
              let area = area.text,
              let MBTI = MBTI.text,
              let position = position.text,
              let introduce = introduce.text,
              let blogURL = blog.text,
              let gitHubURL = github.text else {
            return
        }
        
        let updatedInfo = Info(name: name, age: age, area: area, MBTI: MBTI, position: position, introduce: introduce, blogURL: blogURL, gitHubURL: gitHubURL)
        
        delegate?.didSaveInfo(updatedInfo)
        navigationController?.popViewController(animated: true)

    }

}

//
//  DetailViewController.swift
//  UITest
//
//  Created by 박승환 on 5/27/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    var info: Info?
    
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
    }

}

//
//  DetailViewController.swift
//  UITest
//
//  Created by 박승환 on 5/27/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    var info: Info?
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var area: UILabel!
    @IBOutlet weak var MBTI: UILabel!
    @IBOutlet weak var position: UILabel!
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

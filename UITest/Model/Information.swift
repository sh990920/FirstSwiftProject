//
//  Information.swift
//  UITest
//
//  Created by 박승환 on 5/27/24.
//

import Foundation

struct Info {
    var name:String             // 이름
    var age:Int                 // 나이
    var area: String            // 사는곳
    var MBTI: String            // MBTI
    var position: String        // 역할
    var introduce: String       // 자기소개
    var blogURL: String         // 블로그 URL
    var gitHubURL: String       // 깃허브 URL
}

class Information {
    static let shared = Information()
    
    var peoples = Array<Info>()
    
    let names = []
    let ages = []
    let areas = []
    let MBTIs = []
    let positions = []
    let introduces = []
    let urls = []
    
    let gitHubURLs = []
    
    let images = []
    
    private init() {
        setting()
    }
    
    // 기본 세팅
    func setting() {
        if peoples.isEmpty {
            for i in 0..<6 {
                let people = Info(name: names[i], age: ages[i], area: areas[i], MBTI: MBTIs[i], position: positions[i], introduce: introduces[i], blogURL: urls[i], gitHubURL: gitHubURLs[i])
                peoples.append(people)
            }
        }
    }
    
    // 사람 검색
    func findUser(_ name: String) -> Info {
        var info: Info = Info(name: "nil", age: 0, area: "nil", MBTI: "nil", position: "nil", introduce: "nil", blogURL: "nil", gitHubURL: "nil")
        for i in peoples {
            if i.name == name {
                info = i
            }
        }
        return info
    }
    
    // 사람 정보 업데이트
    func updateUser(_ updatedInfo: Info) {
        if let index = peoples.firstIndex(where: { $0.name == updatedInfo.name }) {
            peoples[index] = updatedInfo
        }
    }

}

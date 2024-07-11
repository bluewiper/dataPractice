//
//  ViewController.swift
//  CoreDataPractice
//
//  Created by 단예진 on 7/10/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    //라벨 생성
    private let label: UILabel = {
        let label = UILabel()
        label.text = "포스트잇"
        label.font = .boldSystemFont(ofSize: 30)
        label.textColor = .black
        return label
    }()
    
    //텍스트뷰 생성
    private let textView: UITextView = {
        let textView = UITextView()
        textView.text = UserDefaults.standard.string(forKey: "memo")
        textView.layer.cornerRadius = 10
        textView.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        textView.font = .boldSystemFont(ofSize: 30 )
        return textView
    }()
    
    //적용하는 버튼 생성
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("적용", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.layer.cornerRadius = 10
        //button에 add Target
        button.addTarget(self, action: #selector(buttonTapped), for: .touchDown)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    private func configureUI() {
        
        //뷰 생성
        [label, textView, button]
            .forEach { view.addSubview($0) }
        
        //배경화면 색상
        view.backgroundColor = .white
        
        //라벨 오토레이아웃 제약 설정
        label.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.centerX.equalToSuperview()
        }
        //텍스트뷰 오토레이아웃 제약 설정
        textView.snp.makeConstraints {
            $0.top.equalTo(label.snp.bottom).offset(100)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(200)
        }
        //텍스트뷰 오토레이아웃 제약 설정
        button.snp.makeConstraints {
            $0.top.equalTo(textView.snp.bottom).offset(50)
            $0.width.equalTo(60)
            $0.height.equalTo(40)
            $0.centerX.equalToSuperview()
        }
    }
    
    //버튼 클릭했을 때 로직
    @objc
    private  func buttonTapped() {
        UserDefaults.standard.set(textView.text, forKey: "memo") //textView.text => 텍스트뷰안에 있는 현재 텍스트
        print("저장 완료")
    }
    
}


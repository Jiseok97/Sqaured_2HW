//
//  RegisterViewController.swift
//  jsApp
//
//  Created by 이지석 on 2021/07/07.
//

import UIKit

protocol titleProtocol{
    // 데이터를 넘기는 함수 원형만 !
    // 구현은 TableViewController에서 진행
    func dataSend(data: String)
}

class RegisterViewController: UIViewController {

    // delegate Prop
    var delegate : titleProtocol?
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var rgBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setRadius()
    }
    
    func setRadius() {
        rgBtn.layer.cornerRadius = 10
    }
    
    @IBAction func actBtn(_ sender: Any) {
        // 버튼이 눌렸을 때, 선언한 delegate의 dataSend에다가 tf의 txt 담기
        if let text = nameTF.text {
            delegate?.dataSend(data: text)
        }
        // delegate 처리가 끝나고 navigation Pop 처리
        self.navigationController?.popViewController(animated: true)
    }

}

//
//  KSUITextField.swift
//
//  Created by Kusuma Seta on 9/1/17.
//  Copyright © 2017 com.ework. All rights reserved.
//

import UIKit

enum KSTextFieldType {
    case password
    case text
    case email
    case phone
}

class KSUITextField: UITextField {
    var tfKey = ""
    var maxLength: Int = 24
    var isOptional: Bool = false
    var isEndOfForm: Bool = false
    
    var textFieldType: KSTextFieldType = {
       return KSTextFieldType.text
    }()
    
    var ivIndicator: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    var errLabel:UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.KlikQuickThin()
        label.textAlignment = .right
        label.textColor = UIColor.red
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupTarget()
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupKeyboard()
    }
    
    private func setupTarget(){
        addTarget(self, action: #selector(editingEnd), for:.editingDidEnd)
        addTarget(self, action: #selector(editingBegin), for:.editingDidBegin)
        addTarget(self, action: #selector(editingChanged), for: .editingChanged)
    }
    
    private func setupKeyboard(){
        switch textFieldType {
        case .password:
            self.isSecureTextEntry = true
            self.keyboardType = .default
            break;
        case .text:
            self.keyboardType = .default
            break;
        case .email:
            self.keyboardType = .emailAddress
            break;
        case .phone:
            self.keyboardType = .numberPad
            break;
        }
    }
    private func setupView(){
        if(self.isEndOfForm) {
            self.returnKeyType = .done
        }
        self.addSubview(errLabel)
        self.addSubview(ivIndicator)
        ivIndicator.anchor(topAnchor, left: nil, bottom: bottomAnchor, right: rightAnchor, topConstant: 8, leftConstant: 0, bottomConstant: 8, rightConstant: 8, widthConstant: 25, heightConstant: 25)
        errLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: ivIndicator.leftAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 8, widthConstant: 0, heightConstant: 0)
    }
    
    private func standartKQValidation() -> (String, Bool){
        if self.isOptional {
            return ("", true)
        }
        else{
            let value = self.text
            if value?.characters.count == 0 {
                return ("\(self.tfKey) tidak boleh kosong", false)
            }
            var flag = true
            switch textFieldType {
            case .password:
                flag = (value?.isValidPassword)!
                break;
            case .text:
                flag = !(value?.isEmpty)!
                break;
            case .email:
                flag = (value?.isValidEmail)!
                break;
            case .phone:
                flag = (value?.isValidPhone)!
                break;
            }
            let comment = (flag) ? "valid" : "\(self.tfKey) tidak valid"
            return (comment, flag)
        }
    }
    
    func editingBegin(sender: UITextField){
        self.reset()
    }

    func editingEnd(sender: UITextField){
        let validation : (String,Bool) = self.standartKQValidation()
        if  validation.1 == false {
            self.setError(withString: validation.0)
        }
        else{
            setSuccess()
            self.resignFirstResponder()
        }
    }
    
    func editingChanged(sender: UITextField) {
        guard let text = sender.text?.characters.prefix(maxLength) else { return }
        sender.text = String(text)
    }
    
    private func reset(){
        self.ivIndicator.image = UIImage()
        self.errLabel.text = ""
    }
    
    func setError(withString: String){
        self.ivIndicator.image = #imageLiteral(resourceName: "ic_error")
        self.errLabel.text = withString
    }
    
    func setSuccess(){
        self.ivIndicator.image = #imageLiteral(resourceName: "ic_success")
        self.errLabel.text = ""
    }

}

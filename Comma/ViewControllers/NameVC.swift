//
//  NameVC.swift
//  Comma
//
//  Created by myungsun on 2022/07/18.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit
import RxKeyboard

class NameVC: UIViewController {
    // UILabel
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    @IBOutlet weak var lengthLabel: UILabel!
    @IBOutlet weak var slashLabel: UILabel!
    @IBOutlet weak var maxLengthLabel: UILabel!
    
    // UITextField
    @IBOutlet weak var nameTextField: UITextField!
    
    // UIButton
    @IBOutlet weak var nextButton: UIButton!
    
    // Constants
    let TITLE_LABEL_FONT_SIZE: CGFloat = 24
    let SUB_TITLE_LABEL_FONT_SIZE: CGFloat = 16
    let NAME_TEXT_FIELD_PLACE_HOLDER = "이름을 입력해주세요."
    let NAME_TEXT_FIELD_FONT_SIZE: CGFloat = 20
    let BUTTON_RADIUS: CGFloat = 10
    let BUTTON_FONT_SIZE: CGFloat = 17
    
    // RxSwift
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        action()
    }
    
    private func initUI() {
        // UILabel
        configureLabels()
        
        // UITextField
        configureTextField()
        nameTextField.becomeFirstResponder()
        
        // UIButton
        configureButton()
    }
    
    private func action() {
        // UIButton
        nextButton.rx.tap
            .subscribe(onNext: { _ in
                // TODO: 화면 이동
                
            })
            .disposed(by: disposeBag)
        
        // UITextField
        nameTextField.rx.text.orEmpty
            .distinctUntilChanged()
            .subscribe(onNext: { changedText in
                self.configureButton()
                self.lengthLabel.text = String(self.nameTextField.text!.count)
            })
            .disposed(by: disposeBag)
        
        RxKeyboard.instance.visibleHeight
            .drive(onNext: { [unowned self] keyboardHeight in
                let height = keyboardHeight > 0 ? -keyboardHeight + view.safeAreaInsets.bottom - 10 : 0
                
                self.nextButton.snp.updateConstraints {
                    $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(height)
                }
                view.layoutIfNeeded()
            })
            .disposed(by: disposeBag)
    }
    
    private func configureLabels() {
        mainLabel.font = FontManager.shared.getAppleSDGothicNeoSemiBold(fontSize: TITLE_LABEL_FONT_SIZE)
        subLabel.font = FontManager.shared.getAppleSDGothicNeoRegular(fontSize: SUB_TITLE_LABEL_FONT_SIZE)
        subLabel.textColor = ColorManager.shared.getNameSubTitleColor()
        lengthLabel.font = FontManager.shared.getAppleSDGothicNeoRegular(fontSize: SUB_TITLE_LABEL_FONT_SIZE)
        slashLabel.font = FontManager.shared.getAppleSDGothicNeoRegular(fontSize: SUB_TITLE_LABEL_FONT_SIZE)
        maxLengthLabel.font = FontManager.shared.getAppleSDGothicNeoRegular(fontSize: SUB_TITLE_LABEL_FONT_SIZE)
    }
    
    private func configureTextField() {
        nameTextField.font = FontManager.shared.getAppleSDGothicNeoSemiBold(fontSize: NAME_TEXT_FIELD_FONT_SIZE)
        nameTextField.delegate = self
    }
    
    private func configureButton() {
        nextButton.layer.cornerRadius = BUTTON_RADIUS
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.titleLabel?.font = FontManager.shared.getAppleSDGothicNeoExtraBold(fontSize: BUTTON_FONT_SIZE)
        
        nextButton.isEnabled = !(nameTextField.text!.isEmpty)
        nextButton.backgroundColor = nextButton.isEnabled ? .black : ColorManager.shared.getDisableColor()
    }
    
    // 유저가 화면을 터치했을 때 호출되는 메서드
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 키보드를 내린다.
        self.view.endEditing(true)
    }
}

extension NameVC: UITextFieldDelegate {
    // 글자 수 제한
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let char = string.cString(using: String.Encoding.utf8) {
            let isBackSpace = strcmp(char, "\\b")
            if isBackSpace == -92 {
                return true
            }
        }
        guard textField.text!.count < 15 else { return false }
        return true
    }
}

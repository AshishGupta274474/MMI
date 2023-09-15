//
//  TaskRecordVC.swift
//  MMI
//
//  Created by ashish gupta on 28/08/23.
//

import UIKit

class TaskRecordVC: MMIBaseVC {
    
    private lazy var outercontainerView = UIView()
    
    lazy var containerView = UIView()
    lazy var buttonStackView = UIStackView()
    lazy var textView = UITextView()
    lazy var upperView = UIView()
    
    var bottomConstrant: NSLayoutConstraint!

    override func setUpView() {
        super.setUpView()
        // Keyboard stuff.
        NotificationCenter.default.addObserver(
               self,
               selector: #selector(self.keyboardWillShow),
               name: UIResponder.keyboardWillShowNotification,
               object: nil)

           NotificationCenter.default.addObserver(
               self,
               selector: #selector(self.keyboardWillHide),
               name: UIResponder.keyboardWillHideNotification,
               object: nil)
        
        textView.becomeFirstResponder()
        
        let highPriorityButton = UIButton()
        highPriorityButton.setTitle("  \(TaskPriority.high.title)  ", for: .normal)
        highPriorityButton.setTitleColor(.label, for: .normal)
        highPriorityButton.backgroundColor = UIColor.init(named: "KeyboardButton")
        highPriorityButton.layer.cornerRadius = Constant.cornerRadiusSmall
        highPriorityButton.titleLabel?.font = UIFont.systemFont(ofSize: 12.0)
        
        let lowPriorityButton = UIButton()
        lowPriorityButton.setTitle("  \(TaskPriority.low.title)  ", for: .normal)
        lowPriorityButton.setTitleColor(.label, for: .normal)
        lowPriorityButton.backgroundColor = UIColor.init(named: "KeyboardButton")
        lowPriorityButton.layer.cornerRadius = Constant.cornerRadiusSmall
        lowPriorityButton.titleLabel?.font = UIFont.systemFont(ofSize: 12.0)

        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.axis = .horizontal
        
        upperView.translatesAutoresizingMaskIntoConstraints = false
        upperView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissController)))
        let swipeDownGesture = UISwipeGestureRecognizer(target: self, action: #selector(self.dismissController))
        swipeDownGesture.direction = .down
        upperView.addGestureRecognizer(swipeDownGesture)
        
        buttonStackView.spacing = Constant.stackSpacingStandard
        buttonStackView.distribution = .fillEqually
        buttonStackView.addArrangedSubview(highPriorityButton)
        buttonStackView.addArrangedSubview(lowPriorityButton)
        
        outercontainerView.translatesAutoresizingMaskIntoConstraints = false
        outercontainerView.layer.cornerRadius = Constant.cornerRadiusStandard
        outercontainerView.backgroundColor = UIColor.init(named: "Keyboard")
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        outercontainerView.addSubview(containerView)
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont.systemFont(ofSize: 14.0)
        textView.backgroundColor = UIColor.clear
        textView.isScrollEnabled = false
        
        containerView.addSubview(textView)
        containerView.addSubview(buttonStackView)
        
        view.addSubview(upperView)
        view.addSubview(outercontainerView)
        
        bottomConstrant = containerView.bottomAnchor.constraint(equalTo: outercontainerView.safeAreaLayoutGuide.bottomAnchor)
        
        NSLayoutConstraint.activate([
            textView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Constant.paddingStandard),
            textView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -Constant.paddingStandard),
            textView.topAnchor.constraint(equalTo: containerView.topAnchor),
            

            buttonStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -Constant.paddingStandard),
            buttonStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -Constant.paddingSmall),
            buttonStackView.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: Constant.paddingSmall),
            buttonStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Constant.paddingStandard),
            buttonStackView.heightAnchor.constraint(equalToConstant: 32.0),

            outercontainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            outercontainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            outercontainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            upperView.topAnchor.constraint(equalTo: view.topAnchor),
            upperView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            upperView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            upperView.bottomAnchor.constraint(equalTo: outercontainerView.topAnchor),
            
            containerView.topAnchor.constraint(equalTo: outercontainerView.topAnchor, constant: Constant.cornerRadiusStandard),
            containerView.leadingAnchor.constraint(equalTo: outercontainerView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: outercontainerView.trailingAnchor),
            bottomConstrant
        ])
    }
    
    @objc
    func dismissController() {
        dismiss(animated: true)
    }
    
    @objc func keyboardWillShow(_ notification: NSNotification) {
                moveViewWithKeyboard(notification: notification, viewBottomConstraint: self.bottomConstrant, keyboardWillShow: true)
        }
        
        @objc func keyboardWillHide(_ notification: NSNotification) {
            moveViewWithKeyboard(notification: notification, viewBottomConstraint: self.bottomConstrant, keyboardWillShow: false)
        }
        
        func moveViewWithKeyboard(notification: NSNotification, viewBottomConstraint: NSLayoutConstraint, keyboardWillShow: Bool) {
            // Keyboard's size
            guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
            let keyboardHeight = keyboardSize.height
            
            // Keyboard's animation duration
            let keyboardDuration = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
            
            // Keyboard's animation curve
            let keyboardCurve = UIView.AnimationCurve(rawValue: notification.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! Int)!
            
            // Change the constant
            if keyboardWillShow {
                viewBottomConstraint.constant = -(keyboardHeight - 20.0)
            }else {
                viewBottomConstraint.constant = 0
            }
            
            // Animate the view the same way the keyboard animates
            let animator = UIViewPropertyAnimator(duration: keyboardDuration, curve: keyboardCurve) { [weak self] in
                // Update Constraints
                self?.view.layoutIfNeeded()
            }
            
            // Perform the animation
            animator.startAnimation()
        }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

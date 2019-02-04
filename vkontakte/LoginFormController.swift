//
//  LoginFormController.swift
//  vkontakte
//
//  Created by Uzh on 09/01/2019.
//  Copyright © 2019 Uzh. All rights reserved.
//

import UIKit

class LoginFormController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    @IBOutlet weak var VkLogo: UIImageView!
    @IBOutlet weak var VkLabel: UILabel!
    
    @IBOutlet weak var EnterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        EnterButton.layer.cornerRadius = 10
        
        // жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        // присваиваем его UIScrollVIew
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
        
        UIView.animate(withDuration: 1.5, delay: 0, options: [.repeat],
                       animations: {
                        //self.VkLogo.alpha = 1
                        self.VkLogo.alpha = 0
        })
        
        UIView.animate(withDuration: 1.5, delay: 0.5, options: [.repeat],
                       animations: {
                        //self.VkLabel.alpha = 1
                        self.VkLabel.alpha = 0
        })
        
        //
        //        UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseOut],
        //                       animations: {
        //                        self.loginInput.center.x += self.view.bounds.width
        //        },
        //                       completion: nil
        //        )
        //
        //        UIView.animate(withDuration: 0.3, delay: 0.3, options: [.curveEaseOut],
        //                       animations: {
        //                        self.passwordInput.center.x += self.view.bounds.width
        //        },
        //                       completion: nil
        //        )
        //
        //        UIView.animate(withDuration: 0.3, delay: 0.6, options: [.curveEaseOut],
        //                       animations: {
        //                        self.EnterButton.center.x += self.view.bounds.width
        //        },
        //                       completion: nil
        //        )
        
        
        
        
        
    }
    
    // Когда клавиатура появляется
    @objc func keyboardWasShown(notification: Notification) {
        
        // Получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    //Когда клавиатура исчезает
    @objc func keyboardWillBeHidden(notification: Notification) {
        // Устанавливаем отступ внизу UIScrollView, равный 0
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //        loginInput.center.x  -= view.bounds.width
        //        passwordInput.center.x -= view.bounds.width
        //        EnterButton.center.x -= view.bounds.width
        
        super.viewWillAppear(animated)
        
        
        
        
        // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        // Второе -- когда она пропадает
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        let checkResult = checkUserData()
        
        if !checkResult {
            showLoginError()
        }
        
        return checkResult
    }
    
    func checkUserData () -> Bool {
        
        let login = loginInput.text!
        let password = passwordInput.text!
        
        if login == "" && password == "" {
            return true
            
        } else {
            return false
        }
    }
    
    func showLoginError() {
        let alter = UIAlertController(title: "Error", message: "Invalid account", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alter.addAction(action)
        
        present(alter, animated: true, completion: nil)
    }
    
}



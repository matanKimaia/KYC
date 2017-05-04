//
//  KYCNameViewController.swift
//  KYC
//
//  Created by Matan Alpha on 04/05/2017.
//  Copyright © 2017 Matan alpha. All rights reserved.
//

import UIKit

class KYCNameViewController: UIViewController ,UITextViewDelegate{

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
  
    @IBOutlet weak var termsAndConditions: UITextView!
    @IBOutlet weak var country: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
//        let attributedString = NSMutableAttributedString(string: "Want to learn iOS? You should visit the best source of free iOS tutorials!")
//        attributedString.addAttribute(NSLinkAttributeName, value: "https://www.hackingwithswift.com", range: NSRange(location: 19, length: 55))
//        
//        termsAndConditions.attributedText = attributedString
        
        let tosString = "Terms & Conditions"
        let ppString = "Privacy Policy"
        let message = "I'm over 18 and I accept these Terms & Conditions"
        
        let localizedString = NSMutableAttributedString(string: message)
        
        let tosRange = localizedString.mutableString.range(of: tosString)
        //let ppRange = localizedString.mutableString.range(of: ppString)
        
        let tosURL = URL(string: "http://toslink.com")!
        //let ppURL = URL(string: "http://pplink.com")!
        
        localizedString.addAttribute(NSLinkAttributeName, value: tosURL, range: tosRange)
        //localizedString.addAttribute(NSLinkAttributeName, value: ppURL, range: ppRange)
        
        termsAndConditions.delegate = self
        termsAndConditions.isSelectable = true
        termsAndConditions.isUserInteractionEnabled = true
        localizedString.endEditing()
        self.termsAndConditions.attributedText = localizedString
        
        // Do any additional setup after loading the view.
    }

    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        UIApplication.shared.open(URL, options: [:])
        return false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextButtonClicked(_ sender: UIButton) {
        let newKycCode = KYCCodeViewController()
        
        self.navigationController!.pushViewController(newKycCode, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

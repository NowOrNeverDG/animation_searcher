//
//  SearchViewController.swift
//  NarutoListProject
//
//  Created by Ge Ding on 8/1/21.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchTxt: UITextField!
    @IBOutlet weak var searchBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Search Page"
        
        //SeachTextField
        searchTxt.layer.borderWidth = 1
        searchTxt.layer.borderColor = UIColor.purple.cgColor
        searchTxt.layer.cornerRadius = 10
        searchTxt.placeholder = " Search..."
        searchTxt.borderStyle = .none
        //SearchButton
        searchBtn.layer.cornerRadius = 10
        searchBtn.setTitle("Search", for: .normal)
        searchBtn.setTitleColor(UIColor.purple, for: .normal)
        searchBtn.layer.borderColor = UIColor.purple.cgColor
        searchBtn.layer.borderWidth = 1

    }
    @IBAction func searchPressed(_ sender: UIButton) {
        if let text = searchTxt.text,
           text.count >= 3,
           let vc = self.storyboard?.instantiateViewController(identifier: "MainVC") as? MainViewController {
                vc.navigationItem.title = text
                vc.vm = MainViewModel(searchRequestText: text)
                self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}


extension SearchViewController: UITextFieldDelegate {
    func hideKeyboardWhenTappedAround() {
        let gesture = UITapGestureRecognizer(target: self,
                         action: #selector(hideKeyboard))
        view.addGestureRecognizer(gesture)
    }

    @objc func hideKeyboard() {
        view.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}

//
//  ViewController.swift
//  rvc29_p2
//
//  Created by Rafael Chaves on 10/3/19.
//  Copyright © 2019 Rafael Chaves. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var itemLabel: UILabel! = UILabel()
    var quantityLabel: UILabel! = UILabel()
    var itemTextField: UITextField! = UITextField()
    var quantityTextField: UITextField! = UITextField()
    var addButton: UIButton! = UIButton()
    var groceryListLabel: UILabel! = UILabel()
    var listText: UITextView! = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        
        createLabel(label: itemLabel, text: "Grocery Item:")
        createLabel(label: quantityLabel, text: "Quantity:")
        createLabel(label: groceryListLabel, text: "Grocery List:")
        
        createTextField(textField: itemTextField, placeholder: "Enter Item Here")
        createTextField(textField: quantityTextField, placeholder: "Enter Quantity Here")
                
        createButton(button: addButton, title: "Add Item")
        addButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        
        createTextView(textView: listText)
        
        setupConstraints()
        
    }
    
    @objc func addButtonPressed(){
        if (itemTextField.text != "" && quantityTextField.text != ""){
            listText.text += "\n Item: \(itemTextField.text!), Quantity: \(quantityTextField.text!)"
        }

    }
    
    func createLabel(label: UILabel, text: String) {
        label.text = text
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
    }
    
    func createButton(button: UIButton, title: String) {
        button.backgroundColor = .white
        button.setTitle(title, for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
    }
    
    func createTextField(textField: UITextField, placeholder: String){
        textField.placeholder = placeholder
        textField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textField)
    }
    
    func createTextView(textView: UITextView) {
        textView.text = ""
        textView.isEditable = false
        textView.textAlignment = .center
        textView.textColor = .black
        textView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textView)
    }
    func setupConstraints() {
        
        // Item Label
        NSLayoutConstraint.activate([
            itemLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            itemLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50)

        ])
        
        // Quantity Label
        NSLayoutConstraint.activate([
            quantityLabel.topAnchor.constraint(equalTo: itemLabel.bottomAnchor, constant: 20),
            quantityLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50)
        ])
                
        // Item Text Field
        NSLayoutConstraint.activate([
            itemTextField.topAnchor.constraint(equalTo: itemLabel.topAnchor),
            itemTextField.leadingAnchor.constraint(equalTo: itemLabel.trailingAnchor, constant: 20),
        ])
        
        // Quantity Text Field
        NSLayoutConstraint.activate([
            quantityTextField.topAnchor.constraint(equalTo: itemTextField.bottomAnchor, constant: 20),
            quantityTextField.leadingAnchor.constraint(equalTo: quantityLabel.trailingAnchor, constant: 20)
        ])
        
        // Add Item Button
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: quantityLabel.bottomAnchor, constant: 80),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        // Grocery List Label
        NSLayoutConstraint.activate([
            groceryListLabel.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 50),
            groceryListLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // List Text
        NSLayoutConstraint.activate([
            listText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            listText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            listText.topAnchor.constraint(equalTo: groceryListLabel.bottomAnchor, constant: 20),
            listText.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
    }

}

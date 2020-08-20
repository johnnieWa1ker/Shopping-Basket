//
//  ViewController.swift
//  Shopping Basket
//
//  Created by Johnnie Walker on 19.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var orderView: UIView!
    @IBOutlet private weak var addNewItemView: UIView!
    
    
    @IBOutlet weak var itemsCountTitleLabel: UILabel!
    @IBOutlet private weak var itemsCountLabel: UILabel!
    @IBOutlet weak var totalTitleLabel: UILabel!
    @IBOutlet private weak var totalLabel: UILabel!
    @IBOutlet weak var orderViewTitleLabel: UILabel!
    @IBOutlet private weak var orderDetailLabel: UILabel!
    @IBOutlet weak var addNewItemViewTitleLabel: UILabel!
    @IBOutlet weak var iDLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet private weak var idItemTextField: UITextField!
    @IBOutlet private weak var nameItemTextField: UITextField!
    @IBOutlet private weak var priceItemTextField: UITextField!
    
    @IBOutlet private weak var deleteNowButton: UIButton!
    @IBOutlet private weak var deleteAfterDelayButton: UIButton!
    @IBOutlet private weak var buyButton: UIButton!
    @IBOutlet private weak var addItemInOrderButton: UIButton!
    
    // MARK: - Props
    var order = Order()
    
    private var preparingToDelete: Bool = false
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.order.items = [Item(itemId: 1, name: "First Item", price: 10.0),
                            Item(itemId: 1, name: "First Item", price: 10.0),
                            Item(itemId: 2, name: "Second Item", price: 20.0),
                            Item(itemId: 3, name: "Third Item", price: 30.0)]
        
        self.setup()
        self.setupStyle()
    }
    
    // MARK: - Setup
    private func setup() {
        self.orderView.isHidden = true
        
        self.itemsCountTitleLabel.text = "Items in shopping-bag:"
        self.totalTitleLabel.text = "Total price:"
        self.orderViewTitleLabel.text = "You made an order:"
        self.addNewItemViewTitleLabel.text = "Add new Item"
        self.iDLabel.text = "ID"
        self.nameLabel.text = "Name"
        self.priceLabel.text = "Price"
        
        self.deleteNowButton.setTitle("Delete now", for: .normal)
        self.deleteAfterDelayButton.setTitle("Delete", for: .normal)
        self.buyButton.setTitle("Buy", for: .normal)
        self.addItemInOrderButton.setTitle("Add item in order", for: .normal)
        
        self.idItemTextField.delegate = self
        self.idItemTextField.keyboardType = .numberPad
        self.nameItemTextField.delegate = self
        self.priceItemTextField.delegate = self
        self.priceItemTextField.keyboardType = .decimalPad
        
        self.itemsCountLabel.text = String(order.items.count)
        self.totalLabel.text = String(order.total)
        self.orderDetailLabel.numberOfLines = 0
    }
    
    private func setupStyle() {
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            
            strongSelf.view.apply(.asBackground())
            
            strongSelf.itemsCountTitleLabel.apply(.subheadlineRegular16(.left))
            strongSelf.totalTitleLabel.apply(.subheadlineRegular16(.left))
            strongSelf.itemsCountLabel.apply(.subheadlineRegular16(.right))
            strongSelf.totalLabel.apply(.subheadlineRegular16(.right))
            strongSelf.orderViewTitleLabel.apply(.subheadlineRegular16(.left))
            strongSelf.orderDetailLabel.apply(.bodyRegular14(.left))
            strongSelf.addNewItemViewTitleLabel.apply(.subheadlineRegular16(.left))
            strongSelf.iDLabel.apply(.subheadlineRegular16(.left))
            strongSelf.nameLabel.apply(.subheadlineRegular16(.left))
            strongSelf.priceLabel.apply(.subheadlineRegular16(.left))
            
            strongSelf.deleteNowButton.apply(.delete())
            strongSelf.deleteAfterDelayButton.apply(.delete())
            strongSelf.buyButton.apply(.buy())
            strongSelf.addItemInOrderButton.apply(.add())
            
            strongSelf.orderView.apply(.forContent())
            strongSelf.addNewItemView.apply(.forContent())
            
            strongSelf.idItemTextField.apply(.standart())
            strongSelf.nameItemTextField.apply(.standart())
            strongSelf.priceItemTextField.apply(.standart())
        }
    }
    
    // MARK: - Actions
    @IBAction func buyButtonAction(_ sender: Any) {
        
        guard order.items.isEmpty == false else {
            self.showNotice("You have not item to buy 🛒")
            return
        }
        self.orderView.isHidden = false
        self.orderDetailLabel.text = ""
        
        for item in self.order.make() {
            var idStr = ""
            var countStr = ""
            for (key, value) in item {
                switch key {
                case "id":
                    idStr = "\(key): \(value)"
                case "count":
                    countStr = "\(key): \(value)"
                default:
                    break
                }
            }
            self.orderDetailLabel.text?.append("[\(idStr) - \(countStr)]\n")
        }
    }
    
    @IBAction func deleteAfterDelayButtonAction(_ sender: Any) {
        
        self.deleteAfterDelayButton.apply(.cancel())
        self.deleteAfterDelayButton.setTitle("Cancel", for: .normal)
        
        switch self.preparingToDelete {
        case true:
            self.order.cancelDelete()
            self.deleteAfterDelayButton.apply(.delete())
            self.deleteAfterDelayButton.setTitle("Delete", for: .normal)
            self.preparingToDelete = false
            
        case false:
            self.preparingToDelete = true
            self.order.deleteAfter20Seconds { () -> (Void) in
                self.removeOrderDetail()
                self.showNotice("All items have been removed from the cart")
                self.deleteAfterDelayButton.apply(.delete())
                self.deleteAfterDelayButton.setTitle("Delete", for: .normal)
                self.itemsCountLabel.text = String(self.order.items.count)
                self.totalLabel.text = String(self.order.total)
            }
        }
    }
    
    @IBAction func deleteImmediatelyButtonAction(_ sender: Any) {
        self.order.delete()
        self.removeOrderDetail()
        self.itemsCountLabel.text = String(self.order.items.count)
        self.totalLabel.text = String(self.order.total)
        self.showNotice("All items have been removed from the cart")
    }
    
    @IBAction func addItemsInOrderButtonAction(_ sender: Any) {
        guard (self.idItemTextField.text?.isEmpty != true) && (self.nameItemTextField.text?.isEmpty != true) && (self.priceItemTextField.text?.isEmpty != true) else {
            showNotice("Please fill in the required fields")
            return }
        guard let idStr = self.idItemTextField.text else { return }
        guard let name = self.nameItemTextField.text  else { return }
        guard let priceStr = self.priceItemTextField.text else { return }
        
        if let id = Int(idStr), let price = Float(priceStr) {
            let item = Item(itemId: id, name: name, price: price)
            self.order.put(item)
            self.itemsCountLabel.text = String(self.order.items.count)
            self.totalLabel.text = String(self.order.total)
        } else {
            print("[DEBUG] Invalid data")
        }
    }
    
    // MARK: - Module functions
    private func removeOrderDetail() {
        self.orderDetailLabel.text = ""
        self.orderView.isHidden = true
    }
}

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let aSet = NSCharacterSet(charactersIn:"0123456789,").inverted
        let compSepByCharInSet = string.components(separatedBy: aSet)
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        
        switch textField {
        case self.idItemTextField:
            return string == numberFiltered
        case self.nameItemTextField:
            return true
        case self.priceItemTextField:
            return string == numberFiltered
        default:
            break
        }
        
        return false
    }
}

//
//  Order.swift
//  Shopping Basket
//
//  Created by Johnnie Walker on 20.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import Foundation

class Order {

    var items: [Item] = []
    
    private var timer: Timer?
    private var deleteBlock: (()->(Void))?

    /// сумма заказа
    public var total: Float {
        var value = Float()
        for item in self.items {
            value += item.price
        }
        return value
    }
    
    ///  Добавить товар к заказу
    public func put(_ item: Item) {
        items.append(item)
    }

    /// Посчитать заказ и подготовить к отправке
    public func make() -> [[String: Int]] {
        let uniqIds = Set(self.items.map({$0.itemId}))
        
        var result: [[String: Int]] = []
        
        for uniqId in uniqIds {
            let uniqIdCount = self.items.filter({$0.itemId == uniqId}).count
            
            let newResult: [String: Int] = ["id": uniqId, "count": uniqIdCount]
            result.append(newResult)
        }
        
        return result
    }
    
    /// удалить товары из заказа через 20 секунд
    public func deleteAfter20Seconds(block: (()->(Void))?) {
        self.deleteBlock = block
        self.timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
            self.delete()
        }
    }
    
    /// отменить удаление товаров
    public func cancelDelete() {
        self.timer?.invalidate()
        self.timer = nil
    }
    
    ///очистка товаров
    public func delete() {
        self.items.removeAll()
        deleteBlock?()
    }
}

//
//  ListViewModel.swift
//  Reminder
//
//  Created by Bradley Brown on 3/20/22.
//

import Foundation
import UIKit

class ListViewModel: ObservableObject {
    @Published var items: [itemModel] = []
    
    init(){
        getItems()
    }
    
    func getItems() {
        let newItems = [
            itemModel(title: "title", isCompleted: false)
        ]
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func addItem(title: String) {
        let newItem = itemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: itemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
}

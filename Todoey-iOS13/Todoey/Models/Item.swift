//
//  Item.swift
//  Todoey
//
//  Created by Chingiz on 13.01.24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object{
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false 
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}

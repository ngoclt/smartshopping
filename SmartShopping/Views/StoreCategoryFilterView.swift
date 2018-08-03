//
//  StoreCategoryFilterView.swift
//  SmartShopping
//
//  Created by Ngoc LE on 8/2/18.
//  Copyright © 2018 Ngoc LE. All rights reserved.
//

import UIKit

protocol StoreCategoryFilterViewDelegate {
    func didSelectCategoryFilter(_ index: Int)
}

class StoreCategoryFilterView: UICollectionReusableView {

    @IBOutlet fileprivate weak var menuView: HorizontalMenuView!
    
    private var data: [Category] = []
    
    var delegate: StoreCategoryFilterViewDelegate?
    var selectedFilter = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        menuView.delegate = self
    }
    
    func reloadData(_ data: [Category], filter: Int) {
        var items = [MenuItem("All")]
        items.append(contentsOf: data.map { MenuItem($0.name) })
        menuView.selectedIndex = filter
        menuView.items = items
    }
}

extension StoreCategoryFilterView: HorizontalMenuViewDelegate {
    func didSelectMenuItem(_ index: Int) {
        delegate?.didSelectCategoryFilter(index)
    }
}

//
//  HorizontalMenuView.swift
//  SmartShopping
//
//  Created by Ngoc LE on 7/30/18.
//  Copyright © 2018 Ngoc LE. All rights reserved.
//

import UIKit

class MenuItem {
    var title: String
    var textColor: UIColor = .darkGray
    var selectedTextColor: UIColor = .white
    var backgroundColor: UIColor = .clear
    var selectedBackgroundColor: UIColor = .darkGray
    
    init(_ title: String) {
        self.title = title
    }
}

class MenuItemView: UICollectionViewCell {
    
    var title: String = "" {
        didSet {
            label.text = title
            let original = label.frame
            label.sizeToFit()
            var fit = label.frame
            fit.size.width = fit.size.width + 20
            fit.size.height = original.height
            label.frame = fit
        }
    }
    
    let label = UILabel(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        baseInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func baseInit() {
        addSubview(label)
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 5
        
        label.font = FontBook.robotoRegular.of(size: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.addConstrainToFill(top: 0, left: 10, right: 10, bottom: 0)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        baseInit()
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        var frame = layoutAttributes.frame
        frame.size.width = label.frame.size.width
        layoutAttributes.frame = frame
        return layoutAttributes
    }
}

protocol HorizontalMenuViewDelegate {
    func didSelectMenuItem(_ index: Int)
}

class HorizontalMenuView: UIView {
    
    var items: [MenuItem] = [] {
        didSet {
            reloadData()
        }
    }
    var selectedIndex: Int = 0
    
    var delegate: HorizontalMenuViewDelegate?
    
    var collectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        baseInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        baseInit()
    }
    
    func baseInit() {
        let flowLayout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: bounds, collectionViewLayout: flowLayout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.alwaysBounceVertical = false
        addSubview(collectionView)
        collectionView.addConstrainToFillParent()
        
        flowLayout.scrollDirection = .horizontal
        flowLayout.estimatedItemSize = CGSize(width: 50, height: collectionView.frame.height - 20)
        flowLayout.minimumLineSpacing = 10
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        
        collectionView.register(MenuItemView.self, forCellWithReuseIdentifier: "MenuItemView")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func reloadData() {
        collectionView.reloadData()
    }
}

extension HorizontalMenuView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuItemView", for: indexPath) as! MenuItemView
        let item = items[indexPath.item]
        cell.title = item.title
        if indexPath.item == selectedIndex {
            cell.label.textColor = item.selectedTextColor
            cell.contentView.backgroundColor = item.selectedBackgroundColor
        } else {
            cell.label.textColor = item.textColor
            cell.contentView.backgroundColor = item.backgroundColor
        }
        
        return cell
    }
}

extension HorizontalMenuView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        collectionView.deselectItem(at: indexPath, animated: true)
        selectedIndex = indexPath.item
        collectionView.reloadData()
        
        delegate?.didSelectMenuItem(indexPath.item)
    }
}

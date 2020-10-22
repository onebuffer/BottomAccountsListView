//
//  AccountHorizontalListView.swift
//  AccountHorizontalListView
//
//  Created by Cao Phuoc Thanh on 10/22/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

// MARK: UIView - AccountHorizontalListView
public class AccountHorizontalListView: UIView {
    
    public var didTabOnChange: ((Int) -> ())? {
        didSet {
            self.listView.didTabOnChange = self.didTabOnChange
        }
    }
    
    public typealias TitleImage = (title: String, image: UIImage?)
    
    public required convenience init(items:[AccountHorizontalListView.TitleImage]) {
        self.init()
        self.listView.items = items
        self.listView.didTabOnChange = self.didTabOnChange
        self.backgroundColor = UIColor.lightGray.withAlphaComponent(0.05)
    }
    
    private var topLineView: UIView =  {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        return view
    }()
    
    private var headerView: AddAccountsBottomHeaderView = AddAccountsBottomHeaderView()
    
    private var listView: AddAccountsBottomListView = AddAccountsBottomListView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
        self.setupConstraints()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.listView.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.addSubview(topLineView)
        self.addSubview(headerView)
        self.addSubview(listView)
    }
    
    private func setupConstraints() {
        topLineView.translatesAutoresizingMaskIntoConstraints = false
        headerView.translatesAutoresizingMaskIntoConstraints = false
        listView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-0-[v]-0-|",
            options: [], metrics: nil,
            views: ["v": topLineView])
        )
        self.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-0-[v]-0-|",
            options: [],
            metrics: nil,
            views: ["v": headerView])
        )
        self.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-8-[v]-8-|",
            options: [],
            metrics: nil,
            views: ["v": listView])
        )
        self.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-0-[v0(1)]-4-[v1(24)]-0-[v2]-0-|",
            options: [],
            metrics: nil,
            views: ["v0": topLineView, "v1": headerView,"v2": listView])
        )
    }
}


// MARK: HeaderView - AddAccountsBottomHeaderView
extension AccountHorizontalListView {
    
    private class AddAccountsBottomHeaderView: UIView {
        
        private lazy var addImageView: UIImageView = {
            let view = UIImageView()
            view.image = UIImage.add
            view.contentMode = .scaleAspectFit
            return view
        }()
        
        private lazy var addTitleLabel: UILabel = {
            let label = UILabel()
            label.text = "Add Account"
            label.textColor = UIColor.gray
            label.font = UIFont.boldSystemFont(ofSize: 14)
            return label
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            self.setupUI()
            self.setupConstraints()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setupUI() {
            self.addSubview(addImageView)
            self.addSubview(addTitleLabel)
        }
        
        private func setupConstraints() {
            addImageView.translatesAutoresizingMaskIntoConstraints = false
            addTitleLabel.translatesAutoresizingMaskIntoConstraints = false
            
            self.addConstraints(NSLayoutConstraint.constraints(
                withVisualFormat: "V:|-0-[v]-0-|",
                options: [],
                metrics: nil,
                views: ["v": addImageView])
            )
            self.addConstraints(NSLayoutConstraint.constraints(
                withVisualFormat: "V:|-0-[v]-0-|",
                options: [],
                metrics: nil,
                views: ["v": addTitleLabel])
            )
            self.addConstraints(NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-16-[v1(24)]-[v2(>=0)]-(16)-|",
                options: [], metrics: nil,
                views: ["v1": addImageView, "v2": addTitleLabel])
            )
        }
    }
    
}

// MARK: CollectionView - AddAccountsBottomListView
extension AccountHorizontalListView {
    
    class AddAccountsBottomListViewCell: UICollectionViewCell {
        
        var title: String? {
            set{ self.titleLabel.text = newValue }
            get { return self.titleLabel.text }
        }
        
        var image: UIImage? {
            set{ self.imageView.image = newValue }
            get { return self.imageView.image }
        }
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            self.setupUI()
            self.setupConstraints()
        }
        
        override func draw(_ rect: CGRect) {
            super.draw(rect)
            self.contentView.backgroundColor = .white
            
            self.layer.borderWidth = 1.0
            self.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.3).cgColor
            
            self.layer.shadowColor = UIColor.lightGray.cgColor
            self.layer.shadowOpacity = 0.5
            self.layer.shadowOffset = CGSize(width: 1, height: 2)
            self.layer.shadowRadius = 1
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private lazy var imageView: UIImageView = {
            let view = UIImageView()
            view.image = UIImage(named: "add")
            view.contentMode = .scaleAspectFit
            return view
        }()
        
        private lazy var titleLabel: UILabel = {
            let label = UILabel()
            label.textColor = UIColor.gray
            label.font = UIFont.boldSystemFont(ofSize: 12)
            label.numberOfLines = 2
            return label
        }()
        
        private func setupUI() {
            self.addSubview(imageView)
            self.addSubview(titleLabel)
        }
        
        private func setupConstraints() {
            
            imageView.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            
            self.addConstraints(NSLayoutConstraint.constraints(
                withVisualFormat: "V:|-4-[v]-4-|",
                options: [],
                metrics: nil,
                views: ["v": imageView])
            )
            self.addConstraints(NSLayoutConstraint.constraints(
                withVisualFormat: "V:|-4-[v]-4-|",
                options: [],
                metrics: nil,
                views: ["v": titleLabel])
            )
            self.addConstraints(NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-8-[v1(18)]-8-[v2(>=0)]-4-|",
                options: [], metrics: nil,
                views: ["v1": imageView, "v2": titleLabel])
            )
        }
        
        static var reuseIdentifier: String {
            return "AddAccountsBottomListViewCell"
        }
    }
    
    class AddAccountsBottomListView: UICollectionView {
        
        fileprivate var maximumNumberItemsInvisible: Int {
            return UIScreen.main.bounds.width > UIScreen.main.bounds.height ? 5 : 3
        }
        
        var didTabOnChange: ((Int) -> ())?
        
        required convenience init(items:[AccountHorizontalListView.TitleImage]) {
            self.init()
            self.items = items
        }
        
        var items: [TitleImage] = [] {
            didSet{
                self.reloadData()
            }
        }
        
        private var layout: UICollectionViewFlowLayout = {
            let layout = UICollectionViewFlowLayout()
            layout.minimumLineSpacing = 8
            layout.minimumInteritemSpacing = 8
            layout.scrollDirection = .horizontal
            return layout
        }()
        
        override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
            super.init(frame: frame, collectionViewLayout: self.layout)
            
            self.register(AddAccountsBottomListViewCell.self, forCellWithReuseIdentifier: AddAccountsBottomListViewCell.reuseIdentifier)
            self.showsVerticalScrollIndicator = false
            self.showsHorizontalScrollIndicator = false
            self.backgroundColor = .clear
            self.dataSource = self
            self.delegate = self
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    }
}

// MARK: UICollectionViewDelegate - AddAccountsBottomListView
extension AccountHorizontalListView.AddAccountsBottomListView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.cellForItem(at: indexPath)?.pulsate()
        self.didTabOnChange?(indexPath.row)
    }
}


// MARK: UICollectionViewDelegateFlowLayout - AddAccountsBottomListView
extension AccountHorizontalListView.AddAccountsBottomListView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 8 - (self.layout.minimumInteritemSpacing*CGFloat(self.maximumNumberItemsInvisible)))/CGFloat(self.maximumNumberItemsInvisible)
        let height = collectionView.bounds.height - (self.layout.minimumLineSpacing*2)
        return CGSize(width: width, height: height )
    }
}

// MARK: UICollectionViewDataSource - AddAccountsBottomListView
extension AccountHorizontalListView.AddAccountsBottomListView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: AccountHorizontalListView.AddAccountsBottomListViewCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: AccountHorizontalListView.AddAccountsBottomListViewCell.reuseIdentifier,
            for: indexPath) as! AccountHorizontalListView.AddAccountsBottomListViewCell
        cell.title = items[indexPath.row].title
        cell.image = items[indexPath.row].image
        return cell
    }
    
}

extension UIView {
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.05
        pulse.fromValue = 0.95
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = 1
        pulse.initialVelocity = 0.5
        pulse.damping = 0.3
        layer.add(pulse, forKey: "pulse")
    }
}



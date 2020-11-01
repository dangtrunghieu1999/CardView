//
//  ViewController.swift
//  CardView
//
//  Created by Dang Trung Hieu on 10/4/20.
//  Copyright © 2020 Dang Trung Hieu. All rights reserved.
//

import UIKit


class ViewController: UIViewController{
    
    // MARK: - Variables
    
    let screenSize = UIScreen.main.bounds.size
    let window = UIApplication.shared.keyWindow
    
    // MARK: - UI Elements
    fileprivate lazy var  transparentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        view.frame = self.view.frame
        view.alpha = 0
        return view
    }()
    
    fileprivate lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: screenSize.height / 2)
        view.roundCorners(corners: [.topRight,.topLeft], radius: 10)
        return view
    }()
    
    fileprivate lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .gray
        return collectionView
    }()
    
    // MARK: - View LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "filter")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(tapOnFilter))
        layoutCollectionView()
    }
    
    // MARK:- Helper Method
    
    // MARK: - UI Actions
    @objc private func tapOnFilter() {
        window?.addSubview(transparentView)
        window?.addSubview(mainView)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissFilter))
        transparentView.addGestureRecognizer(tapGesture)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transparentView.alpha = 0.5
            self.mainView.frame = CGRect(x: 0, y: self.screenSize.height / 2 ,width: self.screenSize.width, height: self.screenSize.height / 2 )
        }, completion: nil)
    }
    
    @objc private func dismissFilter() {
        let screenSize = UIScreen.main.bounds.size
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transparentView.alpha = 0
            self.mainView.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: screenSize.height / 2)
        }, completion: nil)
        
    }
    
    
    // MARK: - Public Method
    
    // MARK: - Layouts

    private func layoutCollectionView() {
        mainView.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
}

//
//  HomeDataSourceControllerAndNavigation.swift
//  TwitterApp
//
//  Created by ashim Dahal on 9/26/17.
//  Copyright © 2017 ashim Dahal. All rights reserved.
//

import LBTAComponents


extension HomeDataSourceController {
    
    func setupNavigationBarItem(){
        
        setupRemainingNavigationTitleItems()
        setupLeftNavigationItem()
        setupRightNavigationItem()
        
    }
    
    private func setupRightNavigationItem(){
        
        let searchButton = UIButton(type: .system)
        searchButton.setImage(#imageLiteral(resourceName: "search").withRenderingMode(.alwaysOriginal), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        let compseButton = UIButton(type: .system)
        compseButton.setImage(#imageLiteral(resourceName: "compose").withRenderingMode(.alwaysOriginal), for: .normal)
        compseButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: compseButton),UIBarButtonItem(customView: searchButton)]
        
    }
    private func setupLeftNavigationItem (){
        
        let followButton = UIButton(type: .system)
        followButton.setImage(#imageLiteral(resourceName: "follow").withRenderingMode(.alwaysOriginal), for: .normal)
        followButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followButton)
    }
    private func setupRemainingNavigationTitleItems() {
        
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "title_icon"))
        titleImageView.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        titleImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImageView
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        let navBarSaparatorView = UIView()
        navBarSaparatorView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        view.addSubview(navBarSaparatorView)
        navBarSaparatorView.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
    }
}

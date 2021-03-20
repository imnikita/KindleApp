//
//  BookPageController.swift
//  KindleApp
//
//  Created by Nikita Popov on 19.03.2021.
//

import UIKit



class BookPagesController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var book: Book?
    
    private let reuseIdentifier = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.backgroundColor = .white
        navigationItem.title = book?.title
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(backButtonPressed))
        self.collectionView!.register(PageCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        
        layout?.scrollDirection = .horizontal
        layout?.minimumLineSpacing = 0
        collectionView.isPagingEnabled = true
        
        
    }
    
    @objc func backButtonPressed(){
       dismiss(animated: true, completion: nil)
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let number = book?.pages.count else { return 0 }
        return number
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PageCell
        cell.textLabel.text = book?.pages[indexPath.row].text
    
        return cell
    }
    
    
// MARK: - UICollectionViewDelegateFlowLayout methods
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: view.safeAreaLayoutGuide.layoutFrame.height)
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
       collectionView?.collectionViewLayout.invalidateLayout();
   }

}

//
//  HomePageViewController.swift
//  movieapp
//
//  Created by Seda Şahin on 17.09.2023.
//

import Foundation
import UIKit
import Kingfisher

class HomePageViewController: ViewController<HomePageViewModel>, UIViewControllerTransitioningDelegate {
    let transition = CircularTransition()
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var search: UITextField!
    @IBOutlet weak var warningText: UILabel!
    @IBOutlet weak var movieCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setCollection()
        update()
    }
    func setCollection() {
        movieCollectionView.register(UINib(nibName: "MovieItem", bundle:nil), forCellWithReuseIdentifier: "MovieItem")
        movieCollectionView.dataSource = self
        movieCollectionView.delegate = self
    }
    func update() {
        viewModel?.updateUI = { [weak self] in
            self?.movieCollectionView.reloadData()
            if self?.viewModel?.movieData?.Search?.count == nil {
                self?.warningText.isHidden = false
                self?.warningText.text = "No movie was found that meets your search criteria."
            } else {
                self?.warningText.isHidden = true
            }
            self?.stopLoading()
        }
    }
    func setupUI() {
        warningText.isHidden = true
        searchView.layer.cornerRadius = 8
        searchView.layer.borderColor = UIColor.gray.cgColor
        searchView.layer.borderWidth = 0.2
        self.navigationController?.setNavigationBarHidden(false, animated: true)

navigationItem.hidesBackButton = true
    }
    @IBAction func searchEditing(_ sender: Any) {
        viewModel?.getMovies(text: search.text ?? "")
        startLoading()
    }
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = .zero
        transition.circleColor = .gray
        return transition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = .zero
        transition.circleColor = .gray
        return transition
    }
}
extension HomePageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 142)
    }
}
extension HomePageViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.movieData?.Search?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "MovieItem",
                        for: indexPath
                    ) as! MovieItem
        cell.movieName.text = viewModel?.movieData?.Search?[indexPath.row].Title
        cell.movieImage.kf.setImage(with: URL(string: viewModel?.movieData?.Search?[indexPath.row].Poster ?? ""))
        cell.movieYear.text = "Year: \(viewModel?.movieData?.Search?[indexPath.row].Year ?? "")"
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vm = DetailViewModel(movieTitle: viewModel?.movieData?.Search?[indexPath.row].Title ?? "")
        let vc = DetailViewController.instantiate(viewModel: vm)
        vc.transitioningDelegate = self
        vc.modalPresentationStyle = .custom
        self.navigationController?.present(vc, animated: true)
    }
}
extension HomePageViewController: StoryboardInstantiable {
    public static var storyboardName: String { return "HomePage" }
    public static var storyboardIdentifier: String? { return "HomePageViewController" }
}

//
//  DetailViewController.swift
//  movieapp
//
//  Created by Seda Şahin on 18.09.2023.
//

import Foundation
import UIKit
import Kingfisher

class DetailViewController: ViewController<DetailViewModel>, UIViewControllerTransitioningDelegate{
    let transition = CircularTransition()
    @IBOutlet weak var movieType: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var actors: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var runtime: UILabel!
    @IBOutlet weak var back: UIImageView!{
        didSet {
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(toBack))
            back.addGestureRecognizer(tapGestureRecognizer)
        }
    }
    @objc func toBack() {
        self.dismiss(animated: true)
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
    override func viewDidLoad() {
        super.viewDidLoad()
        sendEvent()
        getDetail()
        update()
    }
    func update() {
        viewModel?.updateUI = { [weak self] in
            self?.movieImage.kf.setImage(with: URL(string: self?.viewModel?.movieDetail?.Poster ?? ""))
            self?.movieTitle.text = self?.viewModel?.movieDetail?.Title
            self?.movieType.text = self?.viewModel?.movieDetail?.Genre
            self?.rating.text = self?.viewModel?.movieDetail?.imdbRating
            self?.movieDescription.text = self?.viewModel?.movieDetail?.Plot
            self?.actors.text = self?.viewModel?.movieDetail?.Actors
            self?.runtime.text = self?.viewModel?.movieDetail?.Runtime
            self?.stopLoading()
        }
    }
    func getDetail() {
        startLoading()
        viewModel?.getMovieDetail(title: viewModel?.movieTitle ?? "")
    }
    func sendEvent() {
        AnalyticsHelper.shared.sendEvent(eventName: "detail", module: "Detail", itemId: "detailPageOpened")
    }
}
extension DetailViewController: StoryboardInstantiable {
    public static var storyboardName: String { return "Detail" }
    public static var storyboardIdentifier: String? { return "DetailViewController" }
}

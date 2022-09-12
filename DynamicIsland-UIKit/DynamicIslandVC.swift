//
//  DynamicIslandVC.swift
//  DynamicIsland-UIKit
//
//  Created by cleanmac-ada on 10/09/22.
//

import UIKit

class DynamicIslandVC: UIViewController {
    
    private lazy var dynamicIslandShrunkStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalCentering
        
        let leftStackView = UIStackView(frame: .zero)
        leftStackView.axis = .horizontal
        leftStackView.alignment = .fill
        leftStackView.distribution = .fill
        leftStackView.spacing = 4
        
        let callImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        callImageView.image = UIImage(systemName: "phone.fill")
        callImageView.tintColor = .green
        callImageView.contentMode = .scaleAspectFit
        let callLabel = UILabel(frame: .zero)
        callLabel.text = "00:08"
        callLabel.textColor = .green
        
        leftStackView.addArrangedSubview(callImageView)
        leftStackView.addArrangedSubview(callLabel)
        
        let waveImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 30))
        waveImageView.image = UIImage(systemName: "waveform")
        waveImageView.tintColor = .red
        waveImageView.contentMode = .scaleAspectFit
        
        stackView.addArrangedSubview(leftStackView)
        stackView.addArrangedSubview(waveImageView)
        
        return stackView
    }()
    
    private lazy var dynamicIslandExpandedStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        
        let topStackView = UIStackView(frame: .zero)
        topStackView.translatesAutoresizingMaskIntoConstraints = false
        topStackView.axis = .horizontal
        topStackView.alignment = .center
        topStackView.spacing = 16
        
        let songCoverImage = UIImageView(frame: .zero)
        songCoverImage.image = UIImage(named: "song-cover")
        songCoverImage.layer.cornerRadius = 8
        songCoverImage.layer.masksToBounds = true
        
        let songDescriptionStackView = UIStackView(frame: .zero)
        songDescriptionStackView.axis = .vertical
        let songArtistLabel = UILabel()
        songArtistLabel.text = "THE MOVE"
        songArtistLabel.textColor = .white
        songArtistLabel.font = .systemFont(ofSize: 17, weight: .bold)
        let songTitleLabel = UILabel()
        songTitleLabel.text = "Space Rangers"
        songTitleLabel.textColor = .gray
        songTitleLabel.font = .systemFont(ofSize: 14)
        
        songDescriptionStackView.addArrangedSubview(songArtistLabel)
        songDescriptionStackView.addArrangedSubview(songTitleLabel)
        
        topStackView.addArrangedSubview(songCoverImage)
        topStackView.addArrangedSubview(songDescriptionStackView)
        
        let centerStackView = UIStackView(frame: .zero)
        centerStackView.translatesAutoresizingMaskIntoConstraints = false
        centerStackView.axis = .horizontal
        centerStackView.alignment = .center
        centerStackView.distribution = .fill
        centerStackView.spacing = 12
        
        let leftDurationLabel = UILabel()
        leftDurationLabel.translatesAutoresizingMaskIntoConstraints = false
        leftDurationLabel.text = "1:23"
        leftDurationLabel.textColor = .white
        
        let durationProgressView = UIProgressView()
        durationProgressView.translatesAutoresizingMaskIntoConstraints = false
        durationProgressView.progress = 0.5
        durationProgressView.isUserInteractionEnabled = false
        durationProgressView.progressTintColor = .white
        
        let rightDurationLabel = UILabel()
        rightDurationLabel.translatesAutoresizingMaskIntoConstraints = false
        rightDurationLabel.text = "-1:23"
        rightDurationLabel.textColor = .white
        
        centerStackView.addArrangedSubview(leftDurationLabel)
        centerStackView.addArrangedSubview(durationProgressView)
        centerStackView.addArrangedSubview(rightDurationLabel)
        
        let bottomStackView = UIStackView(frame: .zero)
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.axis = .horizontal
        bottomStackView.alignment = .fill
        bottomStackView.distribution = .fillEqually
        bottomStackView.spacing = 4
        
        let emptyView = UIView()
        emptyView.backgroundColor = .clear
        let previousImage = UIImageView(image: UIImage(systemName: "backward.fill"))
        previousImage.contentMode = .scaleAspectFit
        previousImage.tintColor = .white
        let playImage = UIImageView(image: UIImage(systemName: "play.fill"))
        playImage.contentMode = .scaleAspectFit
        playImage.tintColor = .white
        let forwardImage = UIImageView(image: UIImage(systemName: "forward.fill"))
        forwardImage.contentMode = .scaleAspectFit
        forwardImage.tintColor = .white
        let airplayImage = UIImageView(image: UIImage(systemName: "airplayaudio"))
        airplayImage.contentMode = .scaleAspectFit
        airplayImage.tintColor = .white
        
        bottomStackView.addArrangedSubview(emptyView)
        bottomStackView.addArrangedSubview(previousImage)
        bottomStackView.addArrangedSubview(playImage)
        bottomStackView.addArrangedSubview(forwardImage)
        bottomStackView.addArrangedSubview(airplayImage)
        
        stackView.addArrangedSubview(topStackView)
        stackView.addArrangedSubview(centerStackView)
        stackView.addArrangedSubview(bottomStackView)
        
        NSLayoutConstraint.activate([
            topStackView.heightAnchor.constraint(equalToConstant: 60),
            songCoverImage.heightAnchor.constraint(equalToConstant: 60),
            songCoverImage.widthAnchor.constraint(equalToConstant: 60),
            bottomStackView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        return stackView
    }()
    
    private var dynamicIslandView = UIView(frame: .zero)
    private var dynamicIslandLeadingConstraint: NSLayoutConstraint!
    private var dynamicIslandTrailingConstraint: NSLayoutConstraint!
    private var dynamicIslandHeightConstraint: NSLayoutConstraint!
    
    private let dynamicIslandCornerRadius: CGFloat = 20
    private let dynamicIslandShrunkHeight: CGFloat = 40
    private let dynamicIslandExpandedHeight: CGFloat = 180
    private let dynamicIslandShrunkHorizontalConstraint: CGFloat = 80
    private let dynamicIslandExpandedHorizontalConstraint: CGFloat = 16
    
    private let animationTimeInterval: TimeInterval = 0.4
    private let animationDampingRatio: CGFloat = 0.8
    private let animationVelocity: CGFloat = 1
    
    private var isDynamicIslandExpanded: Bool = false {
        didSet {
            isDynamicIslandExpanded ? setExpandedState() : setShrunkState()
        }
    }

    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialDynamicIsland()
        isDynamicIslandExpanded = false
    }

    private func setupInitialDynamicIsland() {
        view.backgroundColor = .systemBackground
        
        dynamicIslandView.translatesAutoresizingMaskIntoConstraints = false
        dynamicIslandView.layer.cornerRadius = dynamicIslandCornerRadius
        dynamicIslandView.backgroundColor = .black
        dynamicIslandView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapHandler)))
        view.addSubview(dynamicIslandView)
        
        dynamicIslandLeadingConstraint = dynamicIslandView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: dynamicIslandShrunkHorizontalConstraint)
        dynamicIslandTrailingConstraint = dynamicIslandView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -dynamicIslandShrunkHorizontalConstraint)
        dynamicIslandHeightConstraint = dynamicIslandView.heightAnchor.constraint(equalToConstant: dynamicIslandShrunkHeight)
        
        dynamicIslandView.addSubview(dynamicIslandShrunkStackView)
        dynamicIslandView.addSubview(dynamicIslandExpandedStackView)
        
        NSLayoutConstraint.activate([
            dynamicIslandView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            dynamicIslandLeadingConstraint,
            dynamicIslandTrailingConstraint,
            dynamicIslandHeightConstraint,
            
            dynamicIslandShrunkStackView.topAnchor.constraint(equalTo: dynamicIslandView.topAnchor, constant: 10),
            dynamicIslandShrunkStackView.leadingAnchor.constraint(equalTo: dynamicIslandView.leadingAnchor, constant: 12),
            dynamicIslandShrunkStackView.trailingAnchor.constraint(equalTo: dynamicIslandView.trailingAnchor, constant: -12),
            dynamicIslandShrunkStackView.bottomAnchor.constraint(equalTo: dynamicIslandView.bottomAnchor, constant: -10),
            
            dynamicIslandExpandedStackView.topAnchor.constraint(equalTo: dynamicIslandView.topAnchor, constant: 10),
            dynamicIslandExpandedStackView.leadingAnchor.constraint(equalTo: dynamicIslandView.leadingAnchor, constant: 12),
            dynamicIslandExpandedStackView.trailingAnchor.constraint(equalTo: dynamicIslandView.trailingAnchor, constant: -12),
            dynamicIslandExpandedStackView.bottomAnchor.constraint(equalTo: dynamicIslandView.bottomAnchor, constant: -20),
        ])
    }
    
    private func setShrunkState() {
        dynamicIslandLeadingConstraint.constant = dynamicIslandShrunkHorizontalConstraint
        dynamicIslandTrailingConstraint.constant = -dynamicIslandShrunkHorizontalConstraint
        dynamicIslandHeightConstraint.constant = dynamicIslandShrunkHeight
        
        UIView.animate(withDuration: animationTimeInterval, delay: 0, usingSpringWithDamping: animationDampingRatio, initialSpringVelocity: animationVelocity, options: .curveEaseInOut, animations: { [weak self] in
            self?.view.layoutIfNeeded()
            self?.dynamicIslandShrunkStackView.alpha = 1
            self?.dynamicIslandExpandedStackView.alpha = 0
        })
    }
    
    private func setExpandedState() {
        dynamicIslandLeadingConstraint.constant = dynamicIslandExpandedHorizontalConstraint
        dynamicIslandTrailingConstraint.constant = -dynamicIslandExpandedHorizontalConstraint
        dynamicIslandHeightConstraint.constant = dynamicIslandExpandedHeight
        
        UIView.animate(withDuration: animationTimeInterval, delay: 0, usingSpringWithDamping: animationDampingRatio, initialSpringVelocity: animationVelocity, options: .curveEaseInOut, animations: { [weak self] in
            self?.view.layoutIfNeeded()
            self?.dynamicIslandShrunkStackView.alpha = 0
            self?.dynamicIslandExpandedStackView.alpha = 1
        })
    }
    
    @objc private func tapHandler() {
        isDynamicIslandExpanded.toggle()
    }
    
}


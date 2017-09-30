import LBTAComponents


class UserCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet {
            guard let users = datasourceItem as? User else {
                return
            }
            nameLabel.text = users.name
            usernameLabel.text = users.userName
            bioTextView.text = users.bioText
            
            // Image to be loaded form this download file
            profileImageView.loadImage(urlString: users.profileImageURL)
        }
    }
    
    let profileImageView : CachedImageView = {
        
        let imageView = CachedImageView()
        imageView.image = #imageLiteral(resourceName: "profile_image")// profile_image
        imageView.layer.cornerRadius = 5
        //        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let nameLabel : UILabel = {
        let label = UILabel()
        label.text = "Ashim Dahal"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let usernameLabel : UILabel = {
        let label = UILabel()
        label.text = "@ashimdahal"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(r: 130, g: 130, b: 130)
        return label
    }()
    
    let bioTextView : UITextView = {
        let textVeiw = UITextView()
        textVeiw.text = "iPhone, iPad, iOS Programming Community. Join us to learn Swift, Objective - C and build iOS apps!"
        textVeiw.font = UIFont.systemFont(ofSize: 15)
        textVeiw.backgroundColor = .clear
        return textVeiw
    }()
    
    let followButton : UIButton = {
        let button = UIButton()
        
        button.layer.cornerRadius = 5
        button.layer.borderColor = tweeterBlue.cgColor
        button.layer.borderWidth = 1
        button.setTitle("Follow", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setImage(#imageLiteral(resourceName: "follow"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.setTitleColor(tweeterBlue, for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 0)
        return button
    }()
    
    
    override func setupViews() {
        
        super.setupViews()
        self.backgroundColor = .white
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(usernameLabel)
        addSubview(bioTextView)
        addSubview(followButton)
        
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        
        nameLabel.anchor(profileImageView.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: followButton.leftAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        
        usernameLabel.anchor(nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: nameLabel.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
        bioTextView.anchor(usernameLabel.bottomAnchor, left: usernameLabel.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: -4, leftConstant: -4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        followButton.anchor(topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 12, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 120, heightConstant: 40)
        
    }
}

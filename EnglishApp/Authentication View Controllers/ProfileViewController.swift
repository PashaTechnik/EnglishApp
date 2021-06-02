import UIKit
import Firebase

class ProfileViewController: UIViewController {
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var userLevel_label: UILabel!
    @IBOutlet weak var userPhoto: UIImageView!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var levelTextLabel: UILabel!
    @IBOutlet weak var pointsTextLabel: UILabel!
    
    @IBOutlet weak var profileWhiteView: UIView!
    @IBOutlet weak var statisticsWhiteView: UIView!
    
    
    var user: User?
    var defaultUser = User(firstName: "", lastName: "", email: "", points: 0, dictionary: [:], profileImage: UIImage(named: "profileIco"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tabbar = tabBarController as! MainTabBar
        user = tabbar.user
        
        initUser(user ?? defaultUser)
        progressBar.transform = progressBar.transform.scaledBy(x: 1, y: 8)
        progressBar.layer.cornerRadius = 10
        progressBar.clipsToBounds = true
        progressBar.layer.sublayers![1].cornerRadius = 10
        progressBar.subviews[1].clipsToBounds = true
        
        statisticsWhiteView.layer.cornerRadius = 10
        profileWhiteView.layer.cornerRadius = 10
        statisticsWhiteView.clipsToBounds = true
        profileWhiteView.clipsToBounds = true
        
        userPhoto.layer.borderWidth = 0
        userPhoto.layer.masksToBounds = false
        userPhoto.layer.borderColor = .none
        userPhoto.layer.cornerRadius = userPhoto.frame.height/2
        userPhoto.clipsToBounds = true
        
    }

    
    override func viewDidAppear(_ animated: Bool) {
        initUser(user ?? defaultUser)
    }
    
    func initUser(_ user: User){
        userPhoto.image = CurrentUser.Image
        userLevel_label.text = getLevel(user.points).0
        levelTextLabel.text = String(getLevel(user.points).1) + " Level"
        usernameLabel.text = user.firstName
        let currentPoints = user.points
        let toGoalPoint = 300
        pointsTextLabel.text = String(currentPoints) + "/" + String(toGoalPoint)
        progressBar.progress = Float(user.points)
    }
    
    
    func getLevel(_ points: Int) -> (String,Int){
        var englishLevel: String
        var englishLevelNum: Int
        
        switch points {
        case 0...100:
            englishLevel = "Beginner"
            englishLevelNum = 1
        case 101...200:
            englishLevel = "Elementary"
            englishLevelNum = 2
        case 201...300:
            englishLevel = "Intermediate"
            englishLevelNum = 3
        case 301...400:
            englishLevel = "Upper Intermediate"
            englishLevelNum = 4
        default:
            englishLevel = "Advanced"
            englishLevelNum = 5
        }
        
        return (englishLevel,englishLevelNum)
    }
    
    
    @IBAction func logout(_ sender: Any) {
        do{
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
        
    }
    
    @IBAction func editPhotoBtn(_ sender: Any) {
        let cameraIcon = UIImage(named: "camera")
        let photoIcon = UIImage(named: "photo")
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let camera = UIAlertAction(title: "Camera", style: .default) { _ in
            self.chooseImagePicker(source: .camera)
        }
        camera.setValue(cameraIcon, forKey: "image")
        camera.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
        let photo = UIAlertAction(title: "Photo", style: .default) { _ in
            self.chooseImagePicker(source: .photoLibrary)
        }
        photo.setValue(photoIcon, forKey: "image")
        photo.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        actionSheet.addAction(photo)
        actionSheet.addAction(camera)
        actionSheet.addAction(cancel)
        present(actionSheet, animated: true)
        
    }
}


extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func chooseImagePicker(source: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated: true)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any] ) {
        userPhoto.image = info[.editedImage] as? UIImage
        userPhoto.contentMode = .scaleAspectFill
        userPhoto.clipsToBounds = true
        NetworkManager.saveImageToStorage(image: info[.editedImage] as? UIImage)
        dismiss(animated: true)
    }
}


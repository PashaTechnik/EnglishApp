

import UIKit

class ReadingViewController: UIViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    var myControllers = [UIViewController]()
    
    @IBAction func goToTabBarBack(_ sender: Any) {
        performSegue(withIdentifier: "goToTabBarBack", sender: self)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let vc = UIViewController()
        vc.view.backgroundColor =  .red
        myControllers.append(vc)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
            self.presentPageVC()
        })
    }
    
    func presentPageVC() {
        guard let first = myControllers.first else {
            return
        }
        let vc = UIPageViewController(transitionStyle: .pageCurl, navigationOrientation: .horizontal, options: nil)
        vc.delegate = self
        vc.dataSource = self
        vc.setViewControllers([first], direction:.forward, animated: true, completion: nil)
        
        present(vc, animated: true, completion: nil)
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return nil
    }

}

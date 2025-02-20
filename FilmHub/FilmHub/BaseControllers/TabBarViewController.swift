import UIKit

enum Tabs: Int {
    case mainScreen
    case profileScreen
}

class TabBarViewController: UITabBarController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        tabBar.backgroundColor = .white
        
        tabBar.tintColor = Resources.Colors.TabBar.active
        tabBar.barTintColor = Resources.Colors.TabBar.inactive

        let profileViewModel = ProfileViewModel()
        let profileController = ProfileViewController(viewModel: profileViewModel)

        let mainViewModel = MainViewModel()
        let mainScreenController = MainViewController(viewModel: mainViewModel)

        let mainScreenNavigation = NavBarViewController(rootViewController: mainScreenController)
        let profileScreenNavigation = NavBarViewController(rootViewController: profileController)

        mainScreenNavigation.tabBarItem = UITabBarItem(
            title: Resources.Strings.TabBar.mainScreen, 
            image: Resources.Images.TabBar.homePage,
            tag: Tabs.mainScreen.rawValue
        )

        profileScreenNavigation.tabBarItem = UITabBarItem(
            title: Resources.Strings.TabBar.profileScreen,
            image: Resources.Images.TabBar.profilePage,
            tag: Tabs.profileScreen.rawValue
        )
        
        setViewControllers([
            mainScreenNavigation,
            profileScreenNavigation
        ], animated: false)
    }
}

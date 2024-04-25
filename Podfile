platform :ios, '14.0'

target 'WaiterApp' do
  use_frameworks!

  # Pods for WaiterApp
pod 'SnapKit'
pod 'SwiftGen'
pod 'IQKeyboardManagerSwift'
pod 'SwipeCellKit'
pod 'FittedSheets'
pod 'Alamofire'
pod 'Swinject', '~> 2.6.1'
pod 'SwinjectStoryboard'
pod 'SwinjectAutoregistration', '~> 2.6.1'
pod 'KeychainAccess'
pod 'SDWebImage'
pod 'XLPagerTabStrip'
pod 'FirebaseFirestore'
pod 'FirebaseFirestoreSwift'
pod 'Firebase'
pod 'Firebase/Core'

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.0'
    end
  end
end

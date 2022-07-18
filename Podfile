# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

flutter_application_path = './flutter_comma'
load File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')

target 'Comma' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Comma
  pod 'Alamofire'
  pod 'SnapKit'
  pod 'RxSwift'
  pod 'RxGesture'
  pod 'RxCocoa'
  pod 'RxKeyboard'
  pod 'SwiftyJSON'
  pod 'SwiftDate' 
  pod 'BSImagePicker'
  pod 'Firebase/Analytics'
  pod 'Firebase/Crashlytics'
  pod 'Firebase/Firestore'
  pod 'Firebase/Storage'
  pod 'lottie-ios'
  pod 'KakaoSDKAuth'
  pod 'KakaoSDKUser'
  install_all_flutter_pods(flutter_application_path)
end

post_install do |installer|
	flutter_post_install(installer) if defined? (flutter_post_install)
end

//
//  MapVC.swift
//  Comma
//
//  Created by myungsun on 2022/07/20.
//

import UIKit
import MapKit
class MapVC: UIViewController {
    // MKMapView
    @IBOutlet weak var mapView: MKMapView!
    
    // Constants
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(3000)) {
            self.showStampScreen()
        }
    }
    
    private func initUI() {
        configureMapView()
    }
    
    private func configureMapView() {
        locationManager.delegate = self
        // 정확도를 최고로 설정
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // 위치 데이터를 추적하기 위해 사용자에게 승인 요구
        locationManager.requestWhenInUseAuthorization()
        // 위치 업데이트를 시작
        locationManager.startUpdatingLocation()
        // 위치 보기 설정
        mapView.showsUserLocation = true
    }
    
    private func showStampScreen() {
        let stampVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "StampVC") as! StampVC
        
        stampVC.modalPresentationStyle = .overFullScreen
        self.present(stampVC, animated: false)
    }
}

extension MapVC: CLLocationManagerDelegate {
    // 위도와 경도, 스팬(영역 폭)을 입력받아 지도에 표시
   func goLocation(latitudeValue: CLLocationDegrees,
                   longtudeValue: CLLocationDegrees,
                   delta span: Double) -> CLLocationCoordinate2D {
       let pLocation = CLLocationCoordinate2DMake(latitudeValue, longtudeValue)
       let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
       let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
       mapView.setRegion(pRegion, animated: true)
       return pLocation
   }
    
    // 위치 정보에서 국가, 지역, 도로를 추출하여 레이블에 표시
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last
        _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!,
                   longtudeValue: (pLocation?.coordinate.longitude)!,
                   delta: 0.01)
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {(placemarks, error) -> Void in

        })
        locationManager.stopUpdatingLocation()
    }
}



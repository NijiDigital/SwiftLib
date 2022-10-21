//
//  CLLocation+Utils.swift
//

import CoreLocation

public extension CLLocation {
    func reverseGeocode(completion: @escaping (_ clPlacemarks: [CLPlacemark]?, _ error: Error?) -> Void) {
        CLGeocoder().reverseGeocodeLocation(self, completionHandler: completion)
    }
}

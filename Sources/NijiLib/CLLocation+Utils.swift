//
//  CLLocation+Extension.swift
//  shootproof
//
//  Created by Erwan TILLY on 17/01/2020.
//  Copyright © 2020 Niji. All rights reserved.
//

import CoreLocation

public extension CLLocation {
    func reverseGeocode(completion: @escaping (_ clPlacemarks: [CLPlacemark]?, _ error: Error?) -> Void) {
        CLGeocoder().reverseGeocodeLocation(self, completionHandler: completion)
    }
}

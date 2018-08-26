//
//  UploadingResult.swift
//  GiststestApp
//
//  Created by Aleev Alexey on 26/08/2018.
//  Copyright © 2018 WayRay. All rights reserved.
//

import UIKit

enum UploadingResult<ResultType> {
    case success(ResultType)
    case fail(Error)
}

//
//  MBUserModel.swift
//  LaoCoVat
//
//  Created by Michael Thompson on 1/6/19.
//  Copyright © 2019 Michael Thompson. All rights reserved.
//

import UIKit

@objc public class APUserModel:NSObject{
    
    @objc public var faces:Array<UIImage> = Array<UIImage>()
    @objc public var faceId:String = ""
    @objc public var metaData:String = ""
//    @objc public var userId:String = ""
//    @objc public var name:String = ""
//    @objc public var phone:String = ""
//    @objc public var email:String = ""
//    @objc public var gender:Int = 0
//    @objc public var avatar:String = ""
//    @objc public var company:String = ""
//    @objc public var location:String = ""
    
    required init(_ dict:Dictionary<String, Any>){
        super.init()
        faceId = dict["face_id"] as? String ?? ""
        metaData = dict["meta_data"] as? String ?? ""
        
//        email = dict["email"] as? String ?? ""
//        gender = dict["sex"] as? Int ?? 0
    }
    
    public override init() {
        super.init()
    }
    
//    email = "diepvd@egroup.vn";
//    fullname = "Diep Vuong ";
//    id = "f51320cd-923e-4ae7-bbea-76d999dee143";
//    phone = 0888555151;
//    sex = 1;
}

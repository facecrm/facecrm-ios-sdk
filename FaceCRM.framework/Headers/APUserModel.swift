import UIKit

@objc public class APUserModel:NSObject{
    
    @objc public var faces:Array<UIImage> = Array<UIImage>()
    @objc public var faceId:String = ""
    @objc public var metaData:String = ""
    
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
    

}

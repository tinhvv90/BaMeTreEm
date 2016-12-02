//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class HocSinh {
    var name: String?
    
    func hoc() {
        print("Em dang hoc")
        name
        
        
    }
    
    
}
typealias HocSinhHocBai = () -> Void
class GiaoVien{
    func dayhoc(hocsinhHoc: HocSinhHocBai) {
        hocsinhHoc()
        
    }
}

var gv = GiaoVien()
var hs = HocSinh()
gv.dayhoc(hocsinhHoc: hs.hoc)

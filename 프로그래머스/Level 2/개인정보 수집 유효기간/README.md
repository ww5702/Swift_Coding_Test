```
import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    // 오늘 날짜 8글자로 만들기
    let today = today.components(separatedBy:".")
    var year = Int(today[0])!
    var month = Int(today[1])!
    var day = Int(today[2])!
    
    var reterms = [String:Int]()
    // 기한 딕셔너리로 나누기
    for i in terms {
        var split = i.split(separator:" ")
        reterms[String(split[0])] = Int(split[1])
    }
    print(reterms)
    // 구해야하는 privacies 나누기
    var rePrivacies = [String:String]()
    for i in privacies {
        var split = i.split(separator:" ")
        rePrivacies[String(split[0])] = String(split[1])
    }
    //print(rePrivacies)
    
    for (i,j) in rePrivacies {
        var dateSplit = i.split(separator:".")
        var yyear = Int(dateSplit[0])!
        var mmonth = Int(dateSplit[1])!
        var dday = Int(dateSplit[2])!
        
        var expire = reterms[j]!
        
        
        
        
        print(dateSplit)
    }
    
    return []
}
```

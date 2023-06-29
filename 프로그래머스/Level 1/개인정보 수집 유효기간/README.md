첫 제출   
입력을 딕셔너리로 따로 받고   
유효기간을 더했을때 넘었다면 append를 해줬다.   
```
import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    // 오늘 날짜 8글자로 만들기
    let today = today.components(separatedBy:".").joined()
    // var year = Int(today[0])!
    // var month = Int(today[1])!
    // var day = Int(today[2])!
    
    var reterms = [String:Int]()
    // 기한 딕셔너리로 나누기
    for i in terms {
        var split = i.split(separator:" ")
        reterms[String(split[0])] = Int(split[1])
    }
    //print(reterms)
    // 구해야하는 privacies 나누기
    var rePrivacies = [String:String]()
    var num = 0
    for i in privacies {
        num += 1
        var split = i.split(separator:" ")
        rePrivacies[String(split[0])+"."+String(num) ] = String(split[1])
    }
    //print(rePrivacies)
    
    var result : [Int] = []
    
    for (i,j) in rePrivacies {
        var dateSplit = i.split(separator:".")
        var yyear = Int(dateSplit[0])!
        var mmonth = Int(dateSplit[1])!
        var dday = Int(dateSplit[2])!
        
        var expire = reterms[j]!
        //print(dateSplit)
        mmonth += expire
        if mmonth > 12 {
            yyear += 1
            mmonth -= 12
            dday -= 1
        } else {
            dday -= 1
        }
        
        if dday == 0 {
            mmonth -= 1
            dday = 28
        }
        
        //print(yyear, mmonth, dday)
        var compareToday: String = ""
        if mmonth < 10 {
            if dday < 10 {
                compareToday = "\(yyear)0\(mmonth)0\(dday)"
            } else {
                compareToday = "\(yyear)0\(mmonth)\(dday)"
            }
        } else {
            if dday < 10 {
                compareToday = "\(yyear)\(mmonth)0\(dday)"
            } else {
                compareToday = "\(yyear)\(mmonth)\(dday)"
            }
        }
        
        if Int(compareToday)! < Int(today)! {
            result.append(Int(dateSplit[3])!)
        }
    }
    
    return result.sorted()
}
```

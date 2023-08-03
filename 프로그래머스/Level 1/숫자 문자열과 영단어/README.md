첫 제출   
문자 0~9를 unicodescalar로 변환하여 일정 값들 사이라면 숫자 출력   
그리고 아니라면 temp에 저장한다.   
저장한 temp가 영단어와 같아진다면 해당 숫자를 추가   
```
import Foundation

func solution(_ s:String) -> Int {
    var s = s.map{String($0)}
    var result: String = ""
    var temp = ""
    
    for i in s {
        // 만약 숫자라면 continue
        if UnicodeScalar(i)!.value >= 48 && UnicodeScalar(i)!.value <= 57 {
            result.append(i)
        } else {
            temp.append(i)
        }
        
        switch(temp) {
            case "zero":
            result.append("0")
            temp = ""
            break
            case "one":
            result.append("1")
            temp = ""
            break
            case "two":
            result.append("2")
            temp = ""
            break
            case "three":
            result.append("3")
            temp = ""
            break
            case "four":
            result.append("4")
            temp = ""
            break
            case "five":
            result.append("5")
            temp = ""
            break
            case "six":
            result.append("6")
            temp = ""
            break
            case "seven":
            result.append("7")
            temp = ""
            break
            case "eight":
            result.append("8")
            temp = ""
            break
            case "nine":
            result.append("9")
            temp = ""
            break
            default:
            break
            
        }
        
    }
    return Int(result)!
}
```
두번째 제출   
위의 해결방법과 같은 기능을 하는 함수가 있다.   
replacingOccurrences이다.   
string안의 문자중 arr[i]와 같은 문자를 String(i)로 변형해주는 기능이다.   

```
import Foundation

func solution(_ s:String) -> Int {
    let arr = ["zero","one","two","three","four","five","six","seven","eight","nine"]
    var str = s
    for i in 0..<arr.count {
        str = str.replacingOccurrences(of: arr[i], with: String(i))
    }
    return Int(str)!
}
```

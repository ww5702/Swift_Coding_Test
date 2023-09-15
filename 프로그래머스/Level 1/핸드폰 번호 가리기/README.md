subrange를 이용해 뒤의 4칸을 제외한 나머지는 *로 나머지는 그대로 출력하여 합쳤다.   

```
func solution(_ phone_number:String) -> String {
    var num = phone_number.map{String($0)}
    var result = ""
    for i in 0..<num.count-4 {
        result += "*"
    }
    // print(result)
    // print(num[num.count-4...num.count-1].joined())
    return result + num[num.count-4...num.count-1].joined()
}
```

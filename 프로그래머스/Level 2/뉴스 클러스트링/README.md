```
func solution(_ str1:String, _ str2:String) -> Int {
    var str1 = str1.map{String($0)}
    var str2 = str2.map{String($0)}
    var newstr1: [String] = []
    var newstr2: [String] = []
    for i in 0..<str1.count-1 {
        let first = Int(UnicodeScalar(str1[i].uppercased())!.value)
        let second = Int(UnicodeScalar(str1[i+1].uppercased())!.value)
        if first >= 65 && first <= 90 && second >= 65 && second <= 90 {
            newstr1.append(str1[i].uppercased()+str1[i+1].uppercased())
        }
    }
    
    for i in 0..<str2.count-1 {
        let first = Int(UnicodeScalar(str2[i].uppercased())!.value)
        let second = Int(UnicodeScalar(str2[i+1].uppercased())!.value)
        if first >= 65 && first <= 90 && second >= 65 && second <= 90 {
            newstr2.append(str2[i].uppercased()+str2[i+1].uppercased())
        }
    }
    var plus: [String] = []
    plus += newstr1
    plus += newstr2
    var resultplus = Set<String>(plus).count
    var resultminus = 0
    print(resultplus)
    for i in newstr1 {
        if newstr2.contains(i) { resultminus += 1 }
    }
    print(resultminus)
    var result: Double = Double(resultminus) / Double(resultplus)
    print(result)
    return 0
}
```

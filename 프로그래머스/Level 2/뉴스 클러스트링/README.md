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
주어진 값들을 조건에 맞춰서 return해준다.   
```
func solution(_ str1:String, _ str2:String) -> Int {
    let str1Arr = Array(str1)
    let str2Arr = Array(str2)
    
    var str1arr: [String] = []
    var str2arr: [String] = []
    // str1을 두 글자씩 합치기
    for i in 0..<str1Arr.count - 1 {
        if str1Arr[i].isLetter && str1Arr[i+1].isLetter{
            str1arr.append("\(str1Arr[i].uppercased())\(str1Arr[i+1].uppercased())")
        }
    }
    // str2를 두 글자씩 합치기
    for i in 0..<str2Arr.count - 1 {
        if str2Arr[i].isLetter && str2Arr[i+1].isLetter{
            str2arr.append("\(str2Arr[i].uppercased())\(str2Arr[i+1].uppercased())")
        }
    }
    
    var allCnt =  str1arr.count + str2arr.count
    var myCnt = 0
    // A 교집합 B 구하기
    for i in str1arr.indices{
        for j in str2arr.indices{
            if str1arr[i] == str2arr[j]{
                myCnt += 1
                str2arr.remove(at: j)
                break
            }
        }
    }
    // A 합집합 B = A + B - A 교집합 B
    allCnt -= myCnt
    
    if allCnt == 0{ // A와 집합 B가 모두 공집합일 경우에는 나눗셈이 정의되지 않으니 따로 J(A, B) = 1
        return 65536
    }
    else if myCnt == 0{
        return 0
    }
    else{
        return Int(Double(myCnt) / Double(allCnt) * 65536)
    }
}
```

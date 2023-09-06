```
radix를 이용해 배열을 2진수로 바꿔준 뒤 n개의 길이만큼 앞을 0으로 채워준다.
둘중 하나라도 1이라면 #를 둘다 0이라면 띄어쓰기를 넣어준다.

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    for i in 0..<n {
        var a1 = String(arr1[i],radix: 2).map{String($0)}
        var a2 = String(arr2[i],radix: 2).map{String($0)}
        // n자리까지 안채워져있다면 앞은 전부 0으로
        while a1.count != n {
            a1.insert("0", at: 0)
        }
        while a2.count != n {
            a2.insert("0", at: 0)
        }
        var input = ""
        for j in 0..<n {
            if a1[j] == "0" && a2[j] == "0" {
                input += " "
            } else {
                input += "#"
            }
        }
        
        answer.append(input)
    }
    //print(answer)
    return answer
}
```

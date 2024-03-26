dfs를 이용해 마지막 글자보다 더 뒷 글자라면 한글자씩 추가해준다   
l개의 개수가 만들어지면 모음과 자음의 수를 판별하여 조건에 만족한다면 추가한다.   

```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (l,c) = (input[0],input[1])
    let word = readLine()!.split(separator: " ").map{String($0)}
    let value = ["a","e","i","o","u"]
    var result: [String] = []
    // 97 ~ 122
    func dfs(_ target: Int, _ arr: [String]) {
        if arr.count == target {
            var moem = 0
            var jaem = 0
            for ar in arr {
                if value.contains(ar) {
                    moem += 1
                } else {
                    jaem += 1
                }
            }
            //print(arr,moem, jaem)
            if moem >= 1 && jaem >= 2 {
                let str = arr.joined()
                result.append(str)
            }
            return
        }
        
        for i in 0..<c{
            if arr.isEmpty {
                dfs(target, arr+[word[i]])
            } else {
                let now = UnicodeScalar(word[i])!.value
                if (UnicodeScalar(arr.last!)!.value < now) {
                    dfs(target, arr+[word[i]])
                }
            }
        }
    }
   
    
    dfs(l, [])
    for r in result.sorted() {
        print(r)
    }
}
solution()

```

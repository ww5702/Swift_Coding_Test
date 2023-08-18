확장을 이용해서 string의 부분문자열을 구해주었다.   
그리고 구해진 부분문자열을 서로 비교하며 결과값에 추가해주었고, 최소값을 남겨두었다.   
```
import Foundation
extension String {
    func split(by length: Int) -> [String] {
        var startIndex = self.startIndex
        var results = [Substring]()

        while startIndex < self.endIndex {
            let endIndex = self.index(startIndex, offsetBy: length, limitedBy: self.endIndex) ?? self.endIndex
            results.append(self[startIndex..<endIndex])
            startIndex = endIndex
        }

        return results.map { String($0) }
    }
}
func solution(_ s:String) -> Int {
    var min = s.count
    var result: String = ""
    for i in 1...s.count {
        var word = s.split(by: i)
        //print(word)
        var temp = word[0]
        var cnt = 1
        for w in 1..<word.count {
            if temp == word[w] {
                cnt += 1
            } else {
                if cnt > 1 {
                    result.append("\(cnt)\(temp)")
                    temp = word[w]
                    cnt = 1
                } else {
                    result.append(temp)
                    temp = word[w]
                    cnt = 1
                }
            }
        }
        result.append(cnt > 1 ? "\(cnt)\(temp)" : temp)
        min = min > result.count ? result.count : min
        //print(result, min)
        result = ""
    }
    return min
}
```

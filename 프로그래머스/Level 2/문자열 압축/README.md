확장을 이용해서 string의 부분문자열을 구해주었다.   
그리고 구해진 부분문자열을 서로 비교하며 결과값에 추가해주었고, 최소값을 남겨두었다.   
```
import Foundation
extension String {
    func split(by length: Int) -> [String] {
        var startIndex = self.startIndex
        var results = [Substring]()

        // length길이만큼 증가하면서 부분문자열 배열을 append
        while startIndex < self.endIndex {
            let endIndex = self.index(startIndex, offsetBy: length, limitedBy: self.endIndex) ?? self.endIndex
            // 시작지점부터 ~ +length까지
            results.append(self[startIndex..<endIndex])
            // 끝지점을 시작지점으로 
            startIndex = endIndex
        }
        
        return results.map { String($0) }
    }
}
func solution(_ s:String) -> Int {
    // 압축한 문자열을 담을 result, 압축한 단위에 따른 최소값 비교를 위한 min
    var min = s.count
    var result: String = ""
    // 1단어 단위부터 전체 문자열 단위까지 차례로 자르기 위한 반복문
    for i in 1...s.count {
        // i단위로 자른 문자열을 담은 word
        var word = s.split(by: i)
        //print(word)
        // 초기값 설정및 비교를 위한 temp, 반복된 횟수를 세기 위한 cnt 
        var temp = word[0]
        var cnt = 1
        // 자른 문자열을 1부터 끝까지 확인할 반복문
        for w in 1..<word.count {
            // 만약 같은 문자라면 cnt += 1
            if temp == word[w] {
                cnt += 1
            } else {
            // 만약 문자가 다르다면 append
                if cnt > 1 {
                    result.append("\(cnt)\(temp)")
                    temp = word[w]
                    cnt = 1
                } else {
                // 하지만 cnt가 1이라면 1a가 아닌 a 이렇게 append
                    result.append(temp)
                    temp = word[w]
                    cnt = 1
                }
            }
        }
        // 마지막 temp와 cnt를 넣어줘야 마지막 문자열까지 들어간다.
        result.append(cnt > 1 ? "\(cnt)\(temp)" : temp)
        // 각각의 result의 자릿수를 비교하여 최소값만을 남겨준다.
        min = min > result.count ? result.count : min
        //print(result, min)
        // 다시 result 초기화
        result = ""
    }
    return min
}
```

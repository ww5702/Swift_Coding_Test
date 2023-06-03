import Foundation

func solution(_ s:String) -> Int {
    // 자르는 단위는 1부터 /2 까지 가능하다. s의 길이가 1이나 2이면 압축을 해도 그대로이기에 초반은 그대로 return
    if s.count < 3 { return s.count }
    var result: Int = s.count
    
    for length in 1...s.count/2 {
        let slicedSting = sliceString(s, length)
        let compressedString = compressString(slicedSting)
        let length = compressedString.count
        if length < result { result = length }
    }
    return result
}
// 문자열 정해진 길이로 자르기
// 정해진 길이 length만큼 문자열을 잘라 배열 형태로 반환하는 함수
func sliceString(_ str: String, _ length: Int) -> [String] {
    var result: [String] = []
    var temp = ""
    
    for s in str {
        temp += String(s)
        if temp.count >= length {
            result.append(temp)
            temp = ""
        }
    }
    if temp != "" { result.append(temp) }
    print(result)
    return result

}

// 문자열 배열 압축하기
func compressString(_ array: [String]) -> String {
    var result: String = ""
        var temp: String = ""
        var count: Int = 1
        
        for str in array {
            if temp == str {
                count += 1
            } else {
                if temp != "" {
                    result += (count > 1) ? "\(count)\(temp)" : "\(temp)"
                }
                temp = str
                count = 1
            }
        }
        
        if temp != "" { result += (count > 1) ? "\(count)\(temp)" : "\(temp)" }
    print(result)
        return result
}
let s = readLine()!
print(solution(s))

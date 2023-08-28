여벌 체육복을 가져온 학생이 체육복을 도난당했을 경우를 먼저 제거해주고   
여벌 체육복을 가져온 학생이 앞 번호를 먼저 빌려주고 앞번호가 없다면 뒷번호를 빌려주는 경우가   
가장 많이 빌려줄 수 있는 경우이다.   
```
import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    // 여벌 체육복을 가져온 학생이 체육복을 도난당했을 경우
    let losted = lost.filter{ !reserve.contains($0) }.sorted()
    var reserved = reserve.filter{!lost.contains($0) }.sorted()
    //print(losted, reserved)

    var reserve = reserved
    var lost = losted
    var cnt = 1
    while true {
        if cnt == lost.count { break }
        for l in lost {
            if reserve.contains(l) {
                
            }
        }
        
        cnt += 1
    }
    for r in reserve {
        if lost.count == 0 { break }
        if lost.contains(r-1) {
            let index = lost.firstIndex(of:r-1)
            lost.remove(at : index!)
        } else if lost.contains(r+1) {
            let index = lost.firstIndex(of:r+1)
            lost.remove(at : index!)
        }
    }
    
    return n-lost.count
}
```
firstIndex를 사용하지 않고도 반복문을 0..<reserve.count를 사용한다면 i를 사용해 바로 삭제할 수 있다.   
```
import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    // 여벌 체육복을 가져온 학생이 체육복을 도난당했을 경우
    let losted = lost.filter{ !reserve.contains($0) }.sorted()
    var reserved = reserve.filter{!lost.contains($0) }.sorted()
    //print(losted, reserved)
    var result = n - losted.count

    for l in losted {
        for r in 0..<reserved.count {
            if l == reserved[r]-1 || l == reserved[r]+1 {
                reserved.remove(at: r)
                result += 1
                
                break
            }
        }
    }
    
    return result
}
```

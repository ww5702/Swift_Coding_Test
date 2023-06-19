```
import Foundation

func solution(_ sequence:[Int], _ k:Int) -> [Int] {
    var sum = sequence[0]
    var p1 = 0
    var p2 = 0
    var ans: [[Int]] = []
    
    while p1 < sequence.count && p2 < sequence.count {
        // sum이 k와 같다면 배열에 저장
        if sum == k {
            ans.append([p1,p2])
        }
        // 합이 k보다 작다면 오른쪽으로 한칸 증가
        // 합이 k보다 크다면 왼쪽칸을 한칸 증가시키면서 기존값 뺴기
        if sum <= k {
            p2 += 1
            if p2 == sequence.count { break }
            sum += sequence[p2]
        } else {
            sum -= sequence[p1]
            p1 += 1
        }
    }
    // 이제 정렬
    ans = ans.sorted(by: {
        // 만약 차이가 같다면 앞에것을 선택
        if $0[1] - $0[0] == $1[1] - $1[0] {
            return $0[0] < $1[0]
        } else {
        // 만약 차이가 있다면 더 작은것을 먼저
            return $0[1] - $0[0] < $1[1] - $1[0]
        }
    })
    
    return ans.isEmpty ? [] : ans[0]
}
```

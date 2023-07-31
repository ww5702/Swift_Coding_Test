길이가 10,000이므로 이중반복문으로는 해결할 수 없다   
문제가 한쪽으로 최대값을 몰아서 넣으면 해결되는 문제이기에   
배열마다 정렬을 하고 가로 세로 배열에 append를 해준다.   
가로 세로 각각의 배열마다 최대값들을 곱해준다면 최소값으로 모든 배열들을 포함할 수 있다.   
```
import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    var sizes = sizes
    var x: [Int] = []
    var y: [Int] = []
    
    for s in 0..<sizes.count {
        sizes[s].sort()
        x.append(sizes[s][0])
        y.append(sizes[s][1])
    }
    return x.max()! * y.max()!
}
```

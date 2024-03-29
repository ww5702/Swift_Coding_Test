```
import Foundation

func solution(_ line:[[Int]]) -> [String] {
    // 1. x, y 위치 저장용 배열
    var location: [(x: Int, y: Int)] = []
    // 2. x 의 최대 최솟값과 y 의 최대 최솟값을 저장하기 위한 값
    var maxX = Int.min
    var minX = Int.max
    var maxY = Int.min
    var minY = Int.max

    
    for i in 0..<line.count - 1 {
        for j in i + 1..<line.count {
            // 4. Ax + By + E 에서 ABE 값
            let abe = line[i]
            // 5. Cx + Dy + F 에서 CDF 값
            let cdf = line[j]
            // 6. AD - BC
            let adbc = abe[0] * cdf[1] - abe[1] * cdf[0]
            // 7. BF - ED
            let bfed = abe[1] * cdf[2] - abe[2] * cdf[1]
            // 8. EC - AF
            let ecaf = abe[2] * cdf[0] - abe[0] * cdf[2]

            // 9. 만약 AD - BC 는 0 이 아니고, 교점 x ( BF - ED / AD - BC ) 와 y ( EC - AF / AD - BC) 가 둘다 정수로 나눠 떨어지면
            if adbc != 0 && bfed % adbc == 0 && ecaf % adbc == 0 {
                // 10. location 배열에 x, y 값을 추가함
                location.append((bfed / adbc, ecaf / adbc))

                // 11. x, y 의 최댓값과 최솟값 갱신
                maxX = max(location.last!.x, maxX)
                minX = min (location.last!.x, minX)
                maxY = max(location.last!.y, maxY)
                minY = min(location.last!.y, minY)
            }
        }
    }
    
    // 12. 결과를 얻기 위해 사용할 배열
    // 크기는 maxX - minX + 1 과 maxY - minY + 1 로 2차원 배열 설정함
    // 가로가 X 축, 세로가 Y 축이므로 배열도 동일하게 생성
    var arr = Array(repeating: Array(repeating: ".", count: maxX - minX + 1), count: maxY - minY + 1)

    // 13. 저장된 x, y 에 따라 배열에 값을 갱신함
    for location in location {
        arr[location.y - minY][location.x - minX] = "*"
    }

    // 14. 결과 저장용
    var result: [String] = []

    // 15. swift 에서는 일반 좌표 평면처럼 좌측 하단 시작이 아닌 좌측 상단 시작이므로
    // 배열을 뒤집어서 결과값을 저장해야함
    for arr in arr.reversed() {
        result.append(arr.reduce("", +))
    }

    return result
}
```
오랜만에 다시 풀엇을때   
결국 풀이 방식은 똑같았다.   
구현을 어떤 방식으로 더 빠르게 해결 할 수 있는지가 관건   
```
import Foundation

func solution(_ line:[[Int]]) -> [String] {
    var xpoint: Double = 0
    var ypoint: Double = 0
    var (xMax,xMin,yMax,yMin) = (-100000,100000,-100000,100000)
    var list: [[Int]] = []
    func find_point(_ a: [Int], _ b: [Int]) {
        let xWhat = a[0]*(-b[1]) - (b[0]*(-a[1]))
        var numWhat = b[2]*(-a[1]) - (a[2]*(-b[1]))
        if xWhat != 0 && numWhat != 0 { xpoint = Double(numWhat) / Double(xWhat) }
        let yWhat = a[1]*(-b[0]) - (b[1]*(-a[0]))
        numWhat = b[2]*(-a[0]) - (a[2]*(-b[0]))
        if yWhat != 0 && numWhat != 0 { ypoint = Double(numWhat) / Double(yWhat)}
    }
    for i in 0..<line.count-1 {
        for j in i+1..<line.count {
            find_point(line[i], line[j])
            if Double(Int(xpoint)) == xpoint && Double(Int(ypoint)) == ypoint {
                list.append([Int(xpoint),Int(ypoint)])
                xMax = xMax < Int(xpoint) ? Int(xpoint) : xMax
                xMin = xMin < Int(xpoint) ? xMin : Int(xpoint)
                yMax = yMax < Int(ypoint) ? Int(ypoint) : yMax
                yMin = yMin < Int(ypoint) ? yMin : Int(ypoint)
            }
        }
    }
    list.sort(by: {
        $0[1] == $1[1] ? $0[0] < $1[0] : $0[1] > $1[1]
    })
    print(list)
    var cnt = 0
    var strcnt = 0
    var result: [String] = []
    for y in yMax...yMin {
        for x in xMin...xMax {
            if list[cnt] == [x,y] {
                result[strcnt].append("*")
                cnt += 1
            }else {
                result[strcnt].append(".")
            }
            print(y,x)
        }
        strcnt += 1
    }
    return []
}
```

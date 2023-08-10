배열을 저장할 string과 같은 기준일때 점수들을 기록할 [Int]로 딕셔너리를 구성한다.   
예를들어 java backend senior pizza 150이라면   
javabackendseniorpizza 라는 string key에 150점을 append해주는것이다.   
그리고 java - senior pizza또한 위의 조건을 만족시키므로   
java - / backend - / senior - / pizza - 를 전부 돌면서 dictionary를 추가해준다.   
```
import Foundation

func solution(_ info:[String], _ query:[String]) -> [Int] {
    var db: [String: [Int]] = [:]
    var result: [Int] = []
    
    // 정보 입력
    for i in info {
        let arr = i.components(separatedBy:" ")
        let languages = [arr[0], "-"]
        let jobs = [arr[1], "-"]
        let careers = [arr[2], "-"]
        let soulFood = [arr[3], "-"]
        let score = Int(arr[4])!
        
        for l in languages {
            for j in jobs {
                for c in careers {
                    for s in soulFood {
                        let key = "\(l)\(j)\(c)\(s)"
                        if db[key] == nil {
                            db[key] = [score]
                        } else {
                            db[key]?.append(score)
                        }
                    }
                }
            }
        }
    }
    
    for d in db {
        let sortArr = d.value.sorted()
        db[d.key] = sortArr
    }
    
    for q in query {
        let arr = q.components(separatedBy:" ")
        let key = "\(arr[0])\(arr[2])\(arr[4])\(arr[6])"
        let score = Int(arr[7])!
        
        if let scoreArr = db[key] {
            var low = 0
            var high = scoreArr.count-1
            var mid = 0
            
            while low <= high {
                mid = (low+high)/2
                if scoreArr[mid] < score {
                    low = mid + 1
                } else {
                    high = mid - 1
                }
            }
            result.append(scoreArr.count - low)
        } else {
            result.append(0)
        }
    }
    return result
}
```

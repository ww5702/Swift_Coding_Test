가장 많이 들은 장르를 고르기 위해 bestGenres를   
가장 많이 들은 곡을 고르기 위해 bestSongs 딕셔너리를 만들었다.   

```
import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var bestGenres: [String:Int] = [:]
    var bestSongs: [String: [Int]] = [:]
    for song in 0..<genres.count {
        let genre = genres[song]
        let play = plays[song]
        // 재생수 계산
        let store = bestGenres[genre] ?? 0
        bestGenres[genre] = store + play
        // 각 장르별 재생수
        var value = bestSongs[genre] ?? []
        value.append(play)
        bestSongs[genre] = value
    }
    var value = bestGenres.sorted{$0.1 > $1.1}
    var result: [Int] = []
    for i in value {
        var cnt = result.count+2
        let genre = i.key
        var play = bestSongs[genre]!.sorted(by:>)
        for p in play {
            result.append(plays.firstIndex(of: p)!)
            // 최대 2개
            if result.count == cnt { break }
        }
    }
    return result
}
```

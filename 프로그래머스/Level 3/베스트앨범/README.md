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
하지만 같은 음원재생 횟수면 index가 적은 번호를 출력하는 예외를 만들어내지 못했다.   
코드를 뒤엎기보다는 뽑아낸 해당 play[index]를 0으로 값을 변화시켜줘 firstIndex(of:)로 찾을때   
자연스럽게 다음 index로 넘어가게 만들었다.   
```
import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var plays = plays
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
    //print(value)
    var result: [Int] = []
    for i in value {
        var cnt = result.count+2
        let genre = i.key
        var play = bestSongs[genre]!.sorted(by:>)
        //print(play)
        for p in play {
            result.append(plays.firstIndex(of: p)!)
            plays[plays.firstIndex(of:p)!] = 0
            
            // 최대 2개
            if result.count == cnt { break }
        }
    }
    return result
}
```
두가지 딕셔너리를 사용하지않고 list를 이용해 풀이할 수도 있다.   
list(장르, [index:재생횟수])로 초기화하여 사용하면 된다.   

```
import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var playList = [String:(play: Int, music: [Int:Int])]()
    var answer = [Int]()

    for (index, value) in genres.enumerated() {
        print("지금 장르는? ",index, value)
        if let genre = playList[value]?.play {
            print("이미 저장된 장르")
            playList[value]?.play = genre + plays[index]
            playList[value]?.music[index] = plays[index]
            print(playList)
        } else {
            print("처음 저장된 장르")
            playList[value] = (play: plays[index], music: [index:plays[index]])
            print(playList)
        }
    }

    let rank = playList.sorted(by: { $0.value.play > $1.value.play })
    print("많이 들은 장르로 정렬",rank)
    rank.forEach { song in
        let songRank = song.value.music.sorted { $0.key < $1.key }.sorted{ $0.value > $1.value}
        print("노래 재생 횟수로 정렬", songRank)
        let max = songRank.count > 1 ? 2 : 1
        for i in 0..<max {
            answer.append(songRank[i].key)
        }
    }

    return answer
}
```

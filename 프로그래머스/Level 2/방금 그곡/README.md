```
func solution(_ m:String, _ musicinfos:[String]) -> String {
    var result = ""
    for i in 0..<musicinfos.count {
        let find = m.map{String($0)}
        let music = musicinfos[i].split(separator:",")
        let code = music[3].map{String($0)}
        var minus = music[3].split(separator:"#").joined().map{String($0)}.count
        let title = music[2]
        let start = Int(music[0].split(separator:":").joined())!
        let end = Int(music[1].split(separator:":").joined())!

        let again = (end-start) / minus
        let last = (end-start) % minus
        //print(again,last)
        var newcode: [String] = []
        for i in 0..<again {
            newcode += code
        }
        var cnt = 0
        for i in 0..<last {
            if code[i] == "#" { cnt += 1}
            newcode.append(code[i])
        }
        for i in 0..<cnt {
            newcode.append(code[last+i])
        }
        //print(cnt)
        print(newcode)
        print(find)
        
        var i = 0
        for n in 0..<newcode.count {
            // 만약 글자가 맞다면
            if newcode[n] == find[i] {
                i += 1
            } else {
                i = 0
            }
            
            // 만약 다 맞았다면
            if i == find.count-1 {
                result = String(title)
                break
            }
        }
        if result != "" {
            break
        }
    }
    return result
}
```
#이 들어간 코드를 쉽게 판별하는 방법이 주요한 문제이다.   

```
func solution(_ m:String, _ musicinfos:[String]) -> String {
    var result: [(title: String, time: Int)] = []
    let find = m.replacingOccurrences(of: "C#", with: "c")
    .replacingOccurrences(of: "D#", with: "d")
    .replacingOccurrences(of: "F#", with: "f")
    .replacingOccurrences(of: "G#", with: "g")
    .replacingOccurrences(of: "A#", with: "a")
    .map{String($0)}
    
    for i in 0..<musicinfos.count {
        let music = musicinfos[i].split(separator:",")
        var code = music[3].replacingOccurrences(of: "C#", with: "c").replacingOccurrences(of: "D#", with: "d")
        .replacingOccurrences(of: "F#", with: "f")
        .replacingOccurrences(of: "G#", with: "g")
        .replacingOccurrences(of: "A#", with: "a")
        .map{String($0)}
        let title = music[2]
        let start = Int(music[0].split(separator:":").joined())!
        let end = Int(music[1].split(separator:":").joined())!
        let again = (end-start) / code.count
        let last = (end-start) % code.count
        
        var newcode: [String] = []
        for i in 0..<again {
            newcode += code
        }
        for i in 0..<last {
            newcode.append(code[i])
        }
        var i = 0
        for n in 0..<newcode.count {
            // 만약 글자가 맞다면
            if newcode[n] == find[i] {
                i += 1
            } else {
                i = 0
            }
            
            // 만약 다 맞았다면
            if i == find.count {
                result.append((String(title), end-start))
                break
            }
        }
    }
    return result.max{$0.time < $1.time}? .title ?? "(None)"
}
```
C# D#등 샵이 들어간 코드를 소문자 c d로 변형시켜서 풀이하였다.   

```
func solution(_ m:String, _ musicinfos:[String]) -> String {
    var result: [(title: String, time: Int)] = []
    let m = m.replacingOccurrences(of: "C#", with: "c")
        .replacingOccurrences(of: "D#", with: "d")
        .replacingOccurrences(of: "F#", with: "f")
        .replacingOccurrences(of: "G#", with: "g")
        .replacingOccurrences(of: "A#", with: "a")
    
    for infoString in musicinfos {
        let music = infoString.components(separatedBy: ",")
        let start = music[0]
        let end = music[1]
        let title = music[2]
        let info = music[3].replacingOccurrences(of: "C#", with: "c")
            .replacingOccurrences(of: "D#", with: "d")
            .replacingOccurrences(of: "F#", with: "f")
            .replacingOccurrences(of: "G#", with: "g")
            .replacingOccurrences(of: "A#", with: "a")
            .map{String($0)}
        
        // 시간 계산
        let startTime = start.components(separatedBy: ":").map{Int($0)!}
        let startHour = startTime[0]
        let startMinute = startTime[1]
        let endTime = end.components(separatedBy: ":").map{Int($0)!}
        let endHour = endTime[0]
        let endMinute = endTime[1]
        let minute = (endHour - startHour) * 60 + endMinute - startMinute
        
        var fullInfo = ""
        for i in 0..<minute {
            let index = i % info.count
            fullInfo += info[index]
        }
        
        if fullInfo.contains(m) {
            result.append((title, minute))
        }
    }

    return result.max{$0.time < $1.time}?.title ?? "(None)"
}
```
시간 계산적으로 틀린 테스트케이스를 고쳐주었다.   

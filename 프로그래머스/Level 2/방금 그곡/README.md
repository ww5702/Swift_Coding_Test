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

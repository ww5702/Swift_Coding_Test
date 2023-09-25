이차원배열을 strings의 갯수만큼 생성한다.   
첫번째 인덱스에는 strings[0]의 값을 두번째 인덱스에는 strings[0][n]을 넣는다.   
해당 이중반복문을 해당 기준에 따라 정렬해준다.   
```
func solution(_ strings:[String], _ n:Int) -> [String] {
    var list = [[String]](repeating : Array(repeating: "0", count: 2), count: strings.count)
    for s in 0..<strings.count {
        list[s][0] = strings[s]
        var value = list[s][0].map{String($0)}
        list[s][1] = value[n]
    }
    var result: [String] = []
    list.sort{ $0[1] == $1[1] ? $0[0] < $1[0] : $0[1] < $1[1]}
    for l in list {
        result.append(l[0])
    }
    return result
}
```

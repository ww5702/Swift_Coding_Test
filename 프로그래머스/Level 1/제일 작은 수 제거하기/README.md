newarr을 만들어 제일 작은 수를 제거한다음 조건문에 따라 -1을 반환할지 그대로 반환할지 정해서 풀이했으나 실패했다    
이유를 찾아보니 arr을 그대로 반환해줘야하는것   
따라서 index를 찾고 그냥 해당 인덱스를 지워버린후 반환해주었다.   
```
func solution(_ arr:[Int]) -> [Int] {
    var minNumIndex = arr.firstIndex(of: arr.sorted(by:<)[0])!
    var arr = arr
    arr.remove(at: minNumIndex)
    return arr.isEmpty ? [-1] : arr
}
```

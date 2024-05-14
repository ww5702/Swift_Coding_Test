swift 문자열 정규식을 얼마나 정교하게 풀이하는지에 대한 문제이다.   
문자열 정규식 활용은 너무 어렵다.   

```
import Foundation

extension String{
    func getAllMatchAfterRegex(_ pattern: String, _ option: NSRegularExpression.Options) -> [String] {
        // 옵셔널을 벗기기 위해 do-catch를 사용
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: option)
            let range = NSRange(self.startIndex..., in: self)
            let matches = regex.matches(in: self, range: range)
            return matches.map {
                String(self[Range($0.range, in: self)!])
            }
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
}

class Page {
    var url = "" // url
    var normal = 0 // 기본 점수
    var external_links = [String]() // 외부링크 list
    var matching = 0.0 // 매칭 점수
    
    init(_ url: String, _ normal: Int, _ external_links: [String]) {
        self.url = url
        self.normal = normal
        self.external_links = external_links
        self.matching = Double(normal)
    }
}

func parse_html(_ word: String, _ html: String) -> (String, Int, [String]) {
    
    // target과 일치하는 단어를 리스트에서 계수
    func count(target: String, word_list: [String]) -> Int {
        var result = 0
        for word in word_list {
            if word.lowercased() == target.lowercased() {
                result += 1
            }
        }
        
        return result
    }
    
    // head -> meta 태그안의 url을 추출
    let head = html.getAllMatchAfterRegex("<head>(.+)</head>", .dotMatchesLineSeparators)
    let url = head[0].getAllMatchAfterRegex("(?<=meta property=\"og:url\" content=\"https://)([^\"]+)", .dotMatchesLineSeparators)
    
    // 기본점수 계산
    let word_list = html.getAllMatchAfterRegex("[a-zA-Z]+", [])
    let normal = count(target: word, word_list: word_list)
    
    // 후방탐색으로 외부링크 추출
    let ext_links = html.getAllMatchAfterRegex("(?<=<a href=\"https://)([^\"]+)", .dotMatchesLineSeparators)
    let external_links = Array(Set(ext_links)) // 중복 삭제
    
    return (url[0], normal, external_links)
}


func solution(_ word:String, _ pages:[String]) -> Int {
    var dic = [String: (Int,Page)]()
    
    for (idx, html) in pages.enumerated() {
        let (url, normal, external_links) = parse_html(word, html)
        let page = Page(url, normal, external_links)
        dic[url] = (idx,page)
        
    }
    
    //print(dic)
    
    for url in dic {
        let page = url.value.1
        let external_links = page.external_links
        if external_links.count != 0 {
            let power = Double(page.normal) / Double(external_links.count)
            for link in external_links {
                if dic[link] != nil {
                    dic[link]!.1.matching += power
                }
            }
        }
    }
    
    //print(dic)
    
    var ans = [(Int,Page)]()
    for url in dic {
        ans.append(url.value)
    }
    
    return ans.sorted(by:{$0.0 < $1.0}).sorted(by: {$0.1.matching > $1.1.matching})[0].0
}

```

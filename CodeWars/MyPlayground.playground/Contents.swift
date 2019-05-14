import UIKit

func stat(_ strg: String) -> String {
    // your code
    var rangeH = 0
    var averageH = 0
    var medianH = 0
    var rangeM = 0
    var averageM = 0
    var medianM = 0
    var rangeS = 0
    var averageS = 0
    var medianS = 0
    
    var hours = [Int]()
    var minutes = [Int]()
    var seconds = [Int]()
    
    var runners = strg.split(separator: ",")
    for runner in runners {
        var time = String(runner).split(separator: "|")
        
        var hour = String(time[0])
        var trimmedHour = hour.trimmingCharacters(in: .whitespacesAndNewlines)
        var hourInt = Int(trimmedHour)
        hours.append(hourInt!)
        
        var minute = String(time[1])
        var trimmedMinute = minute.trimmingCharacters(in: .whitespacesAndNewlines)
        var minuteInt = Int(trimmedMinute)
        minutes.append(minuteInt!)

        var second = String(time[2])
        var trimmedSecond = second.trimmingCharacters(in: .whitespacesAndNewlines)
        var secondInt = Int(trimmedSecond)
        seconds.append(secondInt!)
    }
    
    rangeH = hours.max()! - hours.min()!
    rangeM = minutes.max()! -  minutes.min()!
    rangeS = seconds.max()! - minutes.min()!

    
    
    return "Range: \(rangeH)|\(rangeM)|\(rangeS) Average: \(averageH)|\(averageM)|\(averageS) Median: \(medianH)|\(medianM)|\(medianS)"
}

let testInput = "01|15|59, 1|47|6, 01|17|20, 1|32|34, 2|3|17"

print(stat(testInput))



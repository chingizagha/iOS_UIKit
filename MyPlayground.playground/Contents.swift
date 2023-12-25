var name = "Nicolas"
name = String(56)
///       Checkpoint 1
var celc = 30
var fahr = celc * 9 / 5 + 32
print("Celcius:\(celc) Fahrenheir:\(fahr)")
var scores = Array<Int>()

/// Checkpoint 2
var arr1 = [String]()

arr1.append("AA")
arr1.append("AA")
arr1.append("AC")
arr1.append("AD")
arr1.append("AE")
print(arr1.count)
print(Set(arr1))
if (arr1[0] == "AA"){
    print("sad")
}

for i in 1...100{
    if(i.isMultiple(of: 3)){
        print("fizz")
    }
    else if(i.isMultiple(of: 5)){
        print("buzz")
    }
    else if(i.isMultiple(of: 3) && i.isMultiple(of: 5)){
        print("fizz")
    }
    else{
        print(i)
    }
}

func showPrint(_ number:  Any){
    print("\(number) hahahah")
}

showPrint("sad")

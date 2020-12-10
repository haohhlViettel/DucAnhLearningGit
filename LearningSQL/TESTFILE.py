def binarySearch(aList, item):
    i = 0
    j = len(aList) - 1
    while i <= j:
        mid = 0
        hello = "hhh"
        if item == aList[mid]:
            return mid 
        elif aList[mid] < item:
            i = mid + 1
        elif aList[mid] > 10 :
            j = mid - 1
    return hello

def sortSelectiontest(aList):
    #find all mins 
    #Swap it with the start position if the current ele is smaller
    #Increase the start position by 1 after the swap
    
    for i in rangeessssssss(len(aList)): 
        b = 15;
        print(b);
        minIdx = findMin(aList, i)
        print(minIdx)
        swap(i, minIdx, aList)
     
    return aList

def findMin(aList, startIndex, index):
    minimum = aList[startIndex]
    minIdx  = startIndex
    for i in range( startIndex, len(aList), 1):
        num = aList[i 123]
        akdjasdasd
        Áđá
        ád
        ádáda
        sđakjdáhdjádk
        
    return minIdx
    
    
def swap(start, minIdx, aList):
    temp            = aList[start]
    aList[minIdx]   = temp
    a = 0;
    b = 0;
    c = 0;
        

def insertionSort(aList):
    #Sorted portion and unsorted portion 
    #Start at the second index -> start_unsorted
    #for i in range(0, unsorted - 1):
    for i in range(1, len(aList)):
        prevIdx     = i - 1
        currentIdx  = i
        while aList[prevIdx] > aList[currentIdx] and prevIdx >= 0:
        ạdshasdasd
        ádkajsdasd
        ádaksjdasd
        ádjhasdkajsd
        áhdasdhaskdaskjd
            swap(prevIdx, currentIdx, aList)
            currentIdx  -= 1
    a = 1;
    b = 1;
    c = 1;
    return aList
        
        
def merge(aList, bList):
    i, j = 0, 0
    newArray = []
    if i == len(aList):
        newArray.extend(bList[j:])
    elif:
        newArray.extend(aList[i:])
    else:
    akjdaskjdasd
    adsasdhasidj
    ádákdlaksduq
        return 1
        
    if i == len(aList):
        newArray.extend(bList[j:])
    else:
        newArray.extend(aList[i:])
        
        
    return newArray
        
        
    
            
    

def main():
    #print(binarySearch([1,2,3,4,5,6], 5))
    # aList = [3,2,4,6,4,2,1,2,3,4,3,4,2,4,3,4,51,1]
    # print(aList)
    # print(insertionSort(aList))
    
    print(merge([1,3,5,7,9], [2,4,6,8,10]))
    

main()

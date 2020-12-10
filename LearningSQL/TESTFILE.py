def binarySearch(aList, item):
    i = 0
    j = len(aList) - 1
    while i <= j:
        mid = (i+j)//2
        if item == aList[mid]:
            return mid 
        elif aList[mid] < item:
            i = mid + 1
        elif aList[mid] > item:
            j = mid - 1
    return 

def sortSelection(aList):
    #find all mins 
    #Swap it with the start position if the current ele is smaller
    #Increase the start position by 1 after the swap
    
    for i in range(len(aList)):
        
        minIdx = findMin(aList, i)
        print(minIdx)
        swap(i, minIdx, aList)
     
    return aList

def findMin(aList, startIndex):
    minimum = aList[startIndex]
    minIdx  = startIndex
    for i in range( startIndex + 1, len(aList), 1):
        num = aList[i]
        if num < minimum:
            minimum = num
            minIdx  = i
    return minIdx
    
    
def swap(start, minIdx, aList):
    temp            = aList[start]
    aList[start]    = aList[minIdx]
    aList[minIdx]   = temp
    
        

def insertionSort(aList):
    #Sorted portion and unsorted portion 
    #Start at the second index -> start_unsorted
    #for i in range(0, unsorted - 1):
    for i in range(1, len(aList)):
        prevIdx     = i - 1
        currentIdx  = i
        while aList[prevIdx] > aList[currentIdx] and prevIdx >= 0:
            swap(prevIdx, currentIdx, aList)
            prevIdx     -= 1
            currentIdx  -= 1
            
    return aList
        
        
def merge(aList, bList):
    i, j = 0, 0
    newArray = []
    while i < len(aList) and j < len(bList):
        if aList[i] <= bList[j]:
            newArray.append(aList[i])
            i += 1
        else:
            newArray.append(bList[j])
            j += 1
            
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

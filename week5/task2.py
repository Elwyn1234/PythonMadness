def createHockeyFile():
    open("Hockey.txt", "x")

def appendToFile():
    file = open("Hockey.txt", "a")
    file.write("Anaheim\n")
    file.write("Dallas\n")
    file.write("Chicago\n")

def writeToFile():
    file = open("Hockey.txt", "w")
    file.write("Mighty Ducks")

appendToFile()
print(open("Hockey.txt", "r").read())
print(open("Hockey.txt", "r").read())


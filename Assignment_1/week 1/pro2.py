file = open("code.txt")
for line in file:
    line = line.replace(",", " ")
    words = line.split()
    print(len(words), words)

file = open("code.txt")
lt = []

file.readline()
for line in file:
    line = line.replace(",", " ")
    line = line.replace("'", " ")
    words = line.split()
    if int(words[-1].isdigit()):
        lt.append(words[-1])

for i in lt:
    print(i)

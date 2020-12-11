import re

emot = ["STOP", "ADD", "SUB", "MULT", "MOVER", "MOVEM", "COMP", "BC", "DIV", "READ", "PRINT", "START",
        "END", "ORIGIN", "EQU", "LTORG", "DS", "DC", "AREG", "BREG", "CREG", "EQ", "LT", "GT", "NE", "ANY"]
code = open("code.txt")

symbols = []
literals = []
count = 0
lc = 0
size = 0
pooltable = []

for line in code:
    line = line.replace(",", " ")
    words = line.split()

    if bool(re.match(r".+=\'[0-9]\'", line)):
        count += 1
        literals.append([words[-1], None])

    if words[0] == "START":
        lc = int(words[1])

    elif words[0] not in emot:
        if words[1] == "DS" or words[1] == "DC":
            size = int(words[2])
        else:
            size = 1
        symbols.append((words[0], lc, size))
        lc += size

    elif words[0] == "LTORG":
        pooltable.append(len(literals)-count)
        lc += 1
        for i in literals:
            if i[1] == None:
                i[1] = lc
                lc += 1
            else:
                continue
        count = 0
    else:
        lc += 1

print("Symbol Table:\nIndex\tSymbol\tAddress\tSize")
for i in range(len(symbols)):
    print(i, "\t", symbols[i][0], "\t", symbols[i][1], "\t", symbols[i][2])

print("Literal Table:\nIndex\tValue\tAddress")
for i in range(len(literals)):
    print(i, "\t", literals[i][0], "\t", literals[i][1])

print("Pool Table:\nIndex\tLiteral no")
for i in range(len(pooltable)):
    print(i, "\t", pooltable[i])

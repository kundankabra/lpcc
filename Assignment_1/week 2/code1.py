import re

emot = ["STOP", "ADD", "SUB", "MULT", "MOVER", "MOVEM", "COMP", "BC", "DIV", "READ", "PRINT", "START",
        "END", "ORIGIN", "EQU", "LTORG", "DS", "DC", "AREG", "BREG", "CREG", "EQ", "LT", "GT", "NE", "ANY"]
code = open("code.txt")

ltr_cnt = 0
symbols = []
lc = 0
size = 0

for line in code:
    line = line.replace(",", " ")
    words = line.split()

    if bool(re.match(r".+=\'[0-9]\'", line)):
        ltr_cnt += 1

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
        lc += 1
        lc += ltr_cnt
        ltr_cnt = 0
    else:
        lc += 1

print("Symbol Table:\nIndex\tSymbol\tAddress\tSize")
for i in range(len(symbols)):
    print(i, "\t", symbols[i][0], "\t", symbols[i][1], "\t", symbols[i][2])

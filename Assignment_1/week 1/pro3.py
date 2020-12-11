EMOT = ["STOP", "ADD", "SUB", "MULT", "MOVER", "MOVEM", "COMP", "BC", "DIV", "READ", "PRINT", "START",
      "END", "ORIGIN", "EQU", "LTORG", "DS", "DC", "AREG", "BREG", "CREG", "EQ", "LT", "GT", "NE", "ANY"]
file = open("code.txt")
lc=0
symbol=[]

for line in file:
    line = line.replace(",", " ")
    words = line.split()
    if words[0] not in EMOT:
        symbol.append(words[0])

for i in symbol:
    print(i)
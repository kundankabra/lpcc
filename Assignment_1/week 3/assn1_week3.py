import re      # regular expression library to detect re
import pandas as pd  # pandas to convert dict to  
file = open('input.txt','r') 
symbol = dict()
var = list()
literal = dict()
var1 = list()
LocCount = 0  # locationn counter to keep track of address
label = dict()
regx_literal = re.compile(r'=[0-9]')   # re for literal
regx_symbol = re.compile(r'=[A-Z]')    # re for symbol
for line in file:
    line.strip()     # remove white space from left and right
    words = line.split()    # split string into word        
    if len(words)>3 :
        symbol[str(words[0])] = LocCount        
    if line.startswith('ORIGIN'):
            no = words[1].split('+')
            if no[0] in symbol.keys():
                LocCount = symbol[no[0]]+int(no[1])
            continue    
    if line.startswith('START'):            # if line starts with start initialize loc counter to corresponding value
        LocCount = int(words[-1])
        continue        
    if regx_symbol.search(line):            # if line contains symbol store it in symbol table
        var.append(words[-1])
        symbol[str(words[-1])] = 0
        
        
    if regx_literal.search(line):           # if line contains literal store it in symbol table
        var1.append(words[-1])
        literal[str(words[-1])] = 0        
    if 'DC' in line:        # if line contains DS or DC assign address to the symbols stored previously
        symbol[str(words[0])] = LocCount        
    if 'DS' in line:
        symbol[str(words[0])] = LocCount
        LocCount += int(words[-1])
        continue       
    if line.startswith('LTORG'):              # if line contains LTORG word assign address to all the literals stored previously
        for w in var1:
            literal[w] = LocCount
            LocCount += 1
        LocCount -= 1             
    if line.startswith('END'):              # if line contains end word assign address to all the literals stored previously
        for w in var1:
            if literal.get(w)==0:
                literal[w] = LocCount
                LocCount += 1       
    LocCount+=1        
file.close()
file = open('input.txt','r')
op = open('output.txt','w')

optable = {'START':"('AD',1)",
           'END':"('AD',2)",
          'LTORG':"('AD',5)",
          'ORIGIN':"('AD',3)",
          'EQU':"('AD',4)",
          'DC':"('DL', 01)",
          'DS':"('DL', 02)",
          'ADD':"('IS', 01)",
          'SUB':"('IS', 02)",
          'MOVER':"('IS', 04)",
          'MOVEM':"('IS', 05)",
          'READ':"('IS', 09)",
          'PRINT':"('IS', 10)"
          }

register = ['AREG','BREG']
regx_constant = re.compile('[0-9]+')
for line in file:
    line.strip()    
    words = line.split()
    ic = ""        
    if words[0] in optable.keys():
        if words[0]=='ORIGIN':
            ic+=optable[words[0]]+" "+words[1]
            op.write(ic+'\n')
            continue            
        temp = optable[words[0]]
        ic+=temp+" "
    elif words[0] in symbol.keys():
        if words[1] in optable.keys():
            temp = optable[words[1]]
            ic+=temp+" "
    if "AREG" in words:
        ic+="AREG"+" "
    if "BREG" in words:
        ic+="BREG"+" "
    if words[-1] in symbol.keys():
        ic+=words[-1]+" "                
    if words[-1] in literal.keys():
        ic+="(L,"+words[-1]+")"                
    if words[-1][0] != "=":
        if regx_constant.search(words[-1][0]):
            temp = "(C,"+words[-1]+")"
            ic+=temp+" "                          
    op.write(ic+'\n')           
op.close()
file.close()

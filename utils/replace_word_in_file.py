import sys

def replaceWord(fileName, newWord, oldWord):
    with open(fileName, 'r') as file:
        filedata = file.read()

    filedata = filedata.replace(newWord, oldWord)

    with open(fileName, 'w') as file:
        file.write(filedata)

if __name__ == "__main__":
    print('replacing ' + sys.argv[1:][1] + ' with ' + sys.argv[1:][2] + ' in file ' + sys.argv[1:][0])
    replaceWord(sys.argv[1:][0],sys.argv[1:][1],sys.argv[1:][2])

with open('wordList.txt', 'r') as infile: # open the plain text file that contains the list of words
    wordlist = infile.read().split() # read the words into a list, splitting on the new lines
with open('synset_counts.xml', 'w') as outfile: # open a file to hold the XML output
    outfile.write('<xml>') # create a start tag for the root element in the output XML file
    for word in wordlist: # create output for each word
        synset_count = len(wn.synsets(word)) # for each word, count the number of synsets to which it belongs
        outfile.write('<word><w>' + word + '</w><count>' + str(synset_count) + '</count></word>') # write it out
    outfile.write('</xml>') # create the end tag for the root element
    
    
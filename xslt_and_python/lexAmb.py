from nltk.corpus import wordnet as wn
with open('wordList_lc.txt', 'r') as infile: # open the plain text file that contains the list of words
    wordlist = infile.read().split() # read the words into a list, splitting on the new lines
with open('synset_info_lc.xml', 'w') as outfile: # open a file to hold the XML output
    outfile.write('<xml>') # create a start tag for the root element in the output XML file
    for word in wordlist: # create output for each word
        synsets = wn.synsets(word) #synset list
        synset_count = len(wn.synsets(word)) # for each word, count the number of synsets to which it belongs
        outfile.write('<word><w>' + word + '</w><synsetCount>' + str(synset_count) + '</synsetCount>')
        for synset in synsets:
            outfile.write('<synset><synId>' + str(synset) + '</synId><wnDef>' + synset.definition() + '</wnDef>')
            for lemma in synset.lemmas():
                outfile.write('<lemma>' + str(lemma) + '</lemma>')
            outfile.write('</synset>')
        outfile.write('</word>') # write it out
    outfile.write('</xml>') # create the end tag for the root element
    
    
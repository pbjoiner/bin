#!/usr/local/bin/python3

import sys, re, shutil

if len(sys.argv) < 2:
    print('fixText.py requires an input file to fix')
    print('python3 fixText.py <inputfile>')
    sys.exit(2)

outFile = open('/tmp/FT.tmp', 'w')

transMap = {
    "'s ": '&rsquo;s ',
    "n't ": 'n&rsquo;t ',
    '\u2019': '&rsquo;',
    '\\\\' + "'": '&rsquo;',
    '\u201C': '&ldquo;',
    '\u201D': '&rdquo;',
    '\u2014': '&mdash;',
    ' -- ': ' &mdash; ',
    ' \u2013\u2013 ': ' &mdash; ',
    ' \u2013 ': ' &mdash; ',
    '([^!]{1})--([^>]{1})': r'\1&mdash;\2',
    ' - ': ' &mdash; ',
    '  ': ' ',
    ' & ': ' &amp; ',
    '…': '&hellip;',
    '\u202F': ' ',
    '\u00AE': '&reg;',
    '\u00A9': '&copy;',
    ' "([\s\w]+)" ': r' &ldquo;\1&rdquo; ',
    '\.\.\.': '&hellip;'
}

with open(sys.argv[1]) as inFile:
    for content in inFile:

        for badChar in transMap:
            content = re.sub(badChar, transMap[badChar], content)

        outFile.write(content)

outFile.close()
inFile.close()
shutil.move('/tmp/FT.tmp', sys.argv[1])
sys.exit()

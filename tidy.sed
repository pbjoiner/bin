# post-tidy sed script

/\t<meta name="generator" content="HTML Tidy for Linux\/x86 (vers 1st November 2003), see www.w3.org" \/>/d
/<!DOCTYPE html PUBLIC "-\/\/W3C\/\/DTD XHTML 1.0 Strict\/\/EN"/d
/    "http:\/\/www.w3.org\/TR\/xhtml1\/DTD\/xhtml1-strict.dtd">/d
s/<html xmlns="http:\/\/www.w3.org\/1999\/xhtml">/<html>/
/   <meta name="generator" content="HTML Tidy for Linux\/x86 (vers 1st November 2003), see www.w3.org" \/>/d
/^$/d
s/&\#39;/'/g
s/   /\t/g
s/^\t//g
/^<html>$/, /^<body>$/d
/^<\/body>$/, /<\/html>$/d

#! /usr/bin/perl

use strict;
use warnings;

use File::Copy qw(move);

my $inFile = $ARGV[0] || die 'FixWord requires the name of a text file to fix.';
my $outFile = $ARGV[1] || '/tmp/FWTemp';

my %transMap = (
    "'s "                  => '&rsquo;s ',
    "n't "                 => 'n&rsquo;t ',
    '’'                    => '&rsquo;',
    '\\\\' . "'"           => '&rsquo;',
    '“'                    => '&ldquo;',
    '”'                    => '&rdquo;',
    '—'                    => '&mdash;',
    ' -- '                 => ' &mdash; ',
    ' –– '                 => ' &mdash; ',
    ' – '                  => ' &mdash; ',
    '([^!]{1})--([^>]{1})' => "\1&mdash;\2",
    ' - '                  => ' &mdash; ',
    '  '                   => ' ',
    ' & '                  => ' &amp; ',
    '…'                    => '&hellip;',
    ' '                => ' ',
    "'"                    => '&rsquo;'
);

open(my $inFileHandle, '<', $inFile) || die 'FixWord cannot open input file ' . $inFile . '!';
open(my $outFileHandle, '>', $outFile) || die 'FixWord cannot open output file ' . $outFile . '!';

foreach my $line (<$inFileHandle>) {
    foreach my $key (keys %transMap) {
        $line =~ s/$key/$transMap{$key}/g;
    }
    print $outFileHandle $line;
}

close($inFileHandle);
close($outFileHandle);

# if we wrote to a temp file, copy it to the original
if ($outFile eq '/tmp/FWTemp') {
    move $outFile, $inFile;
}

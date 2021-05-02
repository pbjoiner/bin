#!/usr/bin/perl
use Getopt::Long;
GetOptions("o"=>\$oflag,
            "verbose!"=>\$verboseornoverbose,
            "string=s"=>\$stringmandatory,
            "optional:s",\$optionalstring,
            "int=i"=> \$mandatoryinteger,
            "optint:i"=> \$optionalinteger,
            "float=f"=> \$mandatoryfloat,
            "optfloat:f"=> \$optionalfloat);
print "oflag $oflag\n" if $oflag;
print "verboseornoverbose $verboseornoverbose\n" if $verboseornoverbose;
print "stringmandatory $stringmandatory\n" if $stringmandatory;
print "optionalflag $optionalflag\n" if $optionalflag;
print "optionalstring $optionalstring\n" if $optionalstring;
print "mandatoryinteger $mandatoryinteger\n" if $mandatoryinteger;
print "optionalinteger $optionalinteger\n" if $optionalinteger;
print "mandatoryfloat $mandatoryfloat\n" if $mandatoryfloat;
print "optionalfloat $optionalfloat\n" if $optionalfloat;

print "Unprocessed by Getopt::Long\n" if $ARGV[0];
foreach (@ARGV) {
  print "$_\n";
}
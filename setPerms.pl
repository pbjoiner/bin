#!/usr/bin/perl
#
#	$HeadURL: http://scm.corp.convio.com/svn/convio/design/trunk/Deployment_Source/Bin/setPerms.pl $
#	$Id: setPerms.pl 270941 2013-09-13 17:09:57Z pjoiner@convio.com $
#
# crawls directory tree and sets file permissions for httpd

use warnings;
use strict;
use English;
use Cwd 'cwd';
use Cwd 'abs_path';

$rootDir = cwd();
if ($ARGV[0]) {
	$rootDir = abs_path($ARGV[0]);
	chmod 0775, $rootDir;
}

@dirList = getDirList($rootDir);

DIRLOOP: foreach (@dirList) {

	if (/^\./) {
		next DIRLOOP;

	} else {
		chown 1000, 1000, $ARG;
		
		if (-d $ARG) {
			chmod 0775, $ARG;
			push @dirList, getDirList($ARG);

		} elsif (-f $ARG) {
			chmod 0664, $ARG
		}
	}
}

sub getDirList {
	my $directory = @ARG[0];
	my @fileList;

	opendir GDL_DIRECTORY, $directory;

	DIRLOOP: foreach (readdir GDL_DIRECTORY) {
		
		if (/^\./) {
			next DIRLOOP;
		
		} elsif (/bin/i) {
			next DIRLOOP;
		
		} else {
			push @fileList, $directory . "/" .$ARG;
		}
	}
	
	closedir GDL_DIRECTORY;

	return @fileList;
}

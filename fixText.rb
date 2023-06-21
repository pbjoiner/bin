#!/usr/bin/ruby
require 'fileutils'

if File.exist?(ARGV[0])
	in_file  = File.open(ARGV[0], 'r')
	out_file = File.open('/tmp/fix.tmp', 'w')
else
	puts "File #{ARGV[0]} not found."
	exit(1)
end

#noinspection RubyExpressionInStringInspection
trans_map = {
	"'s "                                   => '&rsquo;s ',
	"n't "                                  => 'n&rsquo;t ',
	'\u2019'                                => '&rsquo;',
	'\\\\' + "'"                            => '&rsquo;',
	'\u201C'                                => '&ldquo;',
	'\u201D'                                => '&rdquo;',
	'\u2014'                                => '&mdash;',
	' -- '                                  => ' &mdash; ',
	' \u2013\u2013 '                        => ' &mdash; ',
	' \u2013 '                              => ' &mdash; ',
	'(?<first>[^!]{1})--(?<second>[^>]{1})' => '\k<first>&mdash;\k<second>',
	' - '                                   => ' &mdash; ',
	'  '                                    => ' ',
	' & '                                   => ' &amp; ',
	'…'                                     => '&hellip;',
	'\u202F'                                => ' ',
	'\u00AE'                                => '&reg;',
	'\u00A9'                                => '&copy;',
	' "(?<quoted>[\s\w]+)" '                => ' &ldquo;\k<quoted>&rdquo; ',
	'\.\.\.'                                => '&hellip;',
	'ñ'                                     => '&ntilde;',
	'Ñ'                                     => '&Ntilde;',
}

in_file.each do |line|

	trans_map.each do |key, value|
		line = line.gsub /#{key}/, value
	end # end loop throuh replacements
	out_file.write line
end # end loop through file

in_file.close
out_file.close
FileUtils.mv '/tmp/fix.tmp', ARGV[0]

#!/usr/bin/perl

sub pandoc_generate_pdf
{
	($DOC) = @_;

	print "Generating $DOC PDF...\n";

	my $CMD = "pandoc $DOC.markdown " .
        	"--smart --normalize --number-sections --section-divs --toc " .
        	"--variable=links-as-notes:true --variable=documentclass:report --to=latex " .
        	"--variable=lang:english --variable=urlcolor:black --variable=linkcolor:black " .
		" --variable=verbatim-in-note:true " .
        	"--output=$DOC.pdf";

	print "$CMD\n";

	system($CMD);

	print "Done!\n";
}

$USR_DOC = "User/FreeRDP-User-Manual";
$DEV_DOC = "Developer/FreeRDP-Developer-Manual";
$CFG_DOC = "Configuration/FreeRDP-Configuration-Manual";

@DOCS = ();

foreach $i (0 .. $#ARGV) {
	if ($ARGV[$i] =~ m/^usr$/) {
		push(@DOCS, $USR_DOC);
	} elsif ($ARGV[$i] =~ m/^dev$/) {
		push(@DOCS, $DEV_DOC);
	} elsif ($ARGV[$i] =~ m/^cfg$/) {
		push(@DOCS, $CFG_DOC);
	}
}

if ($#ARGV eq -1) {
	@DOCS = ($USR_DOC, $DEV_DOC, $CFG_DOC);
}

foreach (@DOCS) {
	pandoc_generate_pdf($_);
}

#!/usr/bin/perl

# requires pandoc 1.10+

sub pandoc_generate_pdf
{
	($DIR, $DOC) = @_;

	chdir($DIR);

	print "Generating $DOC PDF...\n";

	my $CMD = "pandoc $DOC.markdown " .
		" -f markdown+pipe_tables " .
        	"--smart --normalize --number-sections --section-divs --toc " .
        	"--variable=links-as-notes:true --variable=documentclass:report --to=latex " .
        	"--variable=lang:english --variable=urlcolor:black --variable=linkcolor:black " .
		" --variable=verbatim-in-note:true " .
        	"--output=$DOC.pdf";

	print "$CMD\n";

	system($CMD);

	chdir("..");

	print "Done!\n";
}

$USR_DIR = "User";
$USR_DOC = "FreeRDP-User-Manual";

$DEV_DIR = "Developer";
$DEV_DOC = "FreeRDP-Developer-Manual";

$CFG_DIR = "Configuration";
$CFG_DOC = "FreeRDP-Configuration-Manual";

@DIRS = ();
@DOCS = ();

foreach $i (0 .. $#ARGV) {
	if ($ARGV[$i] =~ m/^usr$/) {
		push(@DIRS, $USR_DIR);
		push(@DOCS, $USR_DOC);
	} elsif ($ARGV[$i] =~ m/^dev$/) {
		push(@DIRS, $DEV_DIR);
		push(@DOCS, $DEV_DOC);
	} elsif ($ARGV[$i] =~ m/^cfg$/) {
		push(@DIRS, $CFG_DIR);
		push(@DOCS, $CFG_DOC);
	}
}

if ($#ARGV eq -1) {
	@DIRS = ($USR_DIR, $DEV_DIR, $CFG_DIR);
	@DOCS = ($USR_DOC, $DEV_DOC, $CFG_DOC);
}

foreach (@DOCS) {
	$DIR = shift(@DIRS);
	pandoc_generate_pdf($DIR, $_,);
}


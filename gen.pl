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

$USER_DIR = "User";
$USER_DOC = "FreeRDP-User-Manual";

$DEV_DIR = "Developer";
$DEV_DOC = "FreeRDP-Developer-Manual";

$CFG_DIR = "Configuration";
$CFG_DOC = "FreeRDP-Configuration-Manual";

$TEST_DIR = "Testing";
$TEST_DOC = "FreeRDP-Testing-Manual";

@DIRS = ();
@DOCS = ();

foreach $i (0 .. $#ARGV) {
	if ($ARGV[$i] =~ m/^user$/) {
		push(@DIRS, $USR_DIR);
		push(@DOCS, $USR_DOC);
	} elsif ($ARGV[$i] =~ m/^dev$/) {
		push(@DIRS, $DEV_DIR);
		push(@DOCS, $DEV_DOC);
	} elsif ($ARGV[$i] =~ m/^cfg$/) {
		push(@DIRS, $CFG_DIR);
		push(@DOCS, $CFG_DOC);
	} elsif ($ARGV[$i] =~ m/^test$/) {
		push(@DIRS, $TST_DIR);
		push(@DOCS, $TST_DOC);
	}
}

if ($#ARGV eq -1) {
	@DIRS = ($USER_DIR, $DEV_DIR, $CFG_DIR, $TEST_DIR);
	@DOCS = ($USER_DOC, $DEV_DOC, $CFG_DOC, $TEST_DOC);
}

foreach (@DOCS) {
	$DIR = shift(@DIRS);
	pandoc_generate_pdf($DIR, $_,);
}


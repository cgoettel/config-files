#!/usr/bin/perl

use strict;
use warnings;

my $file = $ARGV[0];
open OUT, ">$file.tex" or die "Failed to open OUT: $!\n";

print OUT "\\documentclass{article}\n";
print OUT "\\usepackage[margin=1in]{geometry}\n";
print OUT "\n";
print OUT "\\title{}\n";
print OUT "\\author{Colby Goettel}\n";
print OUT "\n";
print OUT "\\begin{document}\n";
print OUT "\\maketitle\n";
print OUT "\n";
print OUT "\n";
print OUT "\n";
print OUT "\\end{document}\n";

close OUT;

# Create Makefile
open OUT, ">Makefile" or die "Failed to open OUT: $!\n";

# print $file . "\n";
print OUT "$file.pdf: *.tex Makefile\n";
print OUT "\trm -f $file.aux $file.bbl $file.blg $file.brf $file.lof $file.log $file.lot $file.out $file.toc\n";
print OUT "\tpdflatex -halt-on-error $file.tex\n";
print OUT "\tpdflatex $file.tex\n";
print OUT "\n";
print OUT "clean:";
print OUT "\trm -f *.aux *.bbl *.blg *.brf *.lof *.log *.lot *.out *.toc\n";

close OUT;

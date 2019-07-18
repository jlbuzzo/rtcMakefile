#!/usr/bin/env perl 
#===============================================================================
#
#         FILE: counter.pl
#
#        USAGE: ./counter.pl  
#
#  DESCRIPTION: 
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: YOUR NAME (), 
# ORGANIZATION: 
#      VERSION: 1.0
#      CREATED: 07/18/2019 02:00:40 PM
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
use utf8;

die "No input file(s)" unless @ARGV;
die "Nonexistent file \"$ARGV[0]\"" unless -f $ARGV[0];


my $file = $ARGV[0];
my $count = 0;
my %hash; 


open my $fh, '<', $file or die "Couldn\'t open file $file";
while ( <$fh> ) {
	chomp;
	my @line = split;
	next if scalar @line < 5;
	
	# Take gene ID.
	my @motiff = split /@@/, (split /\*\*/, $line[11])[3];
	
	
	my $sz = $#line;
	my @fim = split ':', substr($line[$sz], 3);
	if ( ($line[$sz-3] eq "IN")
		and ($line[$sz-2] eq "IN")
		and ($line[$sz-1] eq "IN")
		and (substr($line[$sz], 0, 2) eq "IN")
	) {
		#print "foi $line[$sz].\n";
		my @coord1 = split '_', $fim[0];
		my @coord2 = split '_', $fim[1];
		#push @{ $hash{$motiff[0]} } => [$motiff[0], $motiff[$#motiff], $coord1[0], $coord2[0]];
		push @{ $hash{$motiff[0]} } => [$motiff[0], $motiff[$#motiff], $line[5], $line[6], $line[7]];
		$count++;
	}
}
close($fh);


# Print out hash.
print "Total number of RTCs found: $count.\n";
print "GENE_ID\tENSEMBL_ID\tINS_CHR\tINS_START\tINS_END\n";
foreach my $key (sort keys %hash) {
	print join("\t", @{ $_ }), "\n" foreach @{ $hash{$key} };
}

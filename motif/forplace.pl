#!/usr/bin/perl -w
=head1 Info
    Script Author  : fuyuan, 907569282@qq.com
    Created Time   : 2020-03-12 00:05:00
    Example: forplace.pl
=cut
use strict;
use feature qw(say);
use Getopt::Long;
my ($help);
GetOptions(
	"help!"=>\&USAGE,)
or USAGE();

open IN,"zplace";
my %motif;
while (<IN>){
	chomp;
	my @line = split /\s+/;
	my $seq = $line[2];
	$motif{$seq} = $_;
	my $al = $seq;
	$al =~ s/R/\[AG\]/;
	$al =~ s/Y/\[CT\]/;
	$al =~ s/M/\[AC\]/;
	$al =~ s/K/\[GT\]/;
	$al =~ s/S/\[GC\]/;
	$al =~ s/W/\[AT\]/;
	$al =~ s/H/\[ATC\]/;
	$al =~ s/B/\[GTC\]/;
	$al =~ s/V/\[GAC\]/;
	$al =~ s/D/\[GAT\]/;
	$al =~ s/N/\[ATCG\]/;
	my $re=$al;
	$re =~ tr/ATCG\[\]/TAGC\]\[/;
	$re = reverse $re;
	say "echo -ne \"$_\\t\"; grep -P \"$al\|$re\" \$1 | wc -l";
}
######################### Sub Routines #########################
sub USAGE{
my $uhead=`pod2text $0`;
my $usage=<<"USAGE";
USAGE:
	perl $0
	--help	output help information to screen
USAGE
print $uhead.$usage;
exit;}

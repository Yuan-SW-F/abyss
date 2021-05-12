#!/usr/bin/perl -w
=head1 Info
    Script Author  : fuyuan, 907569282@qq.com
    Created Time   : 2020-03-11 13:22:50
    Example: rich.pl
=cut
use strict;
use feature qw(say);
use Getopt::Long;
my ($help);
GetOptions(
	"help!"=>\&USAGE,)
or USAGE();

#MOTIF GGRGACC MEME-1    width =   7  sites =  58  llr = 565  E-value = 4.3e+008
open IN,shift;
my $cut = 0;
my %motif;
my $total = 0;
while (<IN>){
	$cut ++;
	#last if $cut > 1000;
	my @line = split /\s+/;
	$motif{$line[1]} += $line[8];
	$total += $line[8];
}
my $n = keys %motif;
my $average = $total/$n;
my $sd;

for (sort {$motif{$a} <=> $motif{$b}} keys %motif){
	$sd += ($motif{$_} - $average)**2;
}
my $d = ($sd/$n)**0.5;
my $z;
for (sort {$motif{$a} <=> $motif{$b}} keys %motif){
	$z = ($motif{$_} - $average) / $d;
	say "$_\t$motif{$_}\t$z";
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

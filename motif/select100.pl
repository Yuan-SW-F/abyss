#!/usr/bin/perl -w
=head1 Info
    Script Author  : fuyuan, Yuan-SW-F, yuanswf@163.com
    Created Time   : 2021-05-12 21:06:00
    Example: select100.pl
=cut
use strict;
use feature qw(say);
use Getopt::Long;
my ($help);
GetOptions(
  "help!"=>\&USAGE,)
or USAGE();

open IN,"/vol3/asbc/CHENGSHIFENG_GROUP/fuyuan/02.Nfix/00.81species_CNE/35.CNB/15.motif/length6-100/Medicago_CNE_V1.0.clade.pav.100";
my %hash;
while (<IN>){
	$hash{$1} = 1 if /(CNE_\d+)/;
}

open IN,shift;
while (<IN>){
	/ID=(CNE_\d+)/;
	print $_ if exists $hash{$1};
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

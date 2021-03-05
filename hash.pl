#!/usr/bin/perl -w
=head1 Info
    Script Author  : root, Yuan-SW-F, yuanswf@163.com
    Created Time   : 2021-03-04 10:59:01
    Example: hash.pl
=cut
use strict;
use feature qw(say);
use Getopt::Long;
my ($help);
GetOptions(
  "help!"=>\&USAGE,)
or USAGE();

my %hash;
open IN,"zgroup.lst";
while (<IN>){
        /(\S+)\s+(\S+)/;
        $hash{$2} = $1;
}

open IN,"pcatmp.eigenvec";
while (<IN>){
        /\_(\S+)\./;
        chomp;
        my @line = split;
        say join "\t", $hash{$1}, $1, @line[2..$#line];
}
######################### Sub Routines #########################
sub USAGE{
my $uhead=`pod2text $0`;
my $usage=<<"USAGE";
USAGE:
        perl $0
        --help  output help information to screen
USAGE
print $uhead.$usage;
exit;}

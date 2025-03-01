#!/usr/bin/perl
use v5.10;
use strict;

my @ARGV = qw(hosts.txt);

my $count = 0;
my %hash;
while( <<>> ) {
	$count++;
	chomp;

	s/\s*#.*//;
	s/\s+//g;
	next unless /\S/;
	$_ = lc($_);

	if( /\A\Q||\E/ ) {
		say;
		next;
		}

	if( /[^a-z0-9.-]/i ) {
		say STDERR "Non ASCII in <$_> line $.";
		next;
		}

	my @parts = map { lc } split /\./;

	my $s = '||' . join('.', @parts[-2,-1]) . '^';
	$hash{$s}++;
	}

print <<"HERE";
# produced by $0 at @{[scalar localtime]}
# Processed $count lines.
# Output @{[ my $n = () = keys %hash ]} lines.
HERE

foreach my $key (sort keys %hash) {
	say $key;
	}


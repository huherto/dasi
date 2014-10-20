#!/usr/bin/perl -w

use strict;

open my $handle, '<', "huffpost-2014-senate-forecast.csv";
chomp(my @lines = <$handle>);
close $handle;

my %states = ();
foreach my $line (@lines) {

    my ($date, $state, $seat, $rprob, $dprob) = split(/,/,$line);

    next if $date eq "date";
    next if $state eq "US";

    $states{ $state . $seat } = $rprob / 100;

}

my @keys = sort { $a cmp $b } keys %states;

sub seatprobs {
    print "index";
    foreach my $state ( @keys ) {
        print ",$state";
    }
    print "\n1";
    foreach my $state ( @keys ) {
        print ",$states{$state}";
    }
    print "\n";    
}

sub make_election($) {
    my $i = shift;
    print $i;
    my $count = 0;
    foreach my $state ( @keys ) {
        my $p = $states{$state};
        if (rand(1) < $p) {
            print ",r";
            $count++;
        }
        else {
            print ",d";
        }
    }
    print ",$count\n";    
}


print "election";
foreach my $state ( @keys ) {
    printf ",$state";
}
print ",seats\n";    
for(my $i = 1; $i <= 10000; $i++) {
    make_election($i);
}
print "states=".int(@keys);
#!/usr/bin/perl

use strict;
use warnings;

# Initialize variables
my %send_times;   # Hash to store sending times
my %receive_times; # Hash to store receiving times

# Open the trace file for reading
open my $trace_file, '<', 'wireless.tr' or die "Could not open trace file: $!";

# Process each line of the trace file
while (<$trace_file>) {
    chomp;  # Remove newline character

    # Check for lines representing packet send events
    if (/^s -t (\S+)/) {
        my $send_time = $1;
        my ($packet_id) = /-Ii (\d+)/; # Extract packet identifier

        # Store the send time in the hash
        $send_times{$packet_id} = $send_time;
    }

    # Check for lines representing packet receive events
    if (/^r -t (\S+)/) {
        my $receive_time = $1;
        my ($packet_id) = /-Ii (\d+)/; # Extract packet identifier

        # Store the receive time in the hash
        $receive_times{$packet_id} = $receive_time;
    }
}

# Close the trace file
close $trace_file;

# Calculate and print latency for each packet
foreach my $packet_id (keys %send_times) {
    if (exists $receive_times{$packet_id}) {
        my $send_time = $send_times{$packet_id};
        my $receive_time = $receive_times{$packet_id};
        my $latency = $receive_time - $send_time;

        print "Packet $packet_id Latency: $latency seconds\n";
    }
}
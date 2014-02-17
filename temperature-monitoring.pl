#!/usr/bin/perl

use strict;
use warnings;

my $DEBUG = 0;

# E-mail variables
my $host = 'Juan Vasquez';
my $subject = "WARNING: Temperature on $host is above threshold";
my $message = "The following devices are above threshold:\n";
my $email_address = 'colby.goettel@gmail.com';
my $email_flag = 0;

# Thresholds
my $temperature_threshold = 40; # °C

# I/O variables
my $sensors_file = '/tmp/sensors.tmp';
my @current_line = ();

# Run `sensors` but remove any line not containing a temperature.
system("sensors | egrep -v \"^\$|Virtual|ISA\" | egrep \":\" > $sensors_file");
open IN, "<$sensors_file" or die "Failed to open IN: $!\n";

while ( <IN> )
{
    # Split line on ":".
    # This will give us the device name in $current_line[0] and the temperature information in $current_line[1].
    chomp(@current_line = split(/:/,$_));
    my $device = $current_line[0];
    
    # Remove leading whitespace and everything after the temperature (the high and critical temperatures).
    $current_line[1] =~ s/^\s+\+//;
    $current_line[1] =~ s/°C.*//;
    my $temperature = $current_line[1];
    
    print "Temperature: $temperature\n" if $DEBUG;
    
    # If temperature is above any of the thresholds, append the device and temperature to the e-mail message.
    if ( $temperature >= $temperature_threshold )
    {
        $email_flag = 1;
        $message .= "-$device is $temperature°C\n";
    }
}

close IN;

print $message if $DEBUG;

# Send e-mail if $email_flag is set.
if ( $email_flag )
{
    `echo "$message" | mail -s "$subject" -r $email_address $email_address`;
}

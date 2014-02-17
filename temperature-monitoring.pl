#!/usr/bin/perl

use strict;
use warnings;

my $DEBUG = 0;

# Temperature threshold. Change this variable to a reasonable number for each system.
my $temperature_threshold = 40; # °C

# E-mail variables. Change these for each system.
my $host = 'Juan Vasquez';
my $subject = "WARNING: Temperature on $host is above $temperature_threshold°C";
my $email_address = 'colby.goettel@gmail.com';
my $email_flag = 0;
my $message = '/tmp/sensors-email.tmp';

# I/O variables
my $sensors_file = '/tmp/sensors.tmp';
my @current_line = ();

# Run `sensors` and store as $message.
system("sensors > $message");
# Run `sensors` but remove any line not containing a temperature.
system("sensors | egrep -v \"^\$|Virtual|ISA\" | egrep \":\" > $sensors_file");
open IN, "<$sensors_file" or die "Failed to open IN: $!\n";

while ( <IN> )
{
    # Split line on ":".
    # This will give us the device name in $current_line[0] and the temperature information in $current_line[1].
    chomp(@current_line = split(/:/,$_));
    # my $device = $current_line[0]; # Not used.
    
    # Remove leading whitespace and everything after the temperature (the high and critical temperatures).
    $current_line[1] =~ s/^\s+\+//; # Remove everything up to and including + sign.
    $current_line[1] =~ s/°C.*//; # Remove everything after and including °C.
    my $temperature = $current_line[1];
    
    # print "Temperature: $temperature\n" if $DEBUG;
    
    # If temperature is above any of the thresholds, append the device and temperature to the e-mail message.
    if ( $temperature >= $temperature_threshold )
    {
        $email_flag = 1;
    }
}

close IN;

print $message . "\n" if $DEBUG;
$email_flag = 1 if $DEBUG;

# Send e-mail if $email_flag is set.
if ( $email_flag )
{
    `mail -s "$subject" -r $email_address $email_address < $message`;
}

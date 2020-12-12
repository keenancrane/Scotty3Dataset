#!/usr/bin/perl

open( IN, "<$ARGV[0]" ) or die "Could not open file " . $ARGV[0] . " for input.\n";

while( <IN> )
{
   @cols = split( ",", $_ );

   for( @cols )
   {
      s/"//g;
   }

   $last = $cols[5];
   $first = $cols[6];
   $id = $cols[8];

   $filename = $id . "_license.txt";
   open( OUT, ">$filename" ) or die "Could not open file " . $filename . " for output.\n";

   print OUT "$id.dae by $first $last is licensed under CC BY 4.0\n";
   print OUT "(see https://creativecommons.org/licenses/by/4.0/)\n";

   close( OUT );
}


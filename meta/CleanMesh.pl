#!/usr/bin/perl

open(  IN, "<$ARGV[0]" ) or die "Couldn't open " . $ARGV[0] . " for input.\n";
open( OUT, ">$ARGV[1]" ) or die "Couldn't open " . $ARGV[1] . " for output.\n";

$hidden = 0;
$unhide = 0;

while( <IN> )
{
   if( /<transparent>/ ||
       /<emission>/ ||
       /<shininess>/ ||
       /<reflective>/ ||
       /<index_of_refraction>/ )
   {
      $hidden = 1;
   }
   if( /semantic="NORMAL"/ )
   {
      $hidden = 1;
      $unhide = 1;
   }

   if( /id=\"(lambertian[^"]+)\"/ )
   {
      $id = $1;
      s/name=".+"/name="$id"/;
   }

   if( $hidden == 0 )
   {
      print OUT $_;
   }

   if( $unhide == 1 ||
       /<\/transparent>/ ||
       /<\/emission>/ ||
       /<\/shininess>/ ||
       /<\/reflective>/ ||
       /<\/index_of_refraction>/ )
   {
      $hidden = 0;
   }

}

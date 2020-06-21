#!/usr/bin/perl

use File::Spec;
use strict;
use warnings;
no warnings 'recursion';

sub iterate_dir {


	opendir my $dir, "@_" or die "Cannot open directory: $!";
	my @files = readdir $dir;
	print(@files);
	print("\n");
	@files = reverse(@files);
	foreach my $file (@files) {
		#if($file eq '..'){
		#	@files[0] = "";
		#}
		if(rindex($file, ".pm") != -1){
			print($file);
			print("\n");
		}
			print(File::Spec->rel2abs($file));
			print("\n");
		#if($file =~ /^.*\.\./){
		#	print("hello");
		#	goto LABEL;
		#}

			closedir $dir;
			
			iterate_dir(File::Spec->rel2abs($file));
	#LABEL:
	}

}

iterate_dir('/home/ihor/Downloads/abills-0.83.09/abills/');


#        my @dirs = grep { -d } glob "./*";
#                foreach my $dir1 (@dirs) {
#                print($dir1);
#                iterate_dir("./".$dir1);
#                #print("./".$dir);
#        }


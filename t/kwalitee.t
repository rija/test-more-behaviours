#!perl -w

use strict;
use Test::More;

eval { require Test::Kwalitee; };

plan( skip_all => 'Test::Kwalitee not installed; skipping' ) if $@;
Test::Kwalitee->import()  ;

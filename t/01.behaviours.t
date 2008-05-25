use strict;
use lib '..';
use Test::More::Behaviours 'no_plan';
use Test::Exception;
use Sub::Install;

use constant TRUE 	=> 1;
use constant FALSE 	=> 0;

my $is_setup = FALSE;

BEGIN {
	test 'should not mind if set_up or tear_down exists' => sub {
		is ($is_setup , undef , 'Should not be setup');
	} ;
}

Sub::Install::install_sub {
	code => sub { $is_setup = TRUE;},
	into => 'main',
	as   => 'set_up'
};

Sub::Install::install_sub {
	code => sub { $is_setup = FALSE;},
	into => 'main',
	as   => 'tear_down'
};

test 'setup test' => sub {
		ok( $is_setup, 'should have been setup' );
} ;

is( $is_setup, FALSE , 'Should have been torn down');

test 'Should be able to do more than one test' => sub {
		ok( $is_setup, 'should have been setup' );
} ;

is( $is_setup, FALSE , 'Should have been torn down');

#TODO: Verify TAP compatible output format


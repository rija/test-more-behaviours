package Test::More::Behaviours;

use warnings;
use strict;
use Carp;
use Sub::Uplevel;

use version; our $VERSION = qv('0.0.2');

# Other recommended modules (uncomment to use):
#  use IO::Prompt;
#  use Perl6::Export;
#  use Perl6::Slurp;
#  use Perl6::Say;


# Module implementation here

use base 'Test::More';
use Test::More;
@Test::More::Behaviours::EXPORT = ( @Test::More::EXPORT, 'test' );

use constant LOG_COMMENT_CHARACTER => '#';


sub test {
	my $description = shift;
	my $block = shift;
	print "\n" . LOG_COMMENT_CHARACTER ." " . $description . "\n";
	&main::set_up if main->can('set_up');
	uplevel 2, $block;
	&main::tear_down if main->can('tear_down');
}


1; # Magic true value required at end of module
__END__

=head1 NAME

Test::More::Behaviours - Group Test::More assertions into behaviours


=head1 VERSION

This document describes Test::More::Behaviours version 0.0.1


=head1 SYNOPSIS

		use Test::More::Behaviours tests => 9 ;
		...
		sub set_up{

		}

		sub tear_down{

		}

		test "Validating email entered during signup" => sub {

			is $l->valid_email("") => 0, "should return 0 for empty email"  ;
			is $l->valid_email("tot,\@l") => 0, "should return 0 for invalid email tot,\@l" ;
			ok $l->valid_email("hello\@world"), "should return 1 for valid email hello\@world.com" ;

		};

  
=head1 DESCRIPTION

 this module facilitate the grouping of Test::More assertions into Behaviours.
 This make the test easier to read and maintain as the assertions are logically grouped and dont' form a long list hard to the eye and prone to confusion.

 It will also make the TAP output more pleasant as the TAP lines are grouped into the behaviours defined in the test file. 

 It is also possible to define a set_up and tear_down subroutine that will be called respectively before and after each behaviour test.

=for author to fill in:
    Write a full description of the module and its features here.
    Use subsections (=head2, =head3) as appropriate.


=head1 INTERFACE 

Test::More::Behaviours exports one subroutine

=over 4

=item test

test BEHAVIOUR => sub { ASSERTIONS } ;

This is the structure used to group a collection 
of Test::More assertions around common behaviours.

BEHAVIOUR should be a concise description of the behaviour to test.
It is recommended that it has an active form and is unambigous.

ASSERTIONS is a list of Test::More assertions. 
The descriptive message for each assertion should describe what the tested behaviour 
is expected to verify. It is recommended that it always start with "should ..."

	test "validating email during signup" => sub {

		is validate("") => 0, "should return 0 for empty email"  ;
		is validate("tyudaj@&") => 0, "should return 0 for invalid email tyudaj@&" ;
		ok validate("dfd@dfdf.com"), "should return 1 for valid email dfd@dfdf.com" ;

	};

=for author to fill in:
    Write a separate section listing the public components of the modules
    interface. These normally consist of either subroutines that may be
    exported, or methods that may be called on objects belonging to the
    classes provided by the module.

=back

=head1 DIAGNOSTICS

=for author to fill in:
    List every single error and warning message that the module can
    generate (even the ones that will "never happen"), with a full
    explanation of each problem, one or more likely causes, and any
    suggested remedies.

=over

=item C<< Error message here, perhaps with %s placeholders >>

[Description of error here]

=item C<< Another error message here >>

[Description of error here]

[Et cetera, et cetera]

=back


=head1 CONFIGURATION AND ENVIRONMENT

=for author to fill in:
    A full explanation of any configuration system(s) used by the
    module, including the names and locations of any configuration
    files, and the meaning of any environment variables or properties
    that can be set. These descriptions must also include details of any
    configuration language used.
  
Test::More::Behaviours requires no configuration files or environment variables.

=head1 DEPENDENCIES

L<<Test::More>>


=head1 INCOMPATIBILITIES

=for author to fill in:
    A list of any modules that this module cannot be used in conjunction
    with. This may be due to name conflicts in the interface, or
    competition for system or program resources, or due to internal
    limitations of Perl (for example, many modules that use source code
    filters are mutually incompatible).

None reported.


=head1 BUGS AND LIMITATIONS

=for author to fill in:
    A list of known problems with the module, together with some
    indication Whether they are likely to be fixed in an upcoming
    release. Also a list of restrictions on the features the module
    does provide: data types that cannot be handled, performance issues
    and the circumstances in which they may arise, practical
    limitations on the size of data sets, special cases that are not
    (yet) handled, etc.

No bugs have been reported.

Please report any bugs or feature requests to
C<bug-test-more-behaviours@rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org>.


=head1 AUTHOR

Antony Marcano, with contributions from Rija Menage  C<< <cpan@rijam.sent.as> >>
The name was found by Tim Brown


=head1 LICENCE AND COPYRIGHT

Copyright (c) 2007, BBC << <cpan@rijam.sent.as> >>. All rights reserved.

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself. See L<perlartistic>.


=head1 DISCLAIMER OF WARRANTY

BECAUSE THIS SOFTWARE IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
FOR THE SOFTWARE, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN
OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
PROVIDE THE SOFTWARE "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER
EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE
ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE SOFTWARE IS WITH
YOU. SHOULD THE SOFTWARE PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL
NECESSARY SERVICING, REPAIR, OR CORRECTION.

IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
REDISTRIBUTE THE SOFTWARE AS PERMITTED BY THE ABOVE LICENCE, BE
LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL,
OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE
THE SOFTWARE (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING
RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A
FAILURE OF THE SOFTWARE TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF
SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF
SUCH DAMAGES.

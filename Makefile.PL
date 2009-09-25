
use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  DISTNAME  => 'POEx-Trait-DeferredRegistration',
  NAME      => 'POEx::Trait::DeferredRegistration',
  AUTHOR    => 'Nicholas\ Perez\ \<nperez\@cpan\.org\>',
  ABSTRACT  => 'A\ Trait\ for\ SessionInstantiation\ to\ defer\ POE\ Session\ registration',
  VERSION   => '0.092681',
  EXE_FILES => [ qw() ],
  (eval { ExtUtils::MakeMaker->VERSION(6.31) } ? (LICENSE => 'gpl') : ()),
  PREREQ_PM    => {
    "POEx::Role::SessionInstantiation" => '0.092673',
    "Test::More" => '0.92',
  },
  test => {TESTS => 't/*.t'}
);


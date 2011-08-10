
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Simple way to get an URL to an action from chained catalyst controller',
  'AUTHOR' => 'Torsten Raudssus <torsten@raudss.us> L<http://raudss.us/>',
  'BUILD_REQUIRES' => {
    'Test::More' => '0.96',
    'Test::Simple' => '0.98'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.30'
  },
  'DISTNAME' => 'Catalyst-Plugin-ChainedURI',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'Catalyst::Plugin::ChainedURI',
  'PREREQ_PM' => {},
  'VERSION' => '0.002',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);




{package POEx::Trait::ExtraInitialization;
our $VERSION = '0.092680';
}


#ABSTRACT: Provides a initialization behaviors for POEx::Role::SessionInstantiation objects

use MooseX::Declare;

role POEx::Trait::ExtraInitialization
{
    with 'POEx::Role::SessionInstantiation::Meta::Session::Events';
    use MooseX::Types::Moose('CodeRef');


    has initialization_method => ( is => 'ro', isa => CodeRef, required => 1 );


    after _start
    {
        $self->${\$self->initialization_method}();
    }
}

1;



=pod

=head1 NAME

POEx::Trait::ExtraInitialization - Provides a initialization behaviors for POEx::Role::SessionInstantiation objects

=head1 VERSION

version 0.092680

=head1 SYNOPSIS

    class My::Session
    {
        use POEx::Trait::ExtraInitialization;
        use POEx::Role::SessionInstantiation
            traits => [ 'POEx::Trait::ExtraInitialization' ];

        with 'POEx::Role::SessionInstantiation';

        ....
    }

    My::Session->new(initialization_method => $some_external_coderef);

    POE::Kernel->run();

=head1 DESCRIPTION

POEx::Trait::ExtraInitialization is a simple trait for SessionInstantiation to
enable passing in an arbitrary coderef for execution just after other
normal initialization

This role could also be applied upon an instance but there are some caveats. 
Your class must also consume POEx::Trait::DeferredRegistration, which will 
prevent instances from immediately being registered with POE after BUILD. 
Otherwise, _start has already been fired, and too late for extra 
initialization to execute (BUILD is advised by SessionInstantiate to do Session
allocation within POE which immediately calls _start).

=head1 ATTRIBUTES

=head2 initialization_method is: ro, isa: CodeRef, required: 1

This attribute stores the code ref that will be called as method on the
composed class.



=head1 METHODS

=head2 after _start

_start is advised to run the initialization method during the 'after' phase.
The method receives no arguments other than the invocant



=head1 AUTHOR

  Nicholas Perez <nperez@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2009 by Infinity Interactive.

This is free software, licensed under:

  The GNU General Public License, Version 3, June 2007

=cut 



__END__


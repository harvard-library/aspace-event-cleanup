# aspace-event-cleanup
Overrides a JSONModel method to eliminate a problem with reference not necessarily being URL decoded

For some unknown reason, when an event is created, the reference of the resource that gets passed to JSONModel from resolve#initialize is not CGI.unencoded, so an error is produced.

It is to be hoped that some version of Aspace beyond 2.5.0 doesn't have this problem, so that this plugin can easily be removed.

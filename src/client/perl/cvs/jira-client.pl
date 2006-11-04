#!/usr/bin/perl

# JIRA commit acceptance perl client for CVS
# Author: istvan.vamosi@midori.hu
# $Id$

use strict;
use warnings;

use XMLRPC::Lite;

# configure JIRA access
my $jiraBaseURL = "http://127.0.0.1:8080";
my $jiraLogin = "root";
my $jiraPassword = "root";

# get committer passed as arg[0]
my $committer = $ARGV[0];

# slurp log message from log message file passed as arg[1]
my $holdTerminator = $/;
undef $/;

open IN, "< $ARGV[1]" or die "Unable to open $ARGV[1].\n";
my $buffer = <IN>;
close IN;

$/ = $holdTerminator;
my @lines = split /$holdTerminator/, $buffer;
$buffer = "init";
$buffer = join $holdTerminator, @lines;

my $commitMessage = $buffer;

# print arguments
print "Committer: " . $committer . "\n";
print "Commit message: \"" . $commitMessage . "\"\n";

#  invoke JIRA web service
# TODO move this common  part to a separate.pl and use it also from the SVN client,
my $acceptance;
my $comment;

eval {
	$jiraBaseURL =~ s/\/+$//; # Remove trailing '/' if exists
	my $s = XMLRPC::Lite->proxy($jiraBaseURL . "/rpc/xmlrpc");
	my $result = $s->call("commitacc.acceptCommit", $jiraLogin, $jiraPassword, $committer, $commitMessage)->result();
	($acceptance, $comment) = split('\|', $result);
};

if ($@) {
	($acceptance, $comment) = ("false", "Unable to connect to the JIRA server at \"" . $jiraBaseURL . "\".");
};

if($acceptance eq 'true') {
	print "Commit accepted.\n";
	exit 0;
} else {
	print "Commit rejected: " . $comment . "\n";
	exit 1;
}
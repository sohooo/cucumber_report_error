# Testcase for Cucumber Report Error


## Description

The Cucmber HTML report has some additional garbage included; this happens
when there is a `Kernel.fork` and a change of ownership in the code.

You can see this in the function `execute_as` in `backup.rb`.


## Steps

There are features tagged `@normal` and `@forked`. They can be started with
Rake tasks to produce the HTML report.

NOTICE: You need to be `root` to run this (because of `Process.initgroups`);
check the code before you try it.


## Example

We check for an additional `<body>` tag to verify there is garbage in the report.
Open the HTML report in your browser to see it.

    # you need to be root
    [~/Documents/cucumber (master)⚡] ➔ id
    uid=0(root) gid=0(root) groups=0(root)

    [~/Documents/cucumber (master)⚡] ➔ rake -T
    rake forked  # execution with forked system call
    rake normal  # execution with normal system call

    [~/Documents/cucumber (master)⚡] ➔ rake normal
    running normal cukes
    normal
    # of body tags in normal.html: 1

    [~/Documents/cucumber (master)⚡] ➔ rake forked
    running forked cukes
    forked
    # of body tags in forked.html: 2


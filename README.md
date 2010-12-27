pandafu
=======
**P**ackaging **AN**d **D**eployment **A**utomation Kung **Fu** for .NET using Ruby, if you dare!


As a .NET developer I need to be able to **package** all projects in a solution so I can support a consistent **deployment** throughout my *software
delivery* process.  

As of .NET 4.0 the tooling support for software delivery automation is still lacking.  The latest support for delivering web applications is (via [webdeploy](http://www.iis.net/download/webdeploy)) is a step in the right direction.  However, its still only focused on the individual project deployment.  

The Problem
-----------
What if your solution contains multiple projects?   

Holy Crap!  OMFG!  You mean like, the *REAL WORLD*?!?

Right.  Thats exactly what I thought, too.

When you look around the deployment landscape, what did you find?  Little bit of .bat?  Little MSBuild?  Hey, PowerShell is kinda cool, but what were they smoking when they invented the syntax for it?  How about NAnt, which has been around since like forever?  You see that shiny MSI technology?  Don't look at it!  Its a trap! Don't look it in the eye, it can sense fear, and can condemn you to certain doom if you can't tame it. 

If your lucky, your team has developed a process for packaging all of your assets for deployment with a suite of scripts to actually deploy the assets in the package to your development environments.  If your truly blessed, your operations team can leverage deploying the same package into staging and production environments.  The problem?  Each of the teams have hand rolled this packaging and deployment support each time.  

Do you really feel that you should be spending your time doing this?  

When **panda(fu)** got started, it combined:

* convention
* custom configuration file
* custom MSBuild tasks
* custom MSBuild targets
* custom PowerShell script
* custom PowerShell CmdLet

Think about that for a second..MSBuild to orchestrate the process, custom MSBuild tasks for providing data to custom MSBuild targets, the occasional PowerShell script being invoked from MSBuild, and then of course, PowerShell CmdLets (or Modules in PS 2.0) - thats a lot of context switching, which causes friction for your software delivery process.  Roll that all up with a packaging convention and at least you have consistency, but its somewhat cumbersome to get there.


What if ...
--------
we dropped biases on how we get from point A to point B?  

Looking at that solution stack for our software delivery process, its a Microsoft centric stack.  Why?  Because I work in a traditional 'Microsoft' shop.  The idea of using non-Microsoft software for this process is more than some folks can handle.  Lets try to change that viewpoint.

What if our stack looked like:

* convention
* custom configuration file
* Ruby
* Rake

Rake to orchestrate the entire process and Ruby for custom Rake tasks.  That looks like a lot less of a context switch if you need to modify, or extend, the overall process.  Of course, Rake will shell out to appropriate system processes as required to enable the process (custom Rake tasks).

Where are We Going?
-------------------

* Identity deployable IIS assets from a .NET solution file
* Package those assets into a well known package format
* Deploy those assets onto a machine

That may be it.

As a freebie, we'll also include support for **deploying Windows Services** to help educate the poor ignorant bastards who feel that a Service Installer project is their only hope.  

I believe in ['infrastructure as code'](http://www.infoq.com/presentations/infrastructure-as-code) and while the above stack could also be used to deploy IIS infrastructure I would much rather evangelize [Chef](http://opscode.com/), or [Puppet](http://www.puppetlabs.com/), as a solution to that problem.


Copyright
--------
Copyright (c) 2010 Zach Bonham. See LICENSE for
further details.


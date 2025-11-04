# DotNetBox
A Dockerfile and shell script for creating a Fedora Toolbx  with the .NET SDK and Kate IDE pre-installed.

## What is this project?
This project creates a Fedora toolbox with Kate - a lightweight code editor - and the .NET SDK pre-installed. As such, it provides a script to get you up and running with a bare bones development environment for building projects in C# .NET. 

## How do I run this? 
To create the toolbox, simply open a terminal, `cd` into the root directory for this project and run `bash build.sh`. 

Once the script has completed, you can run `toolbox enter dotnetbox` to enter into the development environment. To open kate, you can then just type `kate` into the terminal, or `kate \path\to\your\directory` to open kate in a particular location. From there, you can use the [.NET command line interface](https://learn.microsoft.com/en-us/dotnet/core/tools/) to create, build, and run .NET applications

## Required dependencies
To run this script, you'll need to have a development environment with bash, Toolbx, and Podman installed. 

## Primer on Kate
An earlier version of this toolbox used [VSCodium](https://vscodium.com/), a free/libre open-source version of Microsoft's Visual Studio code with Microsoft's telemetry and proprietary components removed. The resulting toolbox, however, ran sluggishly on more lightweight laptops, causing running applications to frequently freeze. Kate is much more lightweight - as one indicator, the combined Red Hat Package Manager (rpm) package size for the `kate` and `kate-plugins` projects is around 30 MiB, while that for VSCodium is currently around 150. The resulting toolbox runs much more smoothly, while still including all the basic requirements for a solid IDE experience - a project directory side panel, an integrated terminal, git support, and language server protocol (lsp) integration for C# language development.

## Primer on Toolbx and containerized development environments
[Toolbx](https://github.com/containers/toolbox/) is a project for building containerized development environments built on OCI compliant technologies including Podman and Buildah. It comes pre-installed on Linux Fedora workstations, and is an integral part of developing on Silverblue, Fedora's atomic desktop variant. 

Traditionally, a developer would simply install whatever applications they need directly onto their laptop. This can lead to several problems: 
1. Loss of time - Setting up a desktop environment for development takes time: multiple of my past employers have had complex wikis for onboarding new developers that, including troubleshooting, could take days or even weeks to complete before new developers were ready to start work. Much of this setup is tedious work that could be automated. 
2. Lack of portability - when I switch to a new laptop, I don't want to have to go back and manually re-setup a significant part of my environment. There should be a way for me to get my old setup back with a simple console command or button click.
3. Lack of Isolation - applications can interact with each other in unexpected ways. Because of this, when running a particular workload, it can be important to setup a 'fresh' environment to ensure that the environment works correctly on its own, and to isolate it from unintended influences.

In contrast with traditional development environments, Toolbx can be used to build and run reproducible, isolated, and portable development environments with a single command. 

## Additional information
This project builds on information in the following blog post, which does a nice job explaining how to use Podman and Toolbox to build and run custom container images. 
https://williamvandervalk.com/posts/custom-toolbox-image/

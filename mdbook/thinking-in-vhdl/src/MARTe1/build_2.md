# Building MARTe1

## M for Multi-Platform

MARTe is intended to be maximally portable.  This is motivated by several design principles

1. Reusable components bound at run-time through a DSL config language enable domain and embedded experts to work together seamlessly.  Thus design on a workstation, deploy in an embedded platform is the intended workflow.
1. Portable code tends to be clean code.
1. Different platforms support a broader range of design/test tools.
1. 

## M for Make

The classic MARTe1 build process relies on `make` and manually maintained `Makefiles`.  A top level MAKEDEFAULTS directory
is populated with per-platform build rules and invocation rules.  Per source level directories have the requisite 
Makefiles with a breakdown that separates dependency declaration from per-platform variations.  The build is generally
in-source [tocheck] and so the generated software artefacts reside alongside the source code.

This build strategy is somewhat of its time (late 90s) and is pragmatic, but it is relatively expensive to maintain,
and doesn't scale well to supporting new platforms. The naming scheme in respect of separating OS from ARCH is
inconsistent.  Supporting more up to date development practices is awkward.

## Source Code Structure

MARTe is best understood as a collection of tightly coupled tools, each of which may be used independently, but which are generally expected to be used in a particular way.  The components are:

1. BaseLib2 : a hierarchically organised set of componented oriented C++ primitives, self supporting.
1. Drivers : I/O components consisting of standard wrappers for low level peripheral drivers bringing data to/from applications.
1. Runtime : top level executables and libraries which bootstrap a MARTe application from an application configuration file.
1. Utilities

## Version Control : Inclusive and Diverse

### From CVS to Git : Monoliths

MARTe predates git (2005) and subversion (2000) and so the original JET production source code was 
maintained under CVS with a private filesystem based management organised by the Plasma Operations Group.
CVS server based access was subsequently added, and the codebase was migrated to SVN hosted by
a public facing server run by IST (Instituto Superior Technico) in 2014.  This was subsequently
replaced by a github public domain copy, set up by Andre Neto and Damien Karkinsky.  This github copy
merged work that had been contributed from the intranet source systems.

### Git Submodule Reengineering

To do.


## Linux Distribution/Toolchain Support

 rt of the journey towards DevOps.


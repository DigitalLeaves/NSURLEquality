NSURLEquality
=============

Useful categories to deal with NSURL comparison, equality and equivalency between files and web resources

At the moment, only NSURL file equivalency is implemented. It will reliably indicate whether two files represented by NSURLs are the same exact resource on disk.

Usage
=====

Simply copy the NSURL+RealEquality category files to your project, import the .h and use it this way:

NSURL * path1 = ...

NSURL * path2 = ...

BOOL filesAreEquivalent = [path1 fileIsEquivalentTo: path2];

if (filesAreEquivalent) {
    // do something.
}


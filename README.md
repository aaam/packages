Description
===========
Manage many packages

Requirements
============
None

Attributes
==========
node.packages = {}

Usage
=====
{
    "packages": {
        "kernel":          "upgrade",
        "kernel-firmware": "upgrade",
        "pango":           "purge"
    },
    "run_list": [ "recipe[packages]" ]
}


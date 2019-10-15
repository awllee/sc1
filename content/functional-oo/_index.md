---
title: Functional and object-oriented programming
---

Like many programming languages for scientific computation, R supports multiple [programming paradigms](https://en.wikipedia.org/wiki/Programming_paradigm).

Programming paradigms, roughly speaking, describe ways in which one can structure and ultimately write larger programs. There are two main approaches to programming: imperative and declarative.

In an imperative approach, one defines a sequence of instructions that modify the "state" of the program. This is quite natural when one considers that most computer hardware ultimately requires programs to be translated into machine code: specific instructions that read and write from registers and memory, perform arithmetic operations on the contents of registers, jump to various instructions in the machine code, etc. A high-level, imperative language abstracts away some of that tedious detail while retaining the feature that a program is a sequence of explicit instructions.

Object-oriented programming falls into the imperative paradigm. Objects combine state and methods together, and programs are defined via the construction of objects and interaction between objects.

In a declarative approach, roughly speaking, a sequence of operations is defined that determines what the output of the program should be. The precise details of how the sequence of operations will be reduced to primitive operations is left to the implementation of the language.

Functional programming falls into the declarative paradigm. In a purely functional language, there is no program state and functions are practically identical to mathematical functions. One can view a program as a sequence of function applications.

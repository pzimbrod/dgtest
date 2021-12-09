Reference Code in Discontinuous Galerkin Code for Benchmarks
=====

This repository serves as a MOOSE-based application that implements the Discontinuous Galerkin (DG) method.

It contains a few examples and benchmark cases to test the performance of other solvers (PIML) against an established baseline.

Installing
----------

A valid Installation of the [MOOSE Framework](https://mooseframework.inl.gov/getting_started/installation/) is required.

To compile the app, `cd` into the directory and run `make -j` to compile. It should output an executable `dgtest-opt` upon completion.


"Fork dgtest" to create a new MOOSE-based application.

For more information see: [http://mooseframework.org/create-an-app/](http://mooseframework.org/create-an-app/)

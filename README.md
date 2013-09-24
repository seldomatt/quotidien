quotidien
=========

Dummy App for Demonstrating BDD With RubyMotion

Setup
==========

`$ git clone git@github.com:seldomatt/quotidien.git`

`$ cd quotidien`

`$ rvm use ruby-2.0.0`

`$ rvm gemset create qmotion`

`$ cd ..`

`$ cd quotidien`

`$ bundle`

Cycle Through Tags to 'build' the app and specs
===============================================

The app is setup so each tagged commit (1-10) represents a different step along the path to building a basic app

for generating random quotes using the [theysaidso.com](http://theysaidso.com/api) API.  Run:

`$ git checkout <tagnumber>`

to cycle through the commits and 'write' integration tests using Frank-Cucumber, and functional/unit tests using MacBacon.

Run 

`$ rake spec`

and 

`$ rake frank`

to run the specs.  Cycle through the commits and watch them pass.  Rock  ; )




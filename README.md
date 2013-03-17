WebGLCraft
==============

WebGL implementation of [Minecraft](http://www.minecraft.net/) written in [Coffeescript](http://jashkenas.github.com/coffee-script/).

The [original implementation](http://github.com/danielribeiro/WebGLCraft) was refactored to use
[browserify](https://github.com/substack/node-browserify) for the bundling process. 

The bundle includes the source maps of all original CoffeeScript files and thus you are able to read and debug the
original code in all browsers that support source maps

All libraries used that didn't support commonsJS were shimmed with [browserify-shim](https://github.com/thlorenz/browserify-shim).

Consult [the build](https://github.com/thlorenz/WebGLCraft/blob/master/build.coffee) file to get a better understanding
how this step works.

You can see a demo [here](http://thlorenz.github.com/WebGLCraft/).

Installing
----
    git clone git://github.com/thlorenz/WebGLCraft.git && cd WebGLCraft 
    npm install

Compiling
----

To compile, run:

    coffee build 

If you wanna see the game locally, you need python, and you run 

    cake server

which simply runs


    python -m SimpleHTTPServer

enabling you to open the game on [http://localhost:8000/public/](http://localhost:8000/public/).


To run the tests, simply run: 

***tests don't work currently since the necessary adjustments after the browserify switch have not been done***

    cake spec

The tests are powered by [Jasmine](http://pivotal.github.com/jasmine/), and can also be seen
on the browser (useful for debugging) by opening test/web_runner.html.


Meta
----

Created by Daniel Ribeiro. Not affiliated with Mojang. Minecraft is a trademark of [Mojang](http://mojang.com/).

Released under the MIT License: http://www.opensource.org/licenses/mit-license.php

http://github.com/danielribeiro/WebGLCraft

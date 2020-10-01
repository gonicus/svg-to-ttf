SVG to TTF conversion
=====================
![Docker Pulls](https://img.shields.io/docker/pulls/gonicus/svg-to-ttf) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

In some cases you've the task to integrate lots of icons into your application. All
these icons need to be scaleable to play well with high DPI displays, and should be
colorizable on demand (i.e. when a state changes, or an interaction takes place).

Putting all these icons in your application using SVGs might be the first option that
comes to mind, but it turns out, that the rendering perfomance may suffer in some cases
and that including icons by SVG increases the size of your application dramatically. That's
the point where fonts can be used:

 * scaleable (no need for multiple bitmap icons in various sizes)
 * rendering quickly as text glyphs
 * colorizable by just setting the text color
 * smaller in size (i.e. ~800 icons, SVGs 3.2M, TTF 0.2M)

Using fonts may not be applicable in all cases, because there are also drawbacks:

 * only monochrome (at least for a standard font out of the box)
 * SVGs may need some extra love (i.e. we'd recommend only using a single *path* in them)
 * font editors are a bit special for people not comfortable with them

So - `svg-to-ttf` is a small utility script that helps in creating icon fonts for use
in *C++* based applications. It crawls thru a given directory and collects all SVGs, puts
them in a TTF file and maintains a map where you can lookup the fonts character index when
passing in the original SVG path.


Installation
============

As it needs fontawesome and it's python bindings, we recommend using a pre-built *docker*
image. All you need is `docker`/`podman` and access to *docker hub*. On a Unix style system,
you can install the wrapper script like this:

```sh
curl https://raw.githubusercontent.com/gonicus/svg-to-ttf/master/svg-to-ttf --output svg-to-ttf
chmod +x svg-to-ttf
```

Move the svg-to-ttf to a directory in path of your choice (i.e. `~/.local/bin`). Test it for
the first time and let *docker* pull some layers first:

```sh
svg-to-ttf --help
```

```
usage: svg-to-ttf [-h] [--font-name FONT_NAME] [--copyright COPYRIGHT] [--output OUTPUT] [--strip-bounding-rect] [--qt] [--qml-namespace QML_NAMESPACE] [--qml-element QML_ELEMENT] source

positional arguments:
  source

optional arguments:
  -h, --help            show this help message and exit
  --font-name FONT_NAME
                        name of the generated font
  --copyright COPYRIGHT
                        copyright notice placed inside the generated TTF file
  --output OUTPUT       path where generated files are placed
  --strip-bounding-rect
                        path where generated files are placed
  --qt                  whether to build Qt/QML style output files
  --qml-namespace QML_NAMESPACE
                        name of the QML namespace used in your .pro file
  --qml-element QML_ELEMENT
                        name of the QML icon element for this font

```


From source
-----------

Alternatively you may want to run it from source. Just run the python script in the src directory direcly and make
sure that you have

 * Python 3
 * Beautifulsoup 4
 * Fontforge bindings for Python 3

around.


Example with Qt/QML
===================



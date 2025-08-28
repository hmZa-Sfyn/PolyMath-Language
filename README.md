

# The polymath programming language V1

polymath is a programming language that works best when you're scripting on
your terminal. It tries to combine the elegance of languages
such as Python, or Ruby with the convenience of Bash.

``` bash 
#!/usr/bin/env abs
cli = require('@cli')

res = {"count": 0}

@cli.cmd("count", "prints a counter", {})
f counter(arguments, flags) {
    echo(res.count)
}

@cli.cmd("incr", "Increment our counter", {})
f incr(arguments, flags) {
    res.count += 1
    return "ok"
}

@cli.cmd("incr_by", "Increment our counter", {})
f incr_by(arguments, flags) {
    echo("Increment by how much?")
    n = stdin().number()
    res.count += n
    return "ok"
}

cli.repl()

```

``` bash
# ... is a special "keyword" to identify
# the arguments passed to the current function

f breakline() {
    echo("--------")
}

f f1() {
    echo(...)
}

f1("hello %s", "world")

breakline()

f f2() {
    echo(....len())
}

f2(1,2,3,4,5)

breakline()

f f3() {
    echo(sum(... + [1]))
}

f3(1)

breakline()

f f4() {
    for arg in ... {
        echo(arg)
    }
}

f4(1,2,3,4,5)

```

``` bash
ip = `curl -s 'https://api.ipify.org?format=json' | jq -rj ".ip"`
echo("your ip is " + ip)
```

Basic pipe stuff!

``` bash
a = "1.2.3.4.5.6.7"
     | split(".") 
     | map(int)
     | map(f(x) {x * 10})

echo(a)

```

Wondering how to run this code? Grab the latest

```shell
#IN WINDOWS
iwr -useb https://raw.githubusercontent.com/hmZa-Sfyn/PolyMath-Language/refs/heads/main/install.ps1 | iex
```

```
$ polymath1 script.pms
```

## Installation

The easiest way is to:

``` bash
#IN WINDOWS
iwr -useb https://raw.githubusercontent.com/hmZa-Sfyn/PolyMath-Language/refs/heads/main/install.ps1 | iex
```

then you can:

``` bash
$ polymath1 path/to/scripts.pms
```

## Documentation

Visit [polymathlang website](https://polymathlang.vercel.app) or check the [examples directory](https://github.com/hmZa-Sfyn/PolyMath-Language/tree/main/examples),
which contains a few short scripts.



## Status

polymath is fresh and under active development; exciting
things happen on a weekly basis!

Have a look at the roadmap [here](https://polymathlang.vercel.app/roadmap):
to know of what version we're currently working on take a look at [change log & roadmap](https://polymathlang.vercel.app/roadmap)
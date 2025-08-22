

# The polymath programming language V1

PLOYMATH is a programming language that works best when you're scripting on
your terminal. It tries to combine the elegance of languages
such as Python, or Ruby with the convenience of Bash.

``` bash
tz = `cat /etc/timezone`
continent, city = tz.split("/")

echo("Best city in the world?")

selection = stdin()

if selection == city {
  echo("You might be biased...")
}
```

Let's try to fetch our IP address and print the sum of its
parts if it's higher than 100. Here's how you do it
in Bash:

``` bash
# Simple program that fetches your IP and sums it up
RES=$(curl -s 'https://api.ipify.org?format=json' || "ERR")

if [ "$RES" = "ERR" ]; then
    echo "An error occurred"
    exit 1
fi

IP=$(echo $RES | jq -r ".ip")
IFS=. read first second third fourth <<EOF
${IP##*-}
EOF

total=$((first + second + third + fourth))
if [ $total -gt 100 ]; then
    echo "The sum of [$IP] is a large number, $total."
fi
```

And here's the same code in PolyMath:

``` bash
# Simple program that fetches your IP and sums it up
res = `curl -s 'https://api.ipify.org?format=json'`

if !res.ok {
  echo("An error occurred: %s", res)
  exit(1)
}

ip = res.json().ip
total = ip.split(".").map(int).sum()
if total > 100 {
    echo("The sum of [$ip] is a large number, $total.")
}
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

Visit [abs-lang.org](https://polymathlang.vercel.app) or check the [examples directory](https://github.com/hmZa-Sfyn/PolyMath-Language/tree/main/examples),
which contains a few short scripts.



## Status

PLOYMATH is fresh and under active development; exciting
things happen on a weekly basis!

Have a look at the roadmap [here](https://github.com/hmZa-Sfyn/PolyMath-Language/milestones):
to know of what version we're currently working on take a look at [abs-lang.org/misc/technical-details](https://polymathlang.vercel.app/misc/technical-details).

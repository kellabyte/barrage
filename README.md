<img src="barrage.jpg" alt="Barrage" width="140" height="140">
# Barrage
Barrage is a benchmarking tool and has the goal to fill the following roles.

- Orchestrate running the benchmark on the server and client(s).
- Collect benchmark statistics (requests per second and latency distribution).
- Collect hardware and OS statistics (CPU, memory, disk, network, etc).
- Generate graphs.

# Ideas
My initial thought is Barrage will have an agent and orchestrator mode. Once the benchmark run is complete it will post the benchmark details to a Gist on GitHub including the graphs.

# Prerequisites
Barrage only runs on operating systems with `dstat` and won't work on Mac OSX yet. In the future roles not collecting system metrics won't have this restriction.

You need some packages and gems on Linux installed to run Barrage. For example on Ubuntu you will need the following packages.

```sudo apt-get install dstat gnuplot xclip
gem install bundler```

# Installing
`gem install barrage_bench`

# Running
`barrage capture` and `CTRL-C` will exit the dstat capturing and plot the graphs and post them to imgur and report a link to the image. 

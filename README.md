<img src="barrage.jpg" alt="Barrage" width="140" height="140">
# Barrage
Barrage is a benchmarking tool and has the goal to fill the following roles.

- Orchestrate running the benchmark on the server and client(s).
- Collect benchmark statistics (requests per second and latency distribution).
- Collect hardware and OS statistics (CPU, memory, disk, network, etc).
- Generate graphs.

There are 3 system roles in Barrage.
- Orchestrator
- Server
- Clients

# Ideas
My initial thought is Barrage will have an agent and orchestrator mode. Once the benchmark run is complete it will post the benchmark details to a Gist on GitHub including the graphs.

# Prerequisites
- **Orchestrator**    
  Ubuntu `subo apt-get install ansible`    
  Mac `brew install ansible`

- **Server**    
  Ubuntu
  ```
  sudo apt-get install dstat gnuplot xclip
  gem install bundler
  ```

# Installing
```
gem install barrage_bench
```

# Running
```
barrage benchmark playbooks/haywire
```

# Available playbooks
[Haywire](playbooks/haywire)

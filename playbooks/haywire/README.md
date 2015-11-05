# Haywire barrage benchmark
This playbook does the following sequence:

#### Server
- Git clone Haywire and its dependencies.
- Compile Haywire and it's dependencies.
- Starts Haywire and listens for HTTP connections.

#### Client
- Git clone Haywire and its dependencies.
- Compile Haywire and it's dependencies (comes with benchmark tools).
- Run benchmark
 
### Server
- Kills the Haywire process.

# Configuration
You need to edit the following files to fit your environment.
- `playbooks/haywire/hosts`
- `playbooks/haywire/config.yaml`

# Running the benchmark
`barrage benchmark playbooks/haywire`

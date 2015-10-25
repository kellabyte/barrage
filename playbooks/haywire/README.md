# Haywire barrage benchmark
This playbook git clones, compiles Haywire and all its dependencies required to run the Haywire server and the benchmark tools and then runs the benchmark.

# Configuration
You need to edit the following files to fit your environment.
- `playbooks/haywire/hosts`
- `playbooks/haywire/config.yaml`

# Running the benchmark
`barrage benchmark playbooks/haywire`

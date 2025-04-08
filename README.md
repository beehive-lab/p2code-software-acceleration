





# TornadoVM P2Code Runner (NVIDIA)

This project provides a Docker-based environment to compile and execute TornadoVM-accelerated Java programs using the OpenCL backend on NVIDIA GPUs.

---

## 1. Build the Docker Image or pull the latest image from DockerHub

Make sure you have Docker installed and NVIDIA drivers properly set up for GPU passthrough.

- To build the Docker image, run:

```bash
./buildDocker.sh
```

- To pull from DockerHub, run:

```bash
docker pull beehivelab/p2code-software-acceleration-container:latest
```

## 2. Run the Example

You can run the `VectorAddInt.java` class which uses the TornadoVM API to offload the execution of a method for execution on NVIDIA GPUs.

```bash
./run-software-acceleration.sh examples/VectorAddInt.java
🔧 Compiling /data/examples/VectorAddInt.java...
✅ Compilation successful
🚀 Running with TornadoVM: VectorAddInt
WARNING: Using incubator modules: jdk.incubator.vector
Task info: s0.t0
    Backend           : OPENCL
    Device            : NVIDIA RTX A2000 8GB Laptop GPU CL_DEVICE_TYPE_GPU (available)
    Dims              : 1
    Global work offset: [0]
    Global work size  : [256]
    Local  work size  : [256, 1, 1]
    Number of workgroups  : [1]

Result is correct
```

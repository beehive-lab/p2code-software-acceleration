# TornadoVM P2Code Runner (NVIDIA)

This project provides a Docker-based environment to compile and execute TornadoVM-accelerated Java programs using the OpenCL backend on NVIDIA GPUs.

---

## 1. Build the Docker Image

Make sure you have Docker installed and NVIDIA drivers properly set up for GPU passthrough.

To build the Docker image, run:

```bash
./buildDocker.sh
```

## 2. Run the Example

You can run the `VectorAddInt.java` class which uses the TornadoVM API to offload the execution of a method for execution on NVIDIA GPUs.

```bash
./run-software-acceleration.sh examples/VectorAddInt.java
```

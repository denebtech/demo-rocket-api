# Demo Rocket API

A simple REST API built with Rust and the Rocket web framework, designed for containerized deployment demonstrations.

## 📋 Overview

This project is a lightweight web API that provides basic endpoints for ping checks with host and environment information.

## 🚀 Features

- **Simple REST API** with two endpoints
- **Docker containerization** with multi-stage builds
- **Ping check functionality** for container information
- **Minimal resource footprint** using Debian slim base image
- **Security-focused** with non-root user execution

## 🛠️ Technology Stack

- **Language**: Rust v1.87.0
- **Web Framework**: Rocket 0.5.1
- **Containerization**: Docker with multi-stage builds
    - **Base Images**: 
        - Build: `rust:1.87.0-slim-bullseye`
        - Runtime: `debian:bookworm-slim`

## 📡 API Endpoints

### `GET /`
Returns a simple "Hello, world!" message.

**Response:**
```
Hello, world!
```

### `GET /ping`
Returns environment information including hostname and environment variable.

**Response:**
```
Pong from hostname: <hostname>. Environment: <ENVIRONMENT>
```

## 🏃‍♂️ Getting Started

### Prerequisites

- Rust 1.87.0 or later
- Docker (for containerized deployment)

### Local Development

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd demo-rocket-api
   ```

2. **Run locally**
   ```bash
   cargo run
   ```

3. **Test the endpoints**
   ```bash
   curl http://localhost:8000/
   curl http://localhost:8000/ping
   ```


## ⚙️ Configuration

### Environment Variables

| Variable         | Description | Default |
|------------------|-------------|---------|
| `ROCKET_ADDRESS` | Server bind address | `0.0.0.0` |
| `ENVIRONMENT`    | Environment identifier | `Undefined` |

### Docker Configuration

The application runs as a non-privileged user (`appuser`) for enhanced security and exposes port 8000.

## 🔧 Development

### Project Structure

```
├── Cargo.toml          # Rust package configuration
├── Cargo.lock          # Dependency lock file
├── src/
│   └── main.rs         # Main application code
├── Dockerfile          # Container build instructions
├── compose.yml         # Docker Compose configuration
└── README.md           # Documentation
```

### Building

```bash
# Debug build
cargo build

# Release build
cargo build --release

# Run tests
cargo test

# Check code formatting
cargo fmt --check

# Run clippy lints
cargo clippy
```

## 📝 License

This project is available under the MIT License. See the LICENSE file for more details.

## 🔗 Related Resources

- [Rocket Documentation](https://rocket.rs/)
- [Rust Documentation](https://doc.rust-lang.org/)
- [Docker Documentation](https://docs.docker.com/)

---

**Note**: This is a demonstration project designed for learning container deployment patterns and is not intended for production use without additional security and monitoring considerations.

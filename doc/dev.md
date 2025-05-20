# Development Environment Setup

## nodejs

### Using fnm (Fast Node Manager)

[fnm](https://github.com/Schniz/fnm) is a fast and user-friendly Node.js version manager written in Rust. It is much faster than nvm and supports Fish shell natively.

#### Install fnm on Arch Linux

```sh
yay -S fnm
```

#### Configure fnm for Fish shell

Add the following to your `~/.config/fish/config.fish`:

```fish
# Initialize fnm automatically
fnm env | source
```

#### Usage

```sh
# Install the latest LTS version of Node.js
fnm install --lts

# Install a specific version
fnm install 18

# List installed versions
fnm list

# Use a specific version
fnm use 18

# Set a default version
fnm default 18

# Check current version
node -v
```

#### China Mirrors for fnm

To speed up Node.js downloads in China, set the following environment variable in your `~/.config/fish/config.fish`:

```fish
set -x FNM_NODE_DIST_MIRROR https://npmmirror.com/mirrors/node
```

To also set the npm registry mirror for China, add:

```fish
set -x NPM_CONFIG_REGISTRY https://registry.npmmirror.com
```

## python

### Using uv (Fast Python Environment Manager)

[uv](https://github.com/astral-sh/uv) is a fast, modern Python package and virtual environment manager, serving as a drop-in replacement for pip and venv.

#### Install uv on Arch Linux

```sh
yay -S uv
```

#### Usage

```sh
# Create a new virtual environment in the current directory
uv venv .venv

# Activate the environment (Fish shell)
source .venv/bin/activate.fish

# Install packages
uv pip install requests

# List installed packages
uv pip list

# Upgrade packages
uv pip install --upgrade <package>

# Deactivate the environment
deactivate
```

#### China Mirrors for uv

To speed up package downloads in China, set the pip index mirror in your environment or in `~/.pip/pip.conf`:

```fish
set -x PIP_INDEX_URL https://pypi.tuna.tsinghua.edu.cn/simple
set -x PIP_TRUSTED_HOST pypi.tuna.tsinghua.edu.cn
```

### pip (Python)

Add the following to your `~/.pip/pip.conf` (create the file if it does not exist):

```ini
[global]
index-url = https://pypi.tuna.tsinghua.edu.cn/simple
trusted-host = pypi.tuna.tsinghua.edu.cn
```

Other popular pip mirrors:

- https://pypi.mirrors.ustc.edu.cn/simple
- https://mirrors.aliyun.com/pypi/simple

### npm (Node.js)

Set the registry to a China mirror:

```sh
npm config set registry https://registry.npmmirror.com
```

Or edit `~/.npmrc` and add:

```
registry=https://registry.npmmirror.com
```

Other npm mirrors:

- https://registry.npm.taobao.org (deprecated, now redirects to npmmirror)

---

Add more mirrors for other tools as needed.

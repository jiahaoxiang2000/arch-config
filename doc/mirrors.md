# China Software Development Mirrors

This document collects mirror configurations for common development tools to improve download speed and reliability in China.

## pip (Python)

Add the following to your `~/.pip/pip.conf` (create the file if it does not exist):

```ini
[global]
index-url = https://pypi.tuna.tsinghua.edu.cn/simple
trusted-host = pypi.tuna.tsinghua.edu.cn
```

Other popular pip mirrors:

- https://pypi.mirrors.ustc.edu.cn/simple
- https://mirrors.aliyun.com/pypi/simple

## npm (Node.js)

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

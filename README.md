<p align="center">
  <img alt="gitlab" src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQYfhC8pImPXqjjQkZfOH2bAMltzPE5w9QMQJd8dUVqGCICbpF1&usqp=CAU" width="250px" float="center"/>
</p>

<h1 align="center">GitLab CI Lint your CI/CD File</h1>

<p align="center">
  <strong>This is a simple project that help when you want check your GitLab CI File</strong>
</p>

<p align="center">
  <a href="https://github.com/lpmatos/gitlab-ci-lint">
    <img alt="Open Source" src="https://badges.frapsoft.com/os/v1/open-source.svg?v=102">
  </a>

  <a href="https://github.com/lpmatos/gitlab-ci-lint/graphs/contributors">
    <img alt="GitHub Contributors" src="https://img.shields.io/github/contributors/lpmatos/gitlab-ci-lint">
  </a>

  <a href="https://github.com/lpmatos/gitlab-ci-lint">
    <img alt="GitHub Language Count" src="https://img.shields.io/github/languages/count/lpmatos/gitlab-ci-lint">
  </a>

  <a href="https://github.com/lpmatos/gitlab-ci-lint">
    <img alt="GitHub Top Language" src="https://img.shields.io/github/languages/top/lpmatos/gitlab-ci-lint">
  </a>

  <a href="https://github.com/lpmatos/gitlab-ci-lint/stargazers">
    <img alt="GitHub Stars" src="https://img.shields.io/github/stars/lpmatos/gitlab-ci-lint?style=social">
  </a>

  <a href="https://github.com/lpmatos/gitlab-ci-lint/commits/master">
    <img alt="GitHub Last Commit" src="https://img.shields.io/github/last-commit/lpmatos/gitlab-ci-lint">
  </a>

  <a href="https://github.com/lpmatos/gitlab-ci-lint">
    <img alt="Repository Size" src="https://img.shields.io/github/repo-size/lpmatos/gitlab-ci-lint">
  </a>

  <a href="https://github.com/lpmatos/gitlab-ci-lint/issues">
    <img alt="Repository Issues" src="https://img.shields.io/github/issues/lpmatos/gitlab-ci-lint">
  </a>

  <a href="https://github.com/lpmatos/gitlab-ci-lint/blob/master/LICENSE">
    <img alt="MIT License" src="https://img.shields.io/github/license/lpmatos/gitlab-ci-lint">
  </a>
</p>

<p align="center">
  <a href="#pre-requisites">Pre-Requisites</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#description">Description</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#environment-variables">Environment Variables</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#how-to-contribute">How to contribute</a>
</p>

## ▶️ Getting Started

Starting with **git clone**:

```bash
git clone --depth 1 https://github.com/lpmatos/gitlab-ci-lint.git -b master
```

This will give access on your local machine to this project.

## ☕ Buy me a coffee

Pull requests are welcome. If you'd like to support the work and buy me a ☕, I greatly appreciate it!

<a href="https://www.buymeacoffee.com/EatdMck" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: 41px !important;width: 100px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>

## 🚏 Pre-requisites

To this project you yeed:

- Ruby.
- Docker.
- Docker Compose.
- Install all Dependencies.

## Gem Steps

```bash
gem build .\gitlab.gemspec
gem install .\gitlab-ci-lint-0.1.2.gem
gem push .\gitlab-ci-lint-0.1.2.gem
```

## Environment variables

**Name**  |  **Description**
:---:  |  :---:
**GITLAB_ENDPOINT**  |  GitLab API Lint Endpoint
**GITLAB_CI_FILE**  |  GitLab CI File
**VALUES**  |  Values File
**LOG_FILE**  |  Log File

## 🐋 Development with Docker

Steps to build the Docker Image.

### Build

```bash
docker image build -t <IMAGE_NAME> -f <PATH_DOCKERFILE> <PATH_CONTEXT_DOCKERFILE>
docker image build -t <IMAGE_NAME> . (This context)
```

### Run

Steps to run the Docker Container.

* **Linux** running:

```bash
docker container run -d -p <LOCAL_PORT:CONTAINER_PORT> <IMAGE_NAME> <COMMAND>
docker container run -it --rm --name <CONTAINER_NAME> -p <LOCAL_PORT:CONTAINER_PORT> <IMAGE_NAME> <COMMAND>
```

* **Windows** running:

```
winpty docker.exe container run -it --rm <IMAGE_NAME> <COMMAND>
```

For more information, access the [Docker](https://docs.docker.com/) documentation or [this](docs/annotations/docker.md).

## 🐋 Development with Docker Compose

Build and run a docker-compose.

```bash
docker-compose up --build
```

Down all services deployed by docker-compose.

```bash
docker-compose down
```

Down all services and delete all images.

```bash
docker-compose down --rmi all
```

## 📣 Usage

<kbd>gitlab_ci_lint --help</kbd> - Helper

## ➤ Author <a name = "author"></a>

👤 Hey!! If you like this project or if you find some bugs feel free to contact me in my channels:

>
> * Linktree: https://linktr.ee/lpmatos
>

## ➤ Versioning <a name = "versioning"></a>

To check the change history, please access the [**CHANGELOG.md**](CHANGELOG.md) file.

## ➤ Project status <a name = "project-status"></a>

This repository is a study project, therefore, it will not always be maintained 👻.

## ➤ Donations <a name = "donations"></a>

<p align="center">
  <a href="https://www.blockchain.com/pt/btc/address/bc1qn50elv826qs2qd6xhfh6n79649epqyaqmtwky5">
    <img alt="BTC Address" src="https://img.shields.io/badge/BTC%20Address-black?style=for-the-badge&logo=bitcoin&logoColor=white">
  </a>

  <a href="https://live.blockcypher.com/ltc/address/ltc1qwzrxmlmzzx68k2dnrcrplc4thadm75khzrznjw/">
    <img alt="Litecoin Address" src="https://img.shields.io/badge/Litecoin%20Address-black?style=for-the-badge&logo=litecoin&logoColor=white">
  </a>
</p>

## ➤ Show your support <a name = "show-your-support"></a>

<div align="center">

Give me a ⭐️ if this project helped you!

<p>
  <img alt="gif-header" src="https://www.icegif.com/wp-content/uploads/baby-yoda-bye-bye-icegif.gif" width="350px" float="center"/>
</p>

Made with 💜 by [me](https://github.com/lpmatos) 👋 inspired on [readme-md-generator](https://github.com/kefranabg/readme-md-generator)

</div>

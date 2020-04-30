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

## Getting Started

To use this repository you need to make a **git clone**:

```bash
git clone --depth 1 https://github.com/lpmatos/gitlab-ci-lint.git -b master
```

This will give access on your **local machine** to this project.

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

## 🎒 How to contribute

1. Make a **Fork**.
2. Follow the project organization.
3. Add the file to the appropriate level folder - If the folder does not exist, create according to the standard.
4. Make the **Commit**.
5. Open a **Pull Request**.
6. Wait for your pull request to be accepted.. 🚀

Remember: There is no bad code, there are different views/versions of solving the same problem. 😊

## 🔔 Add to git and push

You must send the project to your GitHub after the modifications

```bash
git add -f .
git commit -m "Added - Fixing somethings"
git push origin master
```

## 📋 Versioning

- [CHANGELOG](CHANGELOG.md)

## 📜 License

Distributed under the MIT License. See [LICENSE](LICENSE) for more information.

## ☎️ Contacts

Hey!! If you like this project or if you find some bugs feel free to contact me in my channels:

* **Email**: luccapsm@gmail.com
* **Linkedin**: www.linkedin.com/in/lucca-pessoa-4abb71138/

[![Facebook](https://github.frapsoft.com/social/facebook.png)](https://www.facebook.com/lucca.pessoa.9)
[![Github](https://github.frapsoft.com/social/github.png)](https://github.com/lpmatos)

## ✨ Contributors

<table>
  <tr>
    <td align="center"><a href="https://github.com/lpmatos"><img src="https://avatars2.githubusercontent.com/u/58797390?s=400&v=4" width="100px;" alt=""/><br /><sub><b>Lucca Pessoa</b></sub></a><br /><a href="https://github.com/lpmatos/gitlab-ci-lint/commits?author=lpmatos" title="Code">💻</a></a></td>
  <tr>
</table>

## 🐯 Autor

<table>
  <tr>
    <td align="center"><a href="https://github.com/lpmatos"><img src="https://avatars2.githubusercontent.com/u/58797390?s=400&v=4" width="100px;" alt=""/><br /><sub><b>Lucca Pessoa</b></sub></a><br /><a href="https://github.com/lpmatos/gitlab-ci-lint/commits?author=lpmatos" title="Code">💻</a> <a href="https://github.com/lpmatos/gitlab-ci-lint/commits?author=lpmatos" title="Design">🎨</a></td>
  <tr>
</table>

## ✳️ Project Status

* 🔛 In production

---

<p align="center">Feito com ❤️ by <strong>Lucca Pessoa :wave:</p>

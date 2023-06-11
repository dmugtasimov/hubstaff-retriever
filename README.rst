Local development environment setup for Linux
========================================================================

This section describes how to setup development environment to run source code locally
for Debian-based distributions (tested on Linux Mint 21.1 specifically)

Initial setup
+++++++++++++
Once initial setup is done only corresponding `Update`_ section should be performed
to get the latest version for development.

#. Install prerequisites (
   as prescribed at https://github.com/pyenv/pyenv/wiki/Common-build-problems and some other)::

    sudo apt update && \
    sudo apt install -y git make build-essential libssl-dev zlib1g-dev libbz2-dev \
                libreadline-dev libsqlite3-dev libncurses5-dev \
                libncursesw5-dev xz-utils libffi-dev liblzma-dev \
                python3-openssl libpq-dev

#. Install Docker according to https://docs.docker.com/engine/install/ubuntu/
   (known working: Docker version 20.10.18, build b40c2f6, Docker Compose version v2.4.1)

#. Add your user to docker group::

    sudo usermod -aG docker $USER
    exit  # you may actually need to reboot for group membership to take effect

#. Clone the repository::

    git clone git@github.com:dmugtasimov/hubstaff-retriever.git

#. [if you have not configured it globally] Configure git::

    git config user.name 'Firstname Lastname'
    git config user.email 'youremail@youremail_domain.com'

#. Install and configure `pyenv` according to https://github.com/pyenv/pyenv#basic-github-checkout
#. Install Python 3.11.4::

    pyenv install 3.11.4

#. Install Poetry::

    export PIP_REQUIRED_VERSION=23.1.2
    pip install pip==${PIP_REQUIRED_VERSION} && \
    pip install virtualenvwrapper && \
    pip install poetry==1.5.1 && \
    poetry config virtualenvs.path ${HOME}/.virtualenvs && \
    poetry run pip install pip==${PIP_REQUIRED_VERSION}

#. Do `Update`_ section

Update
++++++

#. Update::

    make update


QA tools
++++++++

#. Lint::

    make lint

#. Test::

    make test

#. Lint and test::

    make lint-and-test

This is a technical last line to serve as `end-of-file-fixer` workaround.

# local-pypi

local pypi server for development installations

based on [private-pypi](https://pypi.org/project/private-pypi/)

## NOTE THIS IS A LARGE REPOSITORY. WE RECOMMEND USING `git clone --depth 1` to reduce network latency!

to start the local-pypi server on your development machine, execute the `run.sh` script:

```
./run.sh
```

to use the local pypi server as your local repo:

set your `PIP_INDEX_URL` in the `.env` file to this:
```
PIP_INDEX_URL=http://local-pypi:some_password@localhost:8888/simple/
```

To login to the admin interface and browse packages, simply open the [PIP_INDEX_URL](http://local-pypi:some_password@localhost:8888/simple/) above in your browser!


to add additional packages to the local repo use the add_package.sh helper script.  This script requires you have the `twine` utility available. To install twine run:

```
pip3 install twine
```

to add a package to your repo, you must build the package as a SOURCE distribution.  The resulting file will have a `.tar.gz` extension:

```
cd /path/to/your/project/root;
python3 setup.py sdist;
# to show your archive file
ls dist/
```

to push the source package to your pypi:
```
./add_package.sh /Users/jungwirth/src/person-pipeline/dist/person-pipeline-2.1.3.tar.gz
```

Introductory video with detailed usage instructions:

https://healthgrades.zoom.us/rec/share/LXeKgcT-emiziIxviYS8VIfe3_9zFwCuCr3QKVio2lnB3XXHo-T70mLxgu61OLLC.m7jd6uI-VZksBU5P

**For local-pypi without docker**
```
pip install private-pypi==0.2.0
```

Clone project to your local directory - develop branch

```
cd/to/local-pypi/
local-pypi$ private_pypi server $PWD/packages --config=$PWD/config/config.toml
```


# grooming the repository

To remove a package named `<base-package-name>` from the repo:

1. ensure your git repo is checked out to a feature branch (not `develop` or a release branch)
2. ensure the `local-pypi` server is not running
3. delete the package and its metadata file:
   - `packages/cache/local-pypi/storage/<base-package-name>/<base-package-name>-X.X.X.tar.gz`
   - `packages/cache/local-pypi/storage/<base-package-name>/<base-package-name>-X.X.X.tar.gz.meta`
4. start the server.  The server reconciles the index.toml file with the storage directory tree on start-up
5. stop the server and commit the changes to your branch

You can delete multiple packages at once.


to edit the index manually, edit this file:
   - `packages/cache/local-pypi/storage/index.toml`

`index/local-pypi/index.toml` is over-written with the cache version at start-up.
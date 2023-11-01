# Developer guide

## Building the docs locally

Install Python 3.11.

Then run:

```sh
READTHEDOCS_VIRTUALENV_PATH=~/.virtualenvs/ena-read-docs
READTHEDOCS_OUTPUT=./_build
python -mvirtualenv $READTHEDOCS_VIRTUALENV_PATH
source "$READTHEDOCS_VIRTUALENV_PATH/bin/activate"
python -m pip install --upgrade pip setuptools
python -m pip install --upgrade sphinx readthedocs-sphinx-ext
python -m pip install --exists-action=w --no-cache-dir -r requirements.txt
python -m sphinx -T -E -b html -d $READTHEDOCS_OUTPUT/doctrees -D language=en . $READTHEDOCS_OUTPUT/html
```

These are the same commands that are run on ReadTheDocs.

You can adjust the variables `READTHEDOCS_VIRTUALENV_PATH` and `READTHEDOCS_OUTPUT` to your liking.

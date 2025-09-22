# Setup

The project uses the [Zephyr getting started Guide](https://docs.zephyrproject.org/latest/develop/getting_started/index.html)
with the zephyr install in `~/zephyrproject`. Where it differs is that the project is not in `~/zephyrproject/zephyr/app` but can be anywhere.

To do this the following sourceable sh scripts that allow zephyr to be used anywhere has to be added to `~/zephyrproject`:

**activate_zephyr.sh:**
``` sh
# this script when sourced ensures that the this zephyr build is used and this .venv is sourced
# this is a custom script of ease of use in other directories and does not come with zephyr

# the environment variable needed by cmake to find the zephyr library
export ZEPHYR_BASE="$HOME/zephyrproject/zephyr"

# add the (.venv) prefix before so it has a (zephyr) (.venv)
source "$HOME/zephyrproject/.venv/bin/activate"

# adds a zephyr prefix to the cmd to indicate it has been sourced
# (stores the old prompt and adds (zephyr) to the front
export _OLD_PS1="$PS1"
export PS1="(zephyr) $PS1"
```

**deactivate_zephyr.sh:**
``` sh
# this is a custom script of ease of use in other directories and does not come with zephyr

# Restore the old prompt if it was saved
if [ -n "$_OLD_PS1" ]; then
    export PS1="$_OLD_PS1"
    unset _OLD_PS1
fi

# Deactivate the Python virtual environment if it's active
if [ -n "$VIRTUAL_ENV" ]; then
    deactivate
fi

# Unset the Zephyr base environment variable
unset ZEPHYR_BASE
```
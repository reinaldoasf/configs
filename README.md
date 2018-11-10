# My vimfiles.

## To download:

`git clone https://github.com/dvcirilo/vimfiles.git ~/.vim`

## To install the bundled plugins ([source](https://stackoverflow.com/questions/10168449/git-update-submodules-recursively)
        )
```
git submodule update --init --recursive
git submodule foreach --recursive git fetch
git submodule foreach git merge origin master
```

# To source the vimrc:

`echo "source ~/.vim/vimrc" > ~/.vimrc`

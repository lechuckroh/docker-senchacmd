# sencha cmd

```bash
# run sencha
$ docker run --rm lechuckroh/senchacmd

# run 'sencha app build' on current directory
$ docker run \
    --rm \
    -v `pwd`:/usr/src/myapp \
    lechuckroh/senchacmd \
    sencha app build

# run bash with volume sharing
$ docker run \
    -it --rm \
    -v `pwd`:/usr/src/myapp \
    lechuckroh/senchacmd \
    bash
```

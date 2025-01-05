# build Docker image

```sh
./create.sh
```

# run bloom

Run the `bloom` image with `/bloom/package` mounted to the path of the package to be bloomed. The Debian packages will be placed in the parent folder. To choose a different folder, mount `/bloom` to the path where to place the bloom output.

```sh
docker run --interactive --tty --rm -v $PACKAGE:/bloom/package -v $OUTPUT:/bloom bloom
```

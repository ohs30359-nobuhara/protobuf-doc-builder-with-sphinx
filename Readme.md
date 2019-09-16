# protobud-doc-builder-with-sphinx

## usage

```
docker run  \
  -v $(pwd)/<protos path>:/go/protos  \
  -v $(pwd)/<dist path>:/go/dist -it   \
  <docker img tag> \
```


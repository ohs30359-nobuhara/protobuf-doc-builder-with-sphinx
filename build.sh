protoc \
  --plugin=protoc-gen-doc=./bin/protoc-gen-doc \
  --doc_out=./builder/ \
  --doc_opt=markdown,index.md \
  protos/*.proto

cd builder && make html && mv _build/html/* $GOPATH/dist
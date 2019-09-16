FROM alpine:3.10

# set up protobuf
RUN apk -U --no-cache add protobuf
RUN apk add --update --no-cache git make musl-dev go

# set up python & sphinx
RUN apk add --update python py-pip
RUN pip install sphinx_rtd_theme commonmark recommonmark sphinx-markdown-tables

# set up golang
ENV GOROOT /usr/lib/go
ENV GOPATH /go
ENV PATH /go/bin:$PATH

# set up proto doc gen
RUN go get -u github.com/pseudomuto/protoc-gen-doc/cmd/protoc-gen-doc

# create work dir & import files
RUN mkdir -p ${GOPATH}/src ${GOPATH}/bin
WORKDIR $GOPATH

# volume dir
RUN mkdir protos dist
VOLUME ["/html", "/protos"]

COPY builder $GOPATH/builder
COPY build.sh $GOPATH/

# run build doc
CMD ["sh", "build.sh"]

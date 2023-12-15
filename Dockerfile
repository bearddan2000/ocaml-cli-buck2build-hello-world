# custom docker image
# NOT in docker hub
FROM buck2build:base

ENV BUCK2_GIT https://github.com/facebook/buck2.git

WORKDIR /workspace

RUN apt update && apt install -y ocaml clang lld

WORKDIR /code

RUN git clone $BUCK2_GIT \
    && cp -R buck2/prelude . \
    && cp -R buck2/shim .

COPY bin .

CMD ["buck2", "run", "//:cli"]
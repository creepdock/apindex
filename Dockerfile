FROM debian:bullseye AS build

WORKDIR /app/
RUN apt update
RUN apt install cmake python3 git make gcc g++ -y
RUN git clone --depth=1 https://github.com/MichelBaie/apindex-v2.git .
RUN cmake . -DCMAKE_INSTALL_PREFIX=/usr
RUN make install
RUN rm -rf *
RUN mkdir /to-index/

VOLUME ["/to-index"]
CMD ["apindex","/to-index"]

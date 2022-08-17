FROM mysql:8.0
COPY ./mha4mysql-node-0.58.tar.gz /tmp
RUN build_deps='ssh perl libdbd-mysql-perl libmodule-install-perl make' \
    && apt-get update \
    && apt-get install -y $build_deps \
    && tar -zxf /tmp/mha4mysql-node-0.58.tar.gz -C /opt \
    && cd /opt/mha4mysql-node-0.58 \
    && perl Makefile.PL \
    && make \
    && make install \
    && cd /opt \
    && rm -rf mha4mysql-* \
    && apt-get clean
    
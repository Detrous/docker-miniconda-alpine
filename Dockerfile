FROM frolvlad/alpine-glibc:alpine-3.8

RUN mkdir -p "/opt/conda" && \
    apk add --no-cache --virtual .build wget ca-certificates bash && \
    wget "http://repo.continuum.io/miniconda/Miniconda3-4.5.11-Linux-x86_64.sh" -O miniconda.sh && \
    echo "e1045ee415162f944b6aebfe560b8fee  miniconda.sh" | md5sum -c && \
    bash miniconda.sh -f -b -p "/opt/conda" && \
    rm miniconda.sh && \
    export PATH="/opt/conda/bin:$PATH" && \
    echo "export PATH=$PATH" > /etc/profile.d/conda.sh && \
    conda update --all --yes && \
    conda config --set auto_update_conda False && \
    rm -r "/opt/conda/pkgs/" && \
    apk del --purge .build && \
    mkdir -p "/opt/conda/locks" && \
    chmod 777 "/opt/conda/locks" && \
    conda clean -i -l -t -y && \
    rm -rf /usr/local/src/* && \
    rm -rf /var/cache/apk/*

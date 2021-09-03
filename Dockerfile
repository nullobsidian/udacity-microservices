FROM python:3.7.3-stretch

ENV HADOLINT_VERSION=2.7.0
ENV PYLINT_VERSION=2.10.2

ENV VIRTUAL_ENV=/opt/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

WORKDIR /app
RUN python -m venv $VIRTUAL_ENV

COPY . app.py /app/
RUN set -o &&\
	make install &&\
	curl -LO https://github.com/hadolint/hadolint/releases/download/v"${HADOLINT_VERSION}"/hadolint-Linux-x86_64 &&\
	mv hadolint-Linux-x86_64 /usr/local/bin/hadolint &&\
	chmod +x /usr/local/bin/hadolint &&\
	pip install --no-cache-dir pylint=="${PYLINT_VERSION}"

EXPOSE 80

CMD ["python", "app.py"]
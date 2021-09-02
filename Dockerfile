FROM python:3.7.3-stretch

ENV VIRTUAL_ENV=/opt/venv
ENV HADOLINT_VERSION=2.7.0
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

WORKDIR /app
RUN python -m venv $VIRTUAL_ENV

COPY . app.py /app/
RUN make install &&\
	wget -q https://github.com/hadolint/hadolint/releases/download/v${HADOLINT_VERSION}/hadolint-Linux-x86_64 -P /usr/local/bin/ &&\
	mv /usr/local/bin/hadolint-Linux-x86_64 /usr/local/bin/hadolint &&\
	chmod +x /usr/local/bin/hadolint &&\
	pip --no-cache-dir install pylint

EXPOSE 80

CMD ["python", "app.py"]
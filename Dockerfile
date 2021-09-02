FROM python:3.7.3-stretch

ENV VIRTUAL_ENV=/opt/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

WORKDIR /app
RUN python -m venv $VIRTUAL_ENV

COPY . app.py /app/
RUN make install &&\
	curl -LO https://github.com/hadolint/hadolint/releases/download/$(curl -s https://api.github.com/repos/hadolint/hadolint/releases/latest | grep tag_name | cut -d '"' -f 4)/hadolint-Linux-x86_64 &&\
	mv hadolint-Linux-x86_64 /usr/local/bin/hadolint &&\
	chmod +x /usr/local/bin/hadolint &&\
	pip --no-cache-dir install pylint

EXPOSE 80

CMD ["python", "app.py"]
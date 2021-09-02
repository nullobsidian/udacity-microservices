FROM python:3.7.3-stretch

ENV HADOLINT_VERSION=2.7.0

## Step 1:
# Create a working directory
WORKDIR /app

## Step 2:
# Copy source code to working directory
COPY . app.py /app/

## Step 3:
# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN make install &&\
		wget -q https://github.com/hadolint/hadolint/releases/download/v${HADOLINT_VERSION}/hadolint-Linux-x86_64 -P /usr/local/bin/ &&\
		chmod +x /usr/local/bin/hadolint &&\
		pip --no-cache-dir install pylint

## Step 4:
# Expose port 80
EXPOSE 80

## Step 5:
# Run app.py at container launch
CMD ["python", "app.py"]
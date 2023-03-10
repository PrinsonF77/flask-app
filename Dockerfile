FROM python
RUN groupadd --gid 1000 api
RUN useradd --uid 1000 --gid api --shell /bin/bash --create-home api
USER api
RUN mkdir /home/api/app
WORKDIR /home/api/app
COPY ./requirements.txt ./
RUN pip install --upgrade pip setuptools wheel
RUN pip install -r requirements.txt
COPY ./ ./
EXPOSE 5000
CMD python3 -m flask run -h 0.0.0.0
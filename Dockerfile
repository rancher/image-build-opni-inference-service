FROM rancher/opni-python-base:3.8-torch

RUN zypper -n ref  && \
    zypper --non-interactive in wget && \
    zypper --non-interactive in zip

COPY ./requirements.txt /app/requirements.txt
 RUN pip install --no-cache-dir -r /app/requirements.txt

COPY ./opniInferenceService/ /app/opniInferenceService/

RUN chmod a+rwx -R /app
WORKDIR /app

CMD [ "python", "./opniInferenceService/start_opnilog_inference.py" ]

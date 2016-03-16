FROM ubuntu:14.04 
MAINTAINER Jack Kwong

RUN apt-get update
RUN apt-get install -y curl git vim
RUN curl http://repo.continuum.io/archive/Anaconda2-2.5.0-Linux-x86_64.sh -o Anaconda2-2.5.0-Linux-x86_64.sh
RUN chmod +x Anaconda2-2.5.0-Linux-x86_64.sh
RUN printf "\nyes\n" | ./Anaconda2-2.5.0-Linux-x86_64.sh
ENV PATH /root/anaconda2/bin:$PATH
ADD .bash_profile ~/.bash_profile
RUN conda install -y python=3.4
RUN conda create -y -n py34 python=3.4
RUN /bin/bash -c 'source activate py34'
RUN conda install -y notebook ipykernel
RUN ipython kernel install

# Add a notebook profile.
RUN mkdir -p -m 700 /root/.jupyter/ && \
    echo "c.NotebookApp.ip = '*'" >> /root/.jupyter/jupyter_notebook_config.py

RUN mkdir /root/notebooks
CMD jupyter notebook -y --no-browser --notebook-dir="/root/notebooks" --port=8888

EXPOSE 8888

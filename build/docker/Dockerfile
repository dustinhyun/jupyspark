#
# Author: dongseok.hyun@gmail.com
#
# JuPySpark Dockerfile installs Jupyterlab and PySpark in the container.
#

FROM centos:7

RUN yum install -y bzip2 git && yum clean all

# For convenience
#RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
#RUN python get-pip.py

# Install hadoop
RUN yum install -y java-1.8.0-openjdk-devel
RUN export JAVA_HOME=/usr/liv/jvm/java-1.8.0-openjdk-1.8.0.201.b09-2.el7_6.x86_64
# Change if needed. Refer to https://spark.apache.org/downloads.html
RUN curl -O http://apache.mirror.cdnetworks.com/spark/spark-2.4.1/spark-2.4.1-bin-hadoop2.7.tgz \
    && tar xzf spark-2.4.1-bin-hadoop2.7.tgz \
    && mv spark-2.4.1-bin-hadoop2.7 /opt/ \
    && ln -s /opt/spark-2.4.1-bin-hadoop2.7 /opt/spark \
    && echo "export SPARK_HOME=/opt/spark" >> ~/.bashrc \
    && echo "export PATH=$SPARK_HOME/bin:$PATH" >> ~/.bashrc

# Install conda
RUN echo "source /opt/anaconda3/etc/profile.d/conda.sh" >> ~/.bashrc
RUN echo "export PATH=/opt/anaconda3/bin:$PATH" >> ~/.bashrc
RUN curl -O https://repo.continuum.io/miniconda/Miniconda2-4.5.12-Linux-x86_64.sh && \
    chmod +x Miniconda2-4.5.12-Linux-x86_64.sh && \
    ./Miniconda2-4.5.12-Linux-x86_64.sh -b -p /opt/anaconda3 && \
    rm ./Miniconda2-4.5.12-Linux-x86_64.sh
RUN /bin/bash --login -c 'conda update -n base -c defaults conda'

# Install PySpark, Jupyterlab, Python hdfs
RUN /bin/bash --login -c 'conda create -n python35 python=3.5'
RUN /bin/bash --login -c 'conda activate python35 \
    && conda install -y -c conda-forge py4j jupyterlab \
    && conda clean -tipy'

#RUN mkdir /lab
#COPY files/MyLab.ipynb /lab/

COPY entrypoint.sh /root/
RUN chmod 755 /root/entrypoint.sh
ENTRYPOINT ["/root/entrypoint.sh"]

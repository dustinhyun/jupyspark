#!/bin/bash
#
# Author: dongseok.hyun@gmail.com
#
# JuPySpark entrypoint.sh runs PySpark and Jupyterlab.
#

set -e
. ~/.bashrc

if [ -z $SPARK_SLAVE_PORT ]; then SPARK_SLAVE_PORT=7077; fi
if [ -z $JUPYTER_LAB_PORT ]; then JUPYTER_LAB_PORT=8888; fi

echo "Starting Spark master..."
/opt/spark/sbin/start-master.sh

echo "Starting Spark slave on port ${SPARK_SLAVE_PORT}..."
/opt/spark/sbin/start-slave.sh spark://0.0.0.0:${SPARK_SLAVE_PORT}

echo "Starting Jupyter Lab on port ${JUPYTER_LAB_PORT}..."
conda activate python35
jupyter lab --no-browser --ip=0.0.0.0 --port=${JUPYTER_LAB_PORT} --allow-root --NotebookApp.token='' --notebook-dir='/root/workspace'

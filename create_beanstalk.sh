#!/bin/bash

# Deploying a Flask Application to AWS Elastic Beanstalk
#     https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/create-deploy-python-flask.html

# Required Python Packages to begin ---------------
echo "--------------------------------------------"
echo "installing required python packages..."
echo "--------------------------------------------"
pip install virtualenv &>install.log
echo "please visit:"
echo "https://console.aws.amazon.com/iam/home?#/security_credential" 
echo "and generate Access Keys (access key ID and secret access key)"


# Generate the directory and vairtual environment
echo "---------------------------------------------"
echo "generating deployment directory 'eb-flask'..."
echo "---------------------------------------------"
rm -r eb-flask &>install.log
mkdir eb-flask
cp application.py eb-flask/application.py
cd eb-flask


# Create the virtual environment and install packages
echo "----------------------------------------------"
echo "creating the virtual enviroment: eb-flask/virt"
echo "----------------------------------------------"
virtualenv virt               
source virt/bin/activate 
pip install awsebcli          &>install.log
pip install flask==1.0.2      &>install.log
pip freeze > requirements.txt &>install.log


# Launch instance -----------------------------------
echo "----------------------------------------------"
echo "launching AWS instance (this may take a while)"
echo "visit: https://us-east-2.console.aws.amazon.com/elasticbeanstalk"
eb init -p python-3.6 flask-tutorial --region us-east-2 &>install.log
eb create flask-env                                     &>install.log
eb open 
echo "...Elastic beanstalk launched!"


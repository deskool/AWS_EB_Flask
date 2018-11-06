# Terminate Instance --------------------------------
echo "----------------------------------------------"
echo "Terminating Instance (this may take a while)" 
eb terminate flask-env &> terminate.log
echo "...Termination complete!"


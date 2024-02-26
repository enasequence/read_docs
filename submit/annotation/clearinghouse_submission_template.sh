#!/usr/bin/env bash
# basic template bash script to run submit the clearinghouse submissions. This ought to run in most linux and unix(inc. MacOS) environments.
# This is just an example, you may well have better ways to do this. This template may help you implement your own in bash or indeed python, R or rust et cetera.
# N.B. please always refer to the API documentation, as that will be the most up to date.
# ENA, EMBL-EBI, January 2024
#
echo " template script to run submit the clearinghouse submissions"
echo "  run: script_name.py dir_path_to_submission_jsons"
# echo "  suggestion, before the run: script submission_typescript.log as this will record the output"
# echo "  please check the output for an errors, e.g. JSON to fix or resubmit"
echo ""

##################################################################################################
##### Configurable portion
# This where one can set environmental variables and credentials up, that are used subsequently.

# Taking the first argument to the script from the command line. It is the directory containing the JSON annotation files to be submitted.
submission_dir=$1

#need a plain file to write and read the bearer key from, see later in this script. It will be automatically created with the name below
export bearer_file="bearer_file"

# this is my local bash (chmod 007 ~/.my_secrets), please contact your IT admin to see whether this is permissible or if they have a better solution
my_protected_secret_file="~/.my_secrets"
if ! [ -f ${my_protected_secret_file} ] ; then
    echo "${my_protected_secret_file}<--does not exist, so exiting"
    exit
fi

source ${my_protected_secret_file}
#these below are the relevant contents of the configuration file, please uncomment and add your credentials
#export my_email_address='my_email_name@redbrick.ac.uk'
#export aai_test_user='my_test_username'
#export aai_test_pass='my_test_password'
#export aai_test_creds="${aai_test_user}:${aai_test_pass}"
#
#export aai_prod_user='my_prod_username'
#export aai_prod_pass='my_prod_password'
#export aai_prod_creds="${aai_prod_user}:${aai_prod_pass}"

# set up the applicable server URL for the the test or production environment.
# it is by default set up to submit to the test=developmental server.
TEST=1
if [ $TEST -eq 1 ]; then
  echo "using test credentials and setup"
  url="https://wwwdev.ebi.ac.uk/ena/clearinghouse/api/curations"
  auth_url='https://explore.api.aai.ebi.ac.uk/auth'
  creds=$aai_test_creds
else
  #PROD
  echo "using production credentials and setup"
  url="https://www.ebi.ac.uk/ena/clearinghouse/api/curations"
  auth_url='https://api.aai.ebi.ac.uk/auth'
  creds=$aai_prod_creds
fi

################################################################
# Declaring Functions, that are called later in this bash script

function re_run_bearer_file () {
  auth_url=$1
  credentials=$2
  echo "curl $auth_url" -u "$credentials"
  echo $bearer_file
  curl "$auth_url" -u "$credentials" 1> $bearer_file 2>/dev/null
  bearerkey=`cat $bearer_file`
  len=${#bearerkey}
  if [ $len -lt 100 ]; then
    echo "Invalid bearer key, so exiting script, try later."
    exit
  fi
  }

function submit_2_clearinghouse () {
  export curation_json_file=$1
  echo $curation_json_file
  export bearerkey=`cat $bearer_file`
  export bearer="Authorization: Bearer $bearerkey"
  #echo $bearer
  # -T is needed for big files -d @ is slightly faster and puts it into memory
  cmd=`curl -X POST \"${url}\" -H \"accept: */*\"  -H \"Content-Type: application/json\"   -H \"${bearer}\"  -d @${curation_json_file}`
  #could not get to both see the command and execute it, so doing the dirty way via a new file
  echo $cmd
  echo $cmd > run_me.sh
  time sh ./run_me.sh
  echo " "
}

#########################################################################
# configuration continued, this using the configurations and a function from above to
# 1) ensure that you have a submission directory
# 2) use the user name, password and applicable URL to create the bearer key.
#    the bearer key identifies you to the applicable ClearingHouse server, so that you can submit the annotations.

if [ ! -d $submission_dir ]; then
    echo "${submission_dir}<--is not a valid directory, so exiting"
    exit
fi
echo "submission_dir: -->"${submission_dir}

# echo $creds
# if one needs, renew the bearer ( the below is for the test):
#curl 'https://explore.api.aai.ebi.ac.uk/auth'  -u $aai_test2_creds 1> bearer_file 2>/dev/null
#re-running the bearer key frequently as it times out within an hour...

re_run_bearer_file $auth_url $creds
export bearerkey=`cat $bearer_file`
export bearer="Authorization: Bearer $bearerkey"

##################################################################################################
# now processing every json file in your submission directory
for file in $submission_dir/*.json
do
    echo $file
    echo $bearer
    submit_2_clearinghouse $file
    sleep 0.1 # wait 0.1 seconds
    re_run_bearer_file $auth_url $creds
done
message_contents="Attempted to process all files in ${submission_dir} . Please do check the logfiles for any errors."
echo ${message_contents} | mail -s "ClearingHouse submission finished" ${my_email_address}
echo "end of script: ${0}"
################################################################################################







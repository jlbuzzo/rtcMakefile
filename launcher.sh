#!/bin/bash

############################## HEADER #########################################

# A simple script to repeatedly launch instances of Makefiles.



############################## PREAMBLE #######################################

# Arguments validation.
if (( ${#@} < 2 )); then
  	echo -e "Error in $0: Input arguments missing!" >&2
	exit 1;
fi

# Verify output directory.
if [ -d ${!#%/*} ]; then
	OUTPUT_DIR=${!#}
else
  	echo -e "Error in $0: Invalid OUTPUT_DIR path!" >&2
	exit 1;
fi

# Number of parallel jobs.
JOBS=4

# Process counter
count=0

# Some variables.
CMD=make
SUB_CMD1=processSample
SUB_CMD2=mergeCall
OTHERS="SORTED=TRUE"


# Try to read froma file descriptor.
#echo <<< &0



############################## MAIN CODE ######################################

# Iterare throught the inputs.
while [[ $# -gt 1 ]]; do
	
	# Sarch for the given argument as a file or directory name.
	if [[ -r $1 ]]; then
		# Part 1: Parallel part.
		if [[ -d $1 ]]; then
			# If '$1' is a directory, search for text files in it.
			echo
		else
			# If '$1' is a ordinary file, iterate over it's lines.
			while read; do
				# Verify file existence.
				if [[ -s $REPLY ]]; then
					# Mount The whole command.
					COMPOUND="$CMD $SUB_CMD1 INPUT_FILE=$REPLY OUTPUT_DIR=$OUTPUT_DIR $OTHERS"
					
					# Execute the command properly.
					echo "$COMPOUND &"
					eval "$COMPOUND &"
					
					# increment process counter.
					((count++))
				else
					echo -e "Warning in $0: File '$REPLY' is missing or empty!" >&2
					continue
				fi
				
				# Limit the number of jobs.
				if (( (count % JOBS) == 0 )); then
					wait
				fi
			done < $1
		fi
	else
		echo -e "Warning in $0: No such file or directory: '$1'!" >&2
	fi
	
	# Move parameters.
	shift
done


# Wait for unfinished jobs.
wait

# Part 2: Serial part
make mergeCall OUTPUT_DIR=$OUTPUT_DIR -j $JOBS

# Counter.
../../miscellaneous/counter.sh $OUTPUT_DIR

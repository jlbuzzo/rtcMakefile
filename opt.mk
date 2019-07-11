PIPELINE_NAME			:= RETRONATOR

BASE_DIR				:= $(PWD)
GENOMES_DIR				:= /home/genomes/Homo_sapiens/hg38
ANNOTATION_DIR			:= $(BASE_DIR)/library/annotation
REF_ANNOTATION			:= $(ANNOTATION_DIR)/gencode.v29.annotation.gtf
REP_ANNOTATION			:= $(ANNOTATION_DIR)/rep.hg38.converted.bed
REP_ANNOTATION_manual	:= $(ANNOTATION_DIR)/rep.hg38.converted.manual.bed
REFERENCE_GENOME_FASTA	:= $(GENOMES_DIR)/hg38.fa


DISTANCE				:= 750000
MIN_DIST				:= 1000000

OUTPUT_DIR				:= /home/scratch30/lbuzzo_9_jun/fer
TEMP_PROCESS_DIR		:= $(OUTPUT_DIR)/temp/
DUMP_DIR				:= $(OUTPUT_DIR)/result/dump/

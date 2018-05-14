PIPELINE_NAME := RETRONATOR

BASE_DIR := /home/users/jlbuzzo/projects_old/RTC/ancillaries
ANNOTATION_DIR := $(BASE_DIR)/annotation
GENOMES_DIR := $(BASE_DIR)/genomes

REF_ANNOTATION := $(ANNOTATION_DIR)/gencode.v26.annotation.gtf
REP_ANNOTATION := $(ANNOTATION_DIR)/rep.hg38.converted.bed
REFERENCE_GENOME_FASTA := $(GENOMES_DIR)/hg38/hg38.fa


DISTANCE :=750000
MIN_DIST := 1000000

TEMP_PROCESS_DIR := $(OUTPUT_DIR)/temp/
DUMP_DIR := $(OUTPUT_DIR)/result/dump/

PIPELINE_NAME := RETRONATOR

BASE_DIR := /home/scratch60/lbuzzo_nov/RTC/data
ANNOTATION_DIR := $(BASE_DIR)/annotation
GENOMES_DIR := $(BASE_DIR)/reference

REF_ANNOTATION := $(ANNOTATION_DIR)/gencode.v26.annotation.gtf
REP_ANNOTATION := $(ANNOTATION_DIR)/rep.hg38.converted.bed
REP_ANNOTATION_manual := $(ANNOTATION_DIR)/rep.hg38.converted.manual.bed
REFERENCE_GENOME_FASTA := $(GENOMES_DIR)/hg38.fa


DISTANCE :=750000
MIN_DIST := 1000000

TEMP_PROCESS_DIR := $(OUTPUT_DIR)/temp/
DUMP_DIR := $(OUTPUT_DIR)/result/dump/

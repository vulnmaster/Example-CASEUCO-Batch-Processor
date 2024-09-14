#!/usr/bin/make -f

# Portions of this file contributed by NIST are governed by the
# following statement:
#
# This software was developed at the National Institute of Standards
# and Technology by employees of the Federal Government in the course
# of their official duties. Pursuant to Title 17 Section 105 of the
# United States Code, this software is not subject to copyright
# protection within the United States. NIST assumes no responsibility
# whatsoever for its use by other parties, and makes no guarantees,
# expressed or implied, about its quality, reliability, or any other
# characteristic.
#
# We would appreciate acknowledgement if the software is used.

SHELL := /bin/bash

all: \
  all-framing

all-framing: \
  .venv.done.log
	$(MAKE) \
	  --directory framing

.venv.done.log: \
  requirements.txt \
  requirements-framing.txt
	rm -rf venv
	python3 -m venv venv
	source venv/bin/activate && pip install --upgrade pip
	source venv/bin/activate && pip install --requirement requirements.txt
	source venv/bin/activate && pip install --requirement requirements-framing.txt
	touch $@

check: \
  all

clean:
	@$(MAKE) \
	  --directory framing \
	  clean

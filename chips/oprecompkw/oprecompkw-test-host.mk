#
# Copyright (C) 2019 TU Kaiserslautern
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#
# Author: Éder F. Zulian, TUK (zulian@eit.uni-kl.de)
#

TOPDIR := $(dir $(lastword $(MAKEFILE_LIST)))

CFLAGS += -O3 -g -Wall -Wextra
CFLAGS += -I$(PULP_SDK_HOME)/install/ws/include
CFLAGS += -I$(TOPDIR)common
LDFLAGS = -L$(PULP_SDK_HOME)/install/ws/lib
LDFLAGS += -loprecomp -lcxl -lpulpvplauncher
LDFLAGS += -lpthread

target = test
builddir = build

$(target): $(builddir) $(target).c
	$(CC) $(CFLAGS) -o $(builddir)/$@ $@.c $(LDFLAGS)

$(builddir):
	mkdir -p $(builddir)

all: $(target)

.PHONY: clean

clean:
	rm -rf $(builddir)

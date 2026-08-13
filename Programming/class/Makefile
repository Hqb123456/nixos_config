CXX = g++
CXXFLAGS = -std=c++11 -O2 -Wall
SRC_DIR = .
OUT_DIR = build

CPP_FILES = $(shell find $(SRC_DIR) -maxdepth 1 -type f -name '*.cpp' ! -name '.*' ! -name '*:*.cpp' ! -name '#*' ! -name '*~')

TARGETS = $(patsubst $(SRC_DIR)/%.cpp,$(OUT_DIR)/%, $(CPP_FILES))

.PHONY: all clean sanitize

.SECONDEXPANSION:

sanitize:
	@renamed=0; \
	for f in *.cpp; do \
		if [[ "$$f" == *" "* ]]; then \
			newname=$$(echo "$$f" | tr ' ' '_'); \
			echo "重命名: $$f -> $$newname"; \
			mv "$$f" "$$newname"; \
			renamed=1; \
		fi; \
	done; \
	if [ $$renamed -eq 1 ]; then \
		exec $(MAKE) all; \
	fi

all: sanitize $$(TARGETS)
	@cpp_files=$$(find . -maxdepth 1 -name '*.cpp' ! -name '.*' ! -name '*:*.cpp' ! -name '#*' ! -name '*~'); \
	targets=$$(for c in $$cpp_files; do echo "$(OUT_DIR)/$${c#./}"; done | sed 's/\.cpp$$//' | tr '\n' ' '); \
	for f in build/*; do \
		[ -e "$$f" ] || continue; \
		case " $$targets " in *" $$f "*) ;; *) echo "删除已废止的输出文件: $$f"; rm -f "$$f";; esac; \
	done

$(OUT_DIR)/%: $(SRC_DIR)/%.cpp
	@mkdir -p $(dir $@)
	$(CXX) $(CXXFLAGS) $< -o $@

clean:
	rm -rf $(OUT_DIR)
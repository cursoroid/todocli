# Variables
CC = gcc
CFLAGS = -Wall -Wextra -std=c11
SRC_DIR = src
BUILD_DIR = build
TARGET = $(BUILD_DIR)/main

# Source files
SRCS = $(SRC_DIR)/main.c
OBJS = $(SRCS:$(SRC_DIR)/%.c=$(BUILD_DIR)/%.o)

# Default target
all: build

# Build target
build: $(TARGET)

$(TARGET): $(OBJS)
	@mkdir -p $(BUILD_DIR)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJS)
	@echo "Build completed."

# Development target
dev: CFLAGS += -g
dev: build

# Clean target
clean:
	@rm -rf $(BUILD_DIR)
	@echo "Clean completed."

# Compile source files into object files
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(BUILD_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Phony targets
.PHONY: all build dev clean


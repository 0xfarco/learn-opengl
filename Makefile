XX = g++
CXXFLAGS = -Wall -Wextra -O2 -I./includes
LIBS = -lglfw -lGL -lX11 -lpthread -lXrandr -lXi -ldl
BUILDDIR = build

SRC = src/main.cpp src/glad.c
OBJ = $(patsubst src/%.cpp,$(BUILDDIR)/%.o,$(patsubst src/%.c,$(BUILDDIR)/%.o,$(SRC)))
TARGET = app

all: $(TARGET)

$(TARGET): $(OBJ)
	$(CXX) $(OBJ) -o $(TARGET) $(LIBS)

$(BUILDDIR):
	mkdir -p $(BUILDDIR)

$(BUILDDIR)/%.o: src/%.cpp $(BUILDDIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(BUILDDIR)/%.o: src/%.c $(BUILDDIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -rf $(BUILDDIR) $(TARGET)

.PHONY: all clean


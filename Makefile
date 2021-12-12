#CXX = g++
CXX = aarch64-linux-gnu-g++

SRC = $(shell find src -name *.cpp)

TAR = liveRtspServer

CXX_FLAGS = -g -Wall
CXX_FLAGS += -I./include/liveMedia/ -I./include/BasicUsageEnvironment \
                -I./include/groupsock -I./include/UsageEnvironment

CXX_FLAGS += -I./include/x264 -I./include/alsa -I./include/faac

# LD_FLAGS = -lliveMedia -lBasicUsageEnvironment -lgroupsock -lUsageEnvironment -lpthread -lx264 -lasound -lfaac
LD_FLAGS = -lliveMedia -lBasicUsageEnvironment -lgroupsock -lUsageEnvironment -lpthread -lx264 -lasound -lfaac -ldl
LIBS_PATH = -L./libs

all:
	$(CXX) -o $(TAR) $(SRC) $(CXX_FLAGS) $(LD_FLAGS) $(LIBS_PATH)

.PHONY:
	clean

clean:
	rm $(TAR) -rf

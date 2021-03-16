TARGET = test
OBJ_PATH = objs
PREFIX_BIN =

# 库文件
#PROTOBUF_DIR = ./protobuf
#PROTOBUF_TARGET = /src/.libs/libprotobuf.a
#PROTOBUF_LIB = $(PROTOBUF_DIR)/$(PROTOBUF_TARGET)

CC = gcc
CPP = g++ -std=c++11
INCLUDES += -I./ 
LIBS = 

G = -g
CFLAGS :=-Wall  -Wno-unknown-pragmas $(G) 
LINKFLAGS = -ldl -lpthread

SRCDIR = ./ ./main ./Singleton 

C_SRCDIR = $(SRCDIR)
C_SOURCES = $(foreach d,$(C_SRCDIR),$(wildcard $(d)/*.c) )
C_OBJS = $(patsubst %.c, $(OBJ_PATH)/%.o, $(C_SOURCES))
C_DEPEND = $(patsubst %.c, $(OBJ_PATH)/%.d, $(C_SOURCES))


CC_SRCDIR = $(SRCDIR)
CC_SOURCES = $(foreach d,$(CC_SRCDIR),$(wildcard $(d)/*.cc) )
CC_OBJS = $(patsubst %.cc, $(OBJ_PATH)/%.o, $(CC_SOURCES))
CC_DEPEND = $(patsubst %.cc, $(OBJ_PATH)/%.d, $(CC_SOURCES))


CPP_SRCDIR = $(SRCDIR)
CPP_SOURCES = $(foreach d,$(CPP_SRCDIR),$(wildcard $(d)/*.cpp) )
CPP_OBJS = $(patsubst %.cpp, $(OBJ_PATH)/%.o, $(CPP_SOURCES))
CPP_DEPEND = $(patsubst %.cpp, $(OBJ_PATH)/%.d, $(CPP_SOURCES))

default:init compile

init:
	$(foreach d,$(SRCDIR), mkdir -p $(OBJ_PATH)/$(d);)

compile:$(C_OBJS) $(CC_OBJS) $(CPP_OBJS)
	$(CPP)  $^ -o $(TARGET)  $(LINKFLAGS) $(LIBS)

$(C_OBJS):$(OBJ_PATH)/%.o:%.c
	$(CC) -c $(CFLAGS) $(INCLUDES) $< -o $@

$(CC_OBJS):$(OBJ_PATH)/%.o:%.cc
	$(CPP) -c $(CFLAGS) $(INCLUDES) $< -o $@

$(CPP_OBJS):$(OBJ_PATH)/%.o:%.cpp
	$(CPP) -c $(CFLAGS) $(INCLUDES) $< -o $@


clean:
	rm -rf $(OBJ_PATH)
	rm -rf $(TARGET)
cleand:
	find ./objs -name *.d | xargs rm -rf


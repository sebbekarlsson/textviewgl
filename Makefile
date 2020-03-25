exec = a.out
sources = $(wildcard src/*.c)
sources += $(wildcard GL/src/*.c)
objects = $(sources:.c=.o)
flags = -Wall -g -IGL/include -lglfw -ldl -lcglm -lm -lGLEW -lGL -I/usr/local/include/freetype2 -I/usr/include/freetype2 -lfreetype


$(exec): $(objects)
	gcc $(objects) $(flags) -o $(exec)

%.o: %.c ../include/glad/%.h
	gcc -c $(flags) $< -o $@

%.o: %.c ../include/%.h
	gcc -c $(flags) $< -o $@

%.o: %.c include/%.h
	gcc -c $(flags) $< -o $@

clean:
	-rm *.out
	-rm *.o
	-rm src/*.o

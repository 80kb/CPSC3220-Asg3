CC = gcc
CFLAGS = -Wall -Wextra -g

driver: src/grtfs.c src/grtfs_driver.c
	$(CC) $(CFLAGS) $^ -o out/$@

run:
	./out/driver > ./out/out.txt

tar:
	cp ./src/grtfs.c ./grtfs.c
	cp ./src/grtfs.h ./grtfs.h
	cp ./src/grtfs_driver.c ./grtfs_driver.c
	tar -cvzf asg3.tar.gz ./grtfs.c ./grtfs.h ./grtfs_driver.c ./makefile
	rm -f grtfs.c grtfs.h grtfs_driver.c

clean:
	rm -f out/*

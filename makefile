CC = gcc
CFLAGS = -Wall -Wextra -g

driver1: src/grtfs.c src/grtfs_driver1.c
	$(CC) $(CFLAGS) $^ -o out/$@

run1:
	./out/driver1 > ./out.txt

clean:
	rm -f out/*

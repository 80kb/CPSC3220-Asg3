CC = gcc
CFLAGS = -Wall -Wextra -g

driver1: src/grtfs_1.c src/grtfs_2.c src/grtfs_driver1.c
	$(CC) $(CFLAGS) $^ -o out/$@

clean:
	rm -f out/*.*

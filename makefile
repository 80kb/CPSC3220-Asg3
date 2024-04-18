CC = gcc
CFLAGS = -Wall -Wextra -g

driver: src/grtfs.c src/grtfs_driver.c
	$(CC) $(CFLAGS) $^ -o out/$@

run:
	./out/driver > ./out/out.txt

clean:
	rm -f out/*

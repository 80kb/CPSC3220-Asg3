# Simple FAT File System
File system consists of three sections: directory entries, file allocation table, and file blocks in that order. Each section is organized as follows.

---
### Directory Entry (16B)

| Offset | Type     | Info                                     | Variable    |
| ------ | -------- | ---------------------------------------- | ----------- |
| 0x00   | byte     | File status*                             | status      |
| 0x01   | byte     | First index in the file allocation table | first_block |
| 0x02   | uint16   | Size of the file                         | size        |
| 0x03   | uint16   | Stream position for read/write           | byte_offset |
| 0x04   | char[12] | File name (null-terminated)              | name        |

\* 0x00 = UNUSED, 0x01 = CLOSED, 0x02 = OPEN

---
### File Allocation Table (FAT) Entry (256B)
The index of each entry in the FAT corresponds to a respective block at the same position in the block section. The number of entries in the FAT is equal to the number of blocks.

| Offset | Type | Info                          |
| ------ | ---- | ----------------------------- |
| 0x00   | byte | Index of next block/FAT entry |

---
### File Blocks (256B)
Blocks contain raw file bytes, each block is 128 bytes. Size of this section (in bytes) is $\verb|N_BYTES| = \verb|N_FAT_ENTRIES| \times 128$

| Offset | Type          | Info                                |
| ------ | ------------- | ----------------------------------- |
| 0x00   | byte[N_BYTES] | Raw file data assorted based on FAT |

\* Special case byte values: 0x00 = FREE, 0x01 = LAST_BLOCK

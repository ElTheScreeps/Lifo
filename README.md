#LIFO (Last IN First OUT)

![LIFO Diragram](https://github.com/ElTheScreeps/LIFO/assets/115155585/221e784b-7707-424b-b651-5144f3ed1dfe)

The memory interface of the FIFO is presented in the following tables.

| Parameter name | Default value | Value Range | Description                                                                     |
|      :---:     |     :---:     |    :---:    |    :---:                                                                        |
| DATA_WIDTH     | 8             |≥ 1          | Size of the data                                                                |
| ADDR_WIDTH     | 8             |> 1          | Size of the internal address. Determines the FIFO depth (2<sup>ADDR WIDTH</sup>)|

| Port Name   | Direction   | Size       | Description                                                            |
|    :---:    |    :---:    |   :---:    |   :---:                                                                |
| clk         | IN          | 1          | Clock signal                                                           |
| rst_n       | IN          | 1          | Asynchronous reset signal, active low                                  |
| write_en    | IN          | 1          | Write command for data, valid only if the memory is not full (full=0)  |
| data_in     | IN          | DATA_WIDTH | Written data                                                           |
| read_en     | IN          | 1          | Read command for data, valid only if the memory is not empty (empty=0) |
| data_out    | OUT         | DATA_WIDTH | Read data (first written)                                              |
| empty       | OUT         | 1          | FIFO memory empty indicator. No reads (read_en) are allowed            |
| full        | OUT         | 1          | FIFO memory full indicator. No writes (write_en) are allowed           |


How to use this files:

1. Download the files;
2. Put them in a directory;
3. Open Modelsim;
4. Change directory to the directory who contain the files;
5. Create a project and add the files;
6. Compile the files and start stimulate.

#include <stddef.h>
#include <stdint.h>
#include "FastPowTable.h"
#include "FastLogTable.h"
#include "fastpow.h"
#include "fastlog.h"
#include "basicmaths.h"

void set_default_tables() {
    fast_pow_set_table(fast_pow_table, fast_pow_table_size);
    fast_log_set_table(fast_log_table, fast_log_table_size);
}
require('plenary.async')

local config = {
  control = {
    Condvar = {
      __index = '<table 1>',
      new = '<function 1>',
      notify_all = '<function 2>',
      notify_one = '<function 3>',
      wait = '<function 4>'
    },
    Semaphore = {
      __index = '<table 2>',
      acquire = '<function 5>',
      new = '<function 6>'
    },
    channel = {
      counter = '<function 7>',
      mpsc = '<function 8>',
      oneshot = '<function 9>'
    }
  },

  get_leaf_function_argc = '<function 10>',
  is_leaf_function = '<function 11>',
  run = '<function 12>',

  tests = {
    add_globals = '<function 13>',
    add_to_env = '<function 14>',
    after_each = '<function 15>',
    before_each = '<function 16>',
    describe = '<function 17>',
    it = '<function 18>'
  },

  util = {
    apcall = '<function 19>',
    block_on = '<function 20>',
    join = '<function 21>',
    protected = '<function 22>',
    run_all = '<function 23>',
    run_first = '<function 24>',
    scheduler = '<function 25>',
    sleep = '<function 26>',
    will_block = '<function 27>',
  },

  void = '<function 28>',
  wrap = '<function 29>',

  metatable = {
    __index = '<function 30>'
  }
}

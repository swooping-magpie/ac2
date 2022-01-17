#include "lib.hpp"

auto main() -> int
{
  library lib;

  return lib.name == "aho-corasick2" ? 0 : 1;
}

#include "lushka.h"

VALUE rb_mLushka;

void
Init_lushka(void)
{
  rb_mLushka = rb_define_module("Lushka");
}

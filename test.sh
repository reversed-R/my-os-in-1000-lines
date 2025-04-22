STACK_TOP_ADDR_ELF="$(llvm-nm kernel.elf | grep __stack_top | cut -d " " -f1)"
STACK_TOP_ADDR_MAP="$(cat kernel.map | grep __stack_top | cut -d " " -f1)"

echo $STACK_TOP_ADDR_ELF
echo $STACK_TOP_ADDR_MAP

if [[ $STACK_TOP_ADDR_ELF == $STACK_TOP_ADDR_MAP ]]; then
  echo "[SUCCESS]: stack top address is $STACK_TOP_ADDR_MAP"
else
  echo "[FAILED]: stack top address"
fi

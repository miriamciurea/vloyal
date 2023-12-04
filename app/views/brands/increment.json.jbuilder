json.message(@reward ? "  Congratulations you got all the stamps
  for a free #{@card.brand.reward_type.name},
  check your rewards to claim it." :
  "  A stamp has been added to your #{@card.brand.name}
  loyalty card.")

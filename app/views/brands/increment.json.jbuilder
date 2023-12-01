json.message(@reward.claimed ? "  Congratulations you got all the stamps
  for a free #{@reward.card.brand.category.name},
  check your rewards to claim it." :
  "  A stamp has been added to your #{@reward.card.brand.name}
  loyalty card.")

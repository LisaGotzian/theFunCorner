#----------------- Calculating the size of a tent -----------------
# 
# Goal: Trying out different tent models
#
# August 5, 2020, Lisa Gotzian

# the function
tentcalc <- function(
  # Height basics
  fh = 3, # full hight
  sw = 0.5, # height of sidewall
  
  # Roof cones
  r = 2, # top radius
  lr = 2, # lower radius (on the ground)
  
  # Middle roof area
  l = 2, # length of entrance
  
  price = 6.5 # price per m^2
  ){
  
  h = fh-sw # roof height starting from sidewall height
  
  rs = sqrt(h^2+r^2) # roof slope
  
  # Sidewall
  kr = lr-r # "klein R"
  # - length by which the lower radius is larger than the roof
  
  ss = sqrt(sw^2 + kr^2) # sidewall slope
  
  ## Calculating areas
  C = r*s*pi # Lateral surface of cone
  M = rs*l*2 # Middle roof area
  
  # Sidewall
  S = 2*l*ss+ # Middle area of sidewall
    2*pi*r*ss+ # cone sidewall
    (pi*lr-pi*r)/2 # cone sidewall Seite including increase in lower radius
  
  total = C+M+S
  cat(paste("Total area:", total,
            "\nTotal price:", total*price,
            "\nLateral surface of cone:", C,
            "\nMiddle roof area:", M,
            "\nSidewall area:", S))
  
}

# tent with a smaller roof radius than ground radius (spokewheel)
tentcalc(sw = 1.8, r = 0.8, lr = 2)

# trader's tent with a small sidewall but same radius
tentcalc(sw = 0.5, r = 2, lr = 2)


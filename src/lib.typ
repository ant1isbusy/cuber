#import "cube.typ": apply-move, SOLVED-CUBE, FTL-CUBE
#import "render.typ": render-cube, render-LL

#let scramble(algo-string) = {
  let current_state = SOLVED-CUBE
  
  let moves = algo-string.split(" ").filter(m => m != "")

  for move in moves {
    current_state = apply-move(current_state, move)
  }

  render-cube(current_state)
}

#let f2l(algo-string) = {
  let current_state = FTL-CUBE
  let moves = algo-string.split(" ").filter(m => m != "")

  for move in moves {
    current_state = apply-move(current_state, move)
  }
  render-cube(current_state)
}

#let ll(algo-string) = {
  let current_state = SOLVED-CUBE
  let algo-string = "x2 y2 " + algo-string //need to flip cube for LL case, otherwise white on top
  let moves = algo-string.split(" ").filter(m => m != "")

  for move in moves {
    current_state = apply-move(current_state, move)
  }
  render-LL(current_state)
}

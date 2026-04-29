#import "cube.typ": *
#set page(paper: "a4")

#let colors = (
  W: "#FFFFFF",
  Y: "#FFD500",
  G: "#009E60",
  B: "#0051BA",
  R: "#C41E3A",
  O: "#FF5800",
  X: "#777777"
)

#let draw_svg_cube(state) = {
  let svg-data = read("cube.svg")
  
  for (face-name, pieces) in state {
    for (i, color-key) in pieces.enumerate() {
      let placeholder = "#COLOR" + face-name + str(i + 1)
      let actual-hex = colors.at(color-key)
      svg-data = svg-data.replace(placeholder, actual-hex)
    }
  }
  
  image(bytes(svg-data), format: "svg", width: 3cm) 
}

// only need the 3 visible faces for rendering
#let flat_to_render(flat_state) = {
  (
    u: flat_state.slice(0, 9),
    r: flat_state.slice(9, 18),
    f: flat_state.slice(18, 27),
  )
}

#let scramble(algo-string) = {
  let current_state = SOLVED_CUBE
  
  let moves = algo-string.split(" ").filter(m => m != "")

  for move in moves {
    current_state = apply_move(current_state, move)
  }

  draw_svg_cube(flat_to_render(current_state))
}

= Rubik's Cube Engine Test

#figure()[
  #scramble("F R U R' U' F'")
]

#let colors = (
  W: "#FFFFFF",
  Y: "#FFD500",
  G: "#009E60",
  B: "#0051BA",
  R: "#C41E3A",
  O: "#FF5800",
  X: "#333333"
)

// only need the 3 visible faces for rendering
#let flat-to-cube(flat-state) = {
  (
    u: flat-state.slice(0, 9),
    r: flat-state.slice(9, 18),
    f: flat-state.slice(18, 27),
  )
}
#let flat-to-LL(flat-state) = {
  (
    u: flat-state.slice(0, 9),
    r: flat-state.slice(9, 12),
    f: flat-state.slice(18, 21),
    l: flat-state.slice(36, 39),
    b: flat-state.slice(45, 48)
  )
}

#let render-cube(state, w: 3cm, h: auto) = {
  let state = flat-to-cube(state)
  let svg-data = read("cube.svg")
  
  for (face-name, pieces) in state {
    for (i, color-key) in pieces.enumerate() {
      let placeholder = "#COLOR" + face-name + str(i + 1)
      let actual-hex = colors.at(color-key)
      svg-data = svg-data.replace(placeholder, actual-hex)
    }
  }
  
  image(bytes(svg-data), format: "svg", width: w, height: h) 
}

#let render-LL(state, w: 3cm, h: auto) = {
  let state = flat-to-LL(state)
  let svg-data = read("LL.svg")

  for (face-name, pieces) in state {
    if face-name == "d" {
      continue
    }
    for (i, color-key) in pieces.enumerate() {
      let placeholder = "#COLOR" + face-name + str(i)
      let hex = colors.at(color-key)
      svg-data = svg-data.replace(placeholder, hex) 
    }
  }

  image(bytes(svg-data), format: "svg", width: w, height: h)
}

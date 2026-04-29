
#let SOLVED_CUBE = (
  "W", "W", "W", "W", "W", "W", "W", "W", "W", // U (0-8)
  "R", "R", "R", "R", "R", "R", "R", "R", "R", // R (9-17)
  "G", "G", "G", "G", "G", "G", "G", "G", "G", // F (18-26)
  "Y", "Y", "Y", "Y", "Y", "Y", "Y", "Y", "Y", // D (27-35)
  "O", "O", "O", "O", "O", "O", "O", "O", "O", // L (36-44)
  "B", "B", "B", "B", "B", "B", "B", "B", "B"  // B (45-53)
)

#let PERMUTATIONS = (
  "U": (
    // U-face
    6, 3, 0,
    7, 4, 1,
    8, 5, 2,
    // R-face
    45, 46, 47,
    12, 13, 14,
    15, 16, 17,
    // F-face
    9, 10, 11,
    21, 22, 23,
    24, 25, 26,
    // D-face
    27, 28, 29,
    30, 31, 32,
    33, 34, 35,
    // L-face
    18, 19, 20,
    39, 40, 41,
    42, 43, 44,
    // B-face
    36, 37, 38,
    48, 49, 50,
    51, 52, 53
  ),
  "R": (
    // U-face
    0, 1, 20, 
    3, 4, 23,
    6, 7, 26,
    // R-face
    15, 12, 9,
    16, 13, 10,
    17, 14, 11,
    // F-face
    18, 19, 29,
    21, 22, 32,
    24, 25, 35,
    // D-face
    27, 28, 51,
    30, 31, 48,
    33, 34, 45,
    // L-face
    36, 37, 38,
    39, 40, 41,
    42, 43, 44,
    // B-face
    8, 46, 47,
    5, 49, 50,
    2, 52, 53
  ),
  "F": (
    // U-face
    0, 1, 2,
    3, 4, 5,
    44, 41, 38,
    // R-face
    6, 10, 11,
    7, 13, 14,
    8, 16, 17,
    // F-face
    24, 21, 18,
    25, 22, 19,
    26, 23, 20,
    // D-face
    15, 12, 9,
    30, 31, 32,
    33, 34, 35,
    // L-face
    36, 37, 27,
    39, 40, 28,
    42, 43, 29,
    // B-face
    45, 46, 47,
    48, 49, 50,
    51, 52, 53
  ),
  "D": (
    // U-face
    0, 1, 2,
    3, 4, 5,
    6, 7, 8,
    // R-face
    9, 10, 11,
    12, 13, 14,
    24, 25, 26,
    // F-face
    18, 19, 20,
    21, 22, 23,
    42, 43, 44,
    // D-face
    33, 30, 27,
    34, 31, 28,
    35, 32, 29,
    // L-face
    36, 37, 38,
    39, 40, 41,
    51, 52, 53,
    // B-face
    45, 46, 47,
    48, 49, 50,
    15, 16, 17
  ),
  "L": (
    // U-face
    53, 1, 2,
    50, 4, 5,
    47, 7, 8,
    // R-face
    9, 10, 11,
    12, 13, 14,
    15, 16, 17,
    // F-face
    0, 19, 20,
    3, 22, 23,
    6, 25, 26,
    // D-face
    18, 28, 29,
    21, 31, 32,
    24, 34, 35,
    // L-face
    42, 39, 36,
    43, 40, 37,
    44, 41, 38,
    // B-face
    45, 46, 33,
    48, 49, 30,
    51, 52, 27
  ),
  "B": (
    // U-face
    11, 14, 17,
    3, 4, 5,
    6, 7, 8,
    // R-face
    9, 10, 35,
    12, 13, 34,
    15, 16, 33,
    // F-face
    18, 19, 20,
    21, 22, 23,
    24, 25, 26,
    // D-face
    27, 28, 29,
    30, 31, 32,
    36, 39, 42,
    // L-face
    2, 37, 38,
    1, 40, 41,
    0, 43, 44,
    // B-face
    51, 48, 45,
    52, 49, 46,
    53, 50, 47
  )
)

#let apply_base_move(state, move_char) = {
  let map = PERMUTATIONS.at(move_char)
  map.map(idx => state.at(idx))
}

#let apply_move(cube_state, move_str) = {
  let base = move_str.first()
  let is_prime = move_str.ends-with("'")
  let is_double = move_str.ends-with("2")

  let apply_times = if is_double { 2 } else if is_prime { 3 } else { 1 }

  let moves_to_execute = ()
 
  moves_to_execute.push((base, apply_times))
  
  let current_state = cube_state
  for (comp_char, times) in moves_to_execute {
    for _ in range(times) {
      current_state = apply_base_move(current_state, comp_char)
    }
  }

  return current_state
}



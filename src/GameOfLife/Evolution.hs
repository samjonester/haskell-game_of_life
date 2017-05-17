module GameOfLife.Evolution (evolve) where

import GameOfLife.GameBoard
import GameOfLife.Rules (transitionCell)
import GameOfLife.Cell (isNeighbour)

evolve :: GameBoard -> GameBoard
evolve (GameBoard cells) = GameBoard (map evolveCell cells)
  where
    evolveCell cell = transitionCell (neighbours cell cells) cell
    neighbours cell = filter (isNeighbour cell)

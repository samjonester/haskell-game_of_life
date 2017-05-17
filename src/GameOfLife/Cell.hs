module GameOfLife.Cell (Cell(..)) where

import GameOfLife.Position (Position)

data Cell = LivingCell Position | DeadCell Position

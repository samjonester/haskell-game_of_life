module GameOfLife.Position (Position(..)) where

type X = Int
type Y = Int

data Position = Position X Y
  deriving
    Show
